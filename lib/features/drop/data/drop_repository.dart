import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropRepository {
  DropRepository(this._db);
  final AppDatabase _db;

  /// 全ての取引を取得（最新順、リアルタイム監視）
  Stream<List<Drop>> watchAllDrops() {
    debugPrint('[DropRepository] watchAllDrops called');
    return (_db.select(_db.drops)
          ..orderBy([
            (t) => OrderingTerm.desc(t.date),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch()
        .map((rows) {
          debugPrint('[DropRepository] watchAllDrops stream emitted: ${rows.length} items');
          return rows.map((e) => e.toDomain()).toList();
        });
  }

  /// 取引の追加
  Future<int> insertDrop(Drop drop) async {
    debugPrint('[DropRepository] insertDrop: title=${drop.title}, amount=${drop.amount}, categoryId=${drop.dropCategoryId}, bucketId=${drop.bucketId}, toBucketId=${drop.toBucketId}');
    final id = await _db.into(_db.drops).insert(drop.toCompanion());
    debugPrint('[DropRepository] insertDrop completed: generatedId=$id');
    return id;
  }

  /// 取引の更新
  Future<bool> updateDrop(Drop drop) async {
    debugPrint('[DropRepository] updateDrop: id=${drop.id}, title=${drop.title}, amount=${drop.amount}');
    final success = await _db.update(_db.drops).replace(drop.toCompanion());
    debugPrint('[DropRepository] updateDrop completed: success=$success');
    return success;
  }

  /// 取引の削除
  Future<int> deleteDrop(Drop drop) async {
    debugPrint('[DropRepository] deleteDrop: id=${drop.id}');
    final rows = await _db.delete(_db.drops).delete(drop.toCompanion());
    debugPrint('[DropRepository] deleteDrop completed: deletedRows=$rows');
    return rows;
  }

  /// IDによる取引の削除
  Future<int> deleteDropById(int id) async {
    debugPrint('[DropRepository] deleteDropById: id=$id');
    final rows = await (_db.delete(_db.drops)..where((t) => t.id.equals(id))).go();
    debugPrint('[DropRepository] deleteDropById completed: deletedRows=$rows');
    return rows;
  }

  /// 全ての取引を取得
  Future<List<Drop>> getAllDrops() async {
    debugPrint('[DropRepository] getAllDrops called');
    final rows = await (_db.select(_db.drops)
          ..orderBy([
            (t) => OrderingTerm.desc(t.date),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
    debugPrint('[DropRepository] getAllDrops fetched: ${rows.length} items');
    return rows.map((row) => row.toDomain()).toList();
  }
}

// toCompanion
extension DropToCompanion on Drop {
  DropsCompanion toCompanion() => DropsCompanion.insert(
        id: Value.absentIfNull(id),
        title: title,
        amount: amount,
        date: date,
        dropCategoryId: Value(dropCategoryId),
        bucketId: Value(bucketId),
        toBucketId: Value(toBucketId),
        notes: Value(notes),
        parentDropId: Value(parentDropId),
      );
}

// toDomain
extension DropDataToDomain on DropTable {
  Drop toDomain() => Drop(
        id: id,
        title: title,
        amount: amount,
        date: date,
        dropCategoryId: dropCategoryId,
        bucketId: bucketId,
        toBucketId: toBucketId,
        notes: notes,
        parentDropId: parentDropId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

final dropRepositoryProvider = Provider<DropRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DropRepository(db);
});

/// 全ての取引（ドロップ）の StreamProvider
final dropListStreamProvider = StreamProvider<List<Drop>>((ref) {
  return ref.watch(dropRepositoryProvider).watchAllDrops();
});

import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropRepository {
  DropRepository(this._db);
  final AppDatabase _db;

  /// 取引の追加
  Future<int> insertDrop(Drop drop) {
    return _db.into(_db.drops).insert(drop.toCompanion());
  }

  /// 取引の更新
  Future<bool> updateDrop(Drop drop) {
    return _db.update(_db.drops).replace(drop.toCompanion());
  }

  /// 取引の削除
  Future<int> deleteDrop(Drop drop) {
    return _db.delete(_db.drops).delete(drop.toCompanion());
  }

  /// 全ての取引を取得
  Future<List<Drop>> getAllDrops() async {
    final rows = await _db.select(_db.drops).get();
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

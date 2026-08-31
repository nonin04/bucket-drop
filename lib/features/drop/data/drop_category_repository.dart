import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/drop/domain/drop_category.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropCategoryRepository {
  DropCategoryRepository(this._db);
  final AppDatabase _db;

  /// 全てのカテゴリーを取得（並び順ソート、リアルタイム監視）
  Stream<List<DropCategory>> watchAllDropCategories() {
    debugPrint('[DropCategoryRepository] watchAllDropCategories called');
    return (_db.select(_db.dropCategories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch()
        .map((rows) {
          debugPrint('[DropCategoryRepository] watchAllDropCategories stream emitted: ${rows.length} items');
          return rows.map((e) => e.toDomain()).toList();
        });
  }

  /// 全てのカテゴリーを1回取得
  Future<List<DropCategory>> getAllDropCategories() async {
    debugPrint('[DropCategoryRepository] getAllDropCategories called');
    final rows = await (_db.select(_db.dropCategories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
    debugPrint('[DropCategoryRepository] getAllDropCategories fetched: ${rows.length} items');
    return rows.map((e) => e.toDomain()).toList();
  }

  /// カテゴリーの追加
  Future<int> insertDropCategory({
    required String name,
    required DropType dropType,
    int? iconId,
    String? note,
  }) async {
    debugPrint('[DropCategoryRepository] insertDropCategory: name=$name, dropType=${dropType.name}');
    final currentCategories = await getAllDropCategories();
    final maxSort = currentCategories.isEmpty
        ? 0
        : currentCategories
            .map((c) => c.sort)
            .reduce((a, b) => a > b ? a : b);

    final id = await _db.into(_db.dropCategories).insert(
          DropCategoriesCompanion.insert(
            name: name,
            dropType: dropType,
            iconId: iconId ?? 1, // デフォルトアイコン
            note: Value(note),
            sort: Value(maxSort + 1),
          ),
        );
    debugPrint('[DropCategoryRepository] insertDropCategory completed: generatedId=$id');
    return id;
  }

  /// カテゴリーの更新
  Future<bool> updateDropCategory({
    required int id,
    required String name,
    required DropType dropType,
    int? iconId,
    String? note,
  }) async {
    debugPrint('[DropCategoryRepository] updateDropCategory: id=$id, name=$name, dropType=${dropType.name}');
    final success = await (_db.update(_db.dropCategories)..where((t) => t.id.equals(id))).write(
      DropCategoriesCompanion(
        name: Value(name),
        dropType: Value(dropType),
        iconId: iconId != null ? Value(iconId) : const Value.absent(),
        note: Value(note),
        updatedAt: Value(DateTime.now()),
      ),
    ).then((rows) => rows > 0);
    debugPrint('[DropCategoryRepository] updateDropCategory completed: success=$success');
    return success;
  }

  /// カテゴリーの削除
  Future<int> deleteDropCategory(int id) async {
    debugPrint('[DropCategoryRepository] deleteDropCategory: id=$id');
    final rows = await (_db.delete(_db.dropCategories)..where((t) => t.id.equals(id))).go();
    debugPrint('[DropCategoryRepository] deleteDropCategory completed: deletedRows=$rows');
    return rows;
  }
}

// DropCategory toCompanion
extension DropCategoryToCompanion on DropCategory {
  DropCategoriesCompanion toCompanion() => DropCategoriesCompanion.insert(
        id: Value.absentIfNull(id),
        name: name,
        dropType: dropType,
        iconId: iconId,
        note: Value(note),
        sort: Value(sort),
      );
}

// DropCategory toDomain
extension DropCategoryDataToDomain on DropCategoryTable {
  DropCategory toDomain() => DropCategory(
        id: id,
        name: name,
        dropType: dropType,
        iconId: iconId,
        note: note,
        sort: sort,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

final dropCategoryRepositoryProvider = Provider<DropCategoryRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DropCategoryRepository(db);
});

/// 全てのカテゴリーの StreamProvider
final dropCategoryListStreamProvider =
    StreamProvider<List<DropCategory>>((ref) {
  return ref.watch(dropCategoryRepositoryProvider).watchAllDropCategories();
});

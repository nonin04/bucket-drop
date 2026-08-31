import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/drop/domain/drop_category.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropCategoryRepository {
  DropCategoryRepository(this._db);
  final AppDatabase _db;

  /// 全てのカテゴリーを取得（並び順ソート、リアルタイム監視）
  Stream<List<DropCategory>> watchAllDropCategories() {
    return (_db.select(_db.dropCategories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch()
        .map((rows) => rows.map((e) => e.toDomain()).toList());
  }

  /// 全てのカテゴリーを1回取得
  Future<List<DropCategory>> getAllDropCategories() async {
    final rows = await (_db.select(_db.dropCategories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
    return rows.map((e) => e.toDomain()).toList();
  }

  /// カテゴリーの追加
  Future<int> insertDropCategory({
    required String name,
    required DropType dropType,
    int? iconId,
    String? note,
  }) async {
    final currentCategories = await getAllDropCategories();
    final maxSort = currentCategories.isEmpty
        ? 0
        : currentCategories
            .map((c) => c.sort)
            .reduce((a, b) => a > b ? a : b);

    return _db.into(_db.dropCategories).insert(
          DropCategoriesCompanion.insert(
            name: name,
            dropType: dropType,
            iconId: iconId ?? 1, // デフォルトアイコン
            note: Value(note),
            sort: Value(maxSort + 1),
          ),
        );
  }

  /// カテゴリーの更新
  Future<bool> updateDropCategory({
    required int id,
    required String name,
    required DropType dropType,
    int? iconId,
    String? note,
  }) {
    return (_db.update(_db.dropCategories)..where((t) => t.id.equals(id))).write(
      DropCategoriesCompanion(
        name: Value(name),
        dropType: Value(dropType),
        iconId: iconId != null ? Value(iconId) : const Value.absent(),
        note: Value(note),
        updatedAt: Value(DateTime.now()),
      ),
    ).then((rows) => rows > 0);
  }

  /// カテゴリーの削除
  Future<int> deleteDropCategory(int id) {
    return (_db.delete(_db.dropCategories)..where((t) => t.id.equals(id))).go();
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

/// カテゴリー一覧の StreamProvider
final dropCategoryListStreamProvider =
    StreamProvider<List<DropCategory>>((ref) {
  return ref.watch(dropCategoryRepositoryProvider).watchAllDropCategories();
});

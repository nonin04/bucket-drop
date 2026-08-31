import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/core/enums/balance_type.dart';
import 'package:bucket_drop/features/bucket/domain/bucket_category.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BucketCategoryRepository {
  BucketCategoryRepository(this._db);
  final AppDatabase _db;

  /// 全てのバケットカテゴリーを取得（並び順ソート、リアルタイム監視）
  Stream<List<BucketCategory>> watchAllBucketCategories() {
    return (_db.select(_db.bucketCategories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch()
        .map((rows) => rows.map((e) => e.toDomain()).toList());
  }

  /// 全てのバケットカテゴリーを1回取得
  Future<List<BucketCategory>> getAllBucketCategories() async {
    final rows = await (_db.select(_db.bucketCategories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
    return rows.map((e) => e.toDomain()).toList();
  }

  /// バケットカテゴリーの追加
  Future<int> insertBucketCategory({
    required String name,
    required BalanceType balanceType,
  }) async {
    final currentCategories = await getAllBucketCategories();
    final maxSort = currentCategories.isEmpty
        ? 0
        : currentCategories
            .map((c) => c.sort)
            .reduce((a, b) => a > b ? a : b);

    return _db.into(_db.bucketCategories).insert(
          BucketCategoriesCompanion.insert(
            name: name,
            balanceType: balanceType,
            sort: Value(maxSort + 1),
          ),
        );
  }

  /// バケットカテゴリーの更新
  Future<bool> updateBucketCategory({
    required int id,
    required String name,
    required BalanceType balanceType,
  }) {
    return (_db.update(_db.bucketCategories)..where((t) => t.id.equals(id)))
        .write(
          BucketCategoriesCompanion(
            name: Value(name),
            balanceType: Value(balanceType),
            updatedAt: Value(DateTime.now()),
          ),
        )
        .then((rows) => rows > 0);
  }

  /// バケットカテゴリーの削除
  Future<int> deleteBucketCategory(int id) {
    return (_db.delete(_db.bucketCategories)..where((t) => t.id.equals(id)))
        .go();
  }
}

// BucketCategory toCompanion
extension BucketCategoryToCompanion on BucketCategory {
  BucketCategoriesCompanion toCompanion() => BucketCategoriesCompanion.insert(
        id: Value.absentIfNull(id),
        name: name,
        balanceType: balanceType,
        sort: Value(sort),
      );
}

// BucketCategory toDomain
extension BucketCategoryDataToDomain on BucketCategoryTable {
  BucketCategory toDomain() => BucketCategory(
        id: id,
        name: name,
        balanceType: balanceType,
        sort: sort,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

final bucketCategoryRepositoryProvider =
    Provider<BucketCategoryRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return BucketCategoryRepository(db);
});

/// バケットカテゴリー一覧の StreamProvider
final bucketCategoryListStreamProvider =
    StreamProvider<List<BucketCategory>>((ref) {
  return ref.watch(bucketCategoryRepositoryProvider).watchAllBucketCategories();
});

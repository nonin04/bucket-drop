import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BucketRepository {
  BucketRepository(this._db);
  final AppDatabase _db;

  /// 全てのバケットを取得（並び順ソート、リアルタイム監視）
  Stream<List<Bucket>> watchAllBuckets() {
    debugPrint('[BucketRepository] watchAllBuckets called');
    return (_db.select(_db.buckets)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch()
        .map((rows) {
          debugPrint('[BucketRepository] watchAllBuckets stream emitted: ${rows.length} items');
          return rows.map((e) => e.toDomain()).toList();
        });
  }

  /// 全てのバケットを1回取得
  Future<List<Bucket>> getAllBuckets() async {
    debugPrint('[BucketRepository] getAllBuckets called');
    final rows = await (_db.select(_db.buckets)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
    debugPrint('[BucketRepository] getAllBuckets fetched: ${rows.length} items');
    return rows.map((e) => e.toDomain()).toList();
  }

  /// バケットの追加
  Future<int> insertBucket({
    required String name,
    required int bucketCategoryId,
    int? iconId,
    String? notes,
    int? sort,
    bool? isDefaultExpense,
    bool? isDefaultIncome,
  }) async {
    debugPrint('[BucketRepository] insertBucket: name=$name, categoryId=$bucketCategoryId, isDefaultExpense=$isDefaultExpense, isDefaultIncome=$isDefaultIncome');
    return _db.transaction(() async {
      // 支出デフォルトがONの場合、既存の支出デフォルトを解除
      if (isDefaultExpense == true) {
        await _clearDefaultExpense();
      }
      // 収入デフォルトがONの場合、既存の収入デフォルトを解除
      if (isDefaultIncome == true) {
        await _clearDefaultIncome();
      }

      // sortが指定されていない場合は末尾に追加
      final currentSort = sort ??
          await () async {
            final currentBuckets = await getAllBuckets();
            return currentBuckets.isEmpty
                ? 1
                : currentBuckets
                        .map((b) => b.sort)
                        .reduce((a, b) => a > b ? a : b) +
                    1;
          }();

      final id = await _db.into(_db.buckets).insert(
            BucketsCompanion.insert(
              name: name,
              bucketCategoryId: bucketCategoryId,
              iconId: Value(iconId),
              notes: Value(notes),
              sort: Value(currentSort),
              isDefaultExpense: Value(isDefaultExpense),
              isDefaultIncome: Value(isDefaultIncome),
            ),
          );
      debugPrint('[BucketRepository] insertBucket completed: generatedId=$id');
      return id;
    });
  }

  /// バケットの更新
  Future<bool> updateBucket({
    required int id,
    required String name,
    required int bucketCategoryId,
    int? iconId,
    String? notes,
    int? sort,
    bool? isDefaultExpense,
    bool? isDefaultIncome,
  }) async {
    debugPrint('[BucketRepository] updateBucket: id=$id, name=$name, isDefaultExpense=$isDefaultExpense, isDefaultIncome=$isDefaultIncome');
    return _db.transaction(() async {
      // 支出デフォルトがONの場合、他のバケットの支出デフォルトを解除
      if (isDefaultExpense == true) {
        await _clearDefaultExpense(excludeBucketId: id);
      }
      // 収入デフォルトがONの場合、他のバケットの収入デフォルトを解除
      if (isDefaultIncome == true) {
        await _clearDefaultIncome(excludeBucketId: id);
      }

      final rows = await (_db.update(_db.buckets)
            ..where((t) => t.id.equals(id)))
          .write(
        BucketsCompanion(
          name: Value(name),
          bucketCategoryId: Value(bucketCategoryId),
          iconId: Value(iconId),
          notes: Value(notes),
          sort: sort != null ? Value(sort) : const Value.absent(),
          isDefaultExpense: isDefaultExpense != null
              ? Value(isDefaultExpense)
              : const Value.absent(),
          isDefaultIncome: isDefaultIncome != null
              ? Value(isDefaultIncome)
              : const Value.absent(),
          updatedAt: Value(DateTime.now()),
        ),
      );
      debugPrint('[BucketRepository] updateBucket completed: updatedRows=$rows');
      return rows > 0;
    });
  }

  /// 支出デフォルトの個別切り替え
  Future<void> setDefaultExpense(int bucketId, {required bool isDefault}) async {
    debugPrint('[BucketRepository] setDefaultExpense: bucketId=$bucketId, isDefault=$isDefault');
    await _db.transaction(() async {
      if (isDefault) {
        await _clearDefaultExpense(excludeBucketId: bucketId);
      }
      await (_db.update(_db.buckets)..where((t) => t.id.equals(bucketId)))
          .write(
        BucketsCompanion(
          isDefaultExpense: Value(isDefault),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  /// 収入デフォルトの個別切り替え
  Future<void> setDefaultIncome(int bucketId, {required bool isDefault}) async {
    debugPrint('[BucketRepository] setDefaultIncome: bucketId=$bucketId, isDefault=$isDefault');
    await _db.transaction(() async {
      if (isDefault) {
        await _clearDefaultIncome(excludeBucketId: bucketId);
      }
      await (_db.update(_db.buckets)..where((t) => t.id.equals(bucketId)))
          .write(
        BucketsCompanion(
          isDefaultIncome: Value(isDefault),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  /// 既存の支出デフォルトフラグをクリア
  Future<void> _clearDefaultExpense({int? excludeBucketId}) async {
    final query = _db.update(_db.buckets);
    if (excludeBucketId != null) {
      query.where((t) => t.id.equals(excludeBucketId).not());
    }
    await query.write(
      const BucketsCompanion(
        isDefaultExpense: Value(false),
      ),
    );
  }

  /// 既存の収入デフォルトフラグをクリア
  Future<void> _clearDefaultIncome({int? excludeBucketId}) async {
    final query = _db.update(_db.buckets);
    if (excludeBucketId != null) {
      query.where((t) => t.id.equals(excludeBucketId).not());
    }
    await query.write(
      const BucketsCompanion(
        isDefaultIncome: Value(false),
      ),
    );
  }

  /// バケットの並び順（sort）を一括更新
  Future<void> updateSortOrders(List<Bucket> orderedBuckets) async {
    debugPrint('[BucketRepository] updateSortOrders: count=${orderedBuckets.length}');
    await _db.transaction(() async {
      for (var i = 0; i < orderedBuckets.length; i++) {
        final bucket = orderedBuckets[i];
        final newSort = i + 1;
        await (_db.update(_db.buckets)..where((t) => t.id.equals(bucket.id)))
            .write(
          BucketsCompanion(
            sort: Value(newSort),
            updatedAt: Value(DateTime.now()),
          ),
        );
      }
    });
    debugPrint('[BucketRepository] updateSortOrders completed');
  }

  /// バケットの削除
  Future<int> deleteBucket(int id) async {
    debugPrint('[BucketRepository] deleteBucket: id=$id');
    final rows = await (_db.delete(_db.buckets)..where((t) => t.id.equals(id))).go();
    debugPrint('[BucketRepository] deleteBucket completed: deletedRows=$rows');
    return rows;
  }
}

// toCompanion
extension BucketToCompanion on Bucket {
  BucketsCompanion toCompanion() => BucketsCompanion.insert(
        id: Value.absentIfNull(id),
        name: name,
        bucketCategoryId: bucketCategoryId,
        iconId: Value(iconId),
        notes: Value(notes),
        sort: Value(sort),
        isDefaultExpense: Value(isDefaultExpense),
        isDefaultIncome: Value(isDefaultIncome),
      );
}

// toDomain
extension BucketDataToDomain on BucketTable {
  Bucket toDomain() => Bucket(
        id: id,
        name: name,
        bucketCategoryId: bucketCategoryId,
        iconId: iconId,
        notes: notes,
        sort: sort,
        isDefaultExpense: isDefaultExpense,
        isDefaultIncome: isDefaultIncome,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

final bucketRepositoryProvider = Provider<BucketRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return BucketRepository(db);
});

/// 全てのバケット（リアルタイム監視）の StreamProvider
final bucketListStreamProvider = StreamProvider<List<Bucket>>((ref) {
  return ref.watch(bucketRepositoryProvider).watchAllBuckets();
});

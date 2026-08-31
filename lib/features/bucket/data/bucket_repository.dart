import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BucketRepository {
  BucketRepository(this._db);
  final AppDatabase _db;

  /// 全てのバケットを取得（並び順ソート、リアルタイム監視）
  Stream<List<Bucket>> watchAllBuckets() {
    return (_db.select(_db.buckets)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch()
        .map((rows) => rows.map((e) => e.toDomain()).toList());
  }

  /// 全てのバケットを1回取得
  Future<List<Bucket>> getAllBuckets() async {
    final rows = await (_db.select(_db.buckets)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
    return rows.map((e) => e.toDomain()).toList();
  }

  /// バケットの追加
  Future<int> insertBucket({
    required String name,
    required int bucketCategoryId,
    int? iconId,
    String? notes,
  }) async {
    // 既存の最大sort値を取得して末尾に追加
    final currentBuckets = await getAllBuckets();
    final maxSort = currentBuckets.isEmpty
        ? 0
        : currentBuckets.map((b) => b.sort).reduce((a, b) => a > b ? a : b);

    return _db.into(_db.buckets).insert(
          BucketsCompanion.insert(
            name: name,
            bucketCategoryId: bucketCategoryId,
            iconId: Value(iconId),
            notes: Value(notes),
            sort: Value(maxSort + 1),
          ),
        );
  }

  /// バケットの更新
  Future<bool> updateBucket({
    required int id,
    required String name,
    required int bucketCategoryId,
    int? iconId,
    String? notes,
  }) {
    return (_db.update(_db.buckets)..where((t) => t.id.equals(id))).write(
      BucketsCompanion(
        name: Value(name),
        bucketCategoryId: Value(bucketCategoryId),
        iconId: Value(iconId),
        notes: Value(notes),
        updatedAt: Value(DateTime.now()),
      ),
    ).then((rows) => rows > 0);
  }

  /// バケットの削除
  Future<int> deleteBucket(int id) {
    return (_db.delete(_db.buckets)..where((t) => t.id.equals(id))).go();
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
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

final bucketRepositoryProvider = Provider<BucketRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return BucketRepository(db);
});

/// バケット一覧の StreamProvider
final bucketListStreamProvider = StreamProvider<List<Bucket>>((ref) {
  return ref.watch(bucketRepositoryProvider).watchAllBuckets();
});

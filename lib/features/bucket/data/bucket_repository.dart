import 'package:bucket_drop/core/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BucketRepository {
  BucketRepository(this._db);
  final AppDatabase _db;

  /// 全てのバケットを取得（リアルタイム監視）
  Stream<List<BucketTable>> watchAllBuckets() {
    return _db.select(_db.buckets).watch();
  }

  /// 全てのバケットを1回取得
  Future<List<BucketTable>> getAllBuckets() {
    return _db.select(_db.buckets).get();
  }

  /// バケットの追加
  Future<int> insertBucket({
    required String name,
    required int bucketCategoryId,
    required int iconId,
    String? notes,
  }) {
    return _db
        .into(_db.buckets)
        .insert(
          BucketsCompanion.insert(
            name: name,
            bucketCategoryId: bucketCategoryId,
            iconId: Value(iconId),
            notes: Value(notes),
          ),
        );
  }
}

final bucketRepositoryProvider = Provider<BucketRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return BucketRepository(db);
});

final bucketListStreamProvider = StreamProvider<List<BucketTable>>((ref) {
  return ref.watch(bucketRepositoryProvider).watchAllBuckets();
});

import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bucket_repository.g.dart';

@riverpod
BucketRepository bucketRepository(Ref ref) {
  final db = ref.watch(databaseProvider);
  return BucketRepository(db);
}

@riverpod
Stream<List<Bucket>> bucketList(Ref ref) {
  final repository = ref.watch(bucketRepositoryProvider);
  return repository.watchBuckets();
}

class BucketRepository {
  BucketRepository(this._db);
  final AppDatabase _db;

  Stream<List<Bucket>> watchBuckets() {
    debugPrint('◼︎ BucketRepository: watchBuckets()');
    return _db.getBuckets().watch().map(
      (rows) => rows.map((r) => r.toDomain()).toList(),
    );
  }

  Future<List<Bucket>> getBuckets() async {
    debugPrint('◼︎ BucketRepository: getBuckets()');
    final rows = await _db.getBuckets().get();
    return rows.map((r) => r.toDomain()).toList();
  }

  Future<void> createBucket(Bucket bucket) async {
    debugPrint('◼︎ BucketRepository: createBucket(${bucket.name})');
    await _db.createBucket(bucket.toCompanion());
  }

  Future<void> updateBucket(Bucket bucket) async {
    debugPrint('◼︎ BucketRepository: updateBucket(${bucket.id})');
    await _db.updateBucket(
      bucket.name,
      bucket.expectedRate,
      bucket.id,
    );
  }
}

extension on BucketTable {
  Bucket toDomain() => Bucket(
    id: id,
    name: name,
    isIncomeDefault: isIncomeDefault,
    isExpenseDefault: isExpenseDefault,
    bucketCategory: bucketCategory,
    expectedRate: expectedRate,
    sort: sort,
    isArchived: isArchived,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension on Bucket {
  BucketsCompanion toCompanion() => BucketsCompanion.insert(
    name: name,
    isIncomeDefault: Value(isIncomeDefault),
    isExpenseDefault: Value(isExpenseDefault),
    bucketCategory: bucketCategory,
    expectedRate: Value(expectedRate),
    sort: sort,
  );
}

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

class BucketRepository {
  BucketRepository(this._db);
  final AppDatabase _db;

  Future<List<Bucket>> getBuckets() async {
    debugPrint('◼︎ BucketRepository: getBuckets()');
    final rows = await _db.getBuckets().get();
    return rows.map((r) => r.toDomain()).toList();
  }

  Future<void> createBucket(Bucket bucket) async {
    debugPrint('◼︎ BucketRepository: createBucket(${bucket.name})');
    await _db.createBucket(bucket.toCompanion());
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

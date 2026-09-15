import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
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
}

extension on BucketTable {
  Bucket toDomain() => Bucket(
    id: id,
    name: name,
    isIncomeDefault: isIncomeDefault,
    isExpenseDefault: isExpenseDefault,
    bucketCategory: bucketCategory.name,
    expectedRate: expectedRate,
    sort: sort,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

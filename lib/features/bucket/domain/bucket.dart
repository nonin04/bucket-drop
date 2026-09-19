import 'package:bucket_drop/core/enums/bucket_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bucket.freezed.dart';

@freezed
abstract class Bucket with _$Bucket {
  const factory Bucket({
    required int id,
    required String name,
    required bool isIncomeDefault,
    required bool isExpenseDefault,
    required BucketCategory bucketCategory,
    required double expectedRate,
    required int sort,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Bucket;
}

import 'package:bucket_drop/core/enums/balance_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bucket_category.freezed.dart';

@freezed
abstract class BucketCategory with _$BucketCategory {
  const factory BucketCategory({
    required int id,
    required String name,
    required BalanceType balanceType,
    required int sort,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BucketCategory;
}

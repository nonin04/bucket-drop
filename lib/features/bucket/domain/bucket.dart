import 'package:freezed_annotation/freezed_annotation.dart';

part 'bucket.freezed.dart';

@freezed
abstract class Bucket with _$Bucket {
  const factory Bucket({
    required int id,
    required String name,
    required int bucketCategoryId,
    required int sort,
    int? iconId,
    String? notes,
    bool? isDefaultExpense,
    bool? isDefaultIncome,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Bucket;
}

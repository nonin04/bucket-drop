import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drop_category.freezed.dart';

@freezed
abstract class DropCategory with _$DropCategory {
  const factory DropCategory({
    required int id,
    required int iconId,
    required String name,
    required DropType dropType,
    required int sort,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DropCategory;
}

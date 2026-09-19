import 'package:bucket_drop/core/constants/app_icons.dart';
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drop_category.freezed.dart';

@freezed
abstract class DropCategory with _$DropCategory {
  const factory DropCategory({
    required int id,
    required String name,
    required AppIcons icon,
    required DropType dropType,
    required int budget,
    required int sort,
    required bool isSystem,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DropCategory;
}

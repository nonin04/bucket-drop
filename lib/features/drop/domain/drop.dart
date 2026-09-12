import 'package:bucket_drop/core/constants/app_icons.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drop.freezed.dart';

@freezed
abstract class Drop with _$Drop {
  const factory Drop({
    required int id, //テーブル項目
    required String title,
    required int amount,
    required DateTime droppedOn,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? fromBucketId,
    int? toBucketId,
    int? dropCategoryId,
    int? subscribedDropId,
    int? parentDropId,
    String? notes,
    String? fromBucketName,
    String? toBucketName,
    String? dropCategoryName,
    AppIcons? dropCategoryIcon,
    String? subscribedDropTitle,
    String? subscribedDropName,
    String? subscribedDropNotes,
  }) = _Drop;
}

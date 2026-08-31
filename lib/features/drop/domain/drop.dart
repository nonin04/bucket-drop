import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drop.freezed.dart';

@freezed
abstract class Drop with _$Drop {
  const factory Drop({
    required String title, // タイトル
    required int amount, // 金額
    required DateTime date, // 日付
    int? id, // id
    int? dropCategoryId, // カテゴリーID
    int? bucketId, // バケットID
    int? toBucketId, // ToバケットID
    int? parentDropId, // 親ドロップID
    String? notes, // メモ
    DateTime? createdAt, // 作成日時
    DateTime? updatedAt, // 更新日時
  }) = _Drop;
}

import 'package:flutter/material.dart';

class AppColors {
  // 基本色（未分類、その他、ベース用）
  static const Color black = Color(0xFF1E1E1E); // やわらかい黒（チャコール）
  static const Color slate = Color(0xFF475569); // スレートグレー

  // カテゴリ用アクセント（厳選6色）
  static const Color coralRed = Color(0xFFE06D53); // 食費・交際費など（暖かみのある赤橙）
  static const Color oliveGreen = Color(0xFF5B8A64); // 日用品・ヘルスケア（深めのオリーブ緑）
  static const Color mistyBlue = Color(0xFF4A7C9D); // 住居・水道光熱費（落ち着いたくすみブルー）
  static const Color mustard = Color(0xFFD49B35); // 交通費・娯楽（マスタードイエロー）
  static const Color mutedGrape = Color(0xFF7E6B8F); // 通信費・サブスク（スモーキーな紫）
  static const Color sandBrown = Color(0xFF9E7D63); // 美容・衣料・その他（サンドブラウン）

  // UIピッカー用のリスト（基本の黒 + 厳選アクセント）
  static const List<Color> presets = [
    black,
    slate,
    coralRed,
    oliveGreen,
    mistyBlue,
    mustard,
    mutedGrape,
    sandBrown,
  ];

  static const Color defaultColor = black;
}

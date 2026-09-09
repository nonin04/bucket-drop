import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  useMaterial3: true,
  // ステータスバーを透明に、アイコンを黒に
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  // NavigationBarのグローバルテーマ設定
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255), // 背景色
    indicatorColor: Colors.transparent,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(fontSize: 10),
    ),
  ),
);

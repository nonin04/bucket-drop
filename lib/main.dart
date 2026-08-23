import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/home/presentation/home_screen.dart';
import 'package:bucket_drop/features/calendar/presentation/calendar_screen.dart';
import 'package:bucket_drop/features/analytics/presentation/analytics_screen.dart';
import 'package:bucket_drop/features/export/presentation/export_screen.dart';
import 'package:bucket_drop/features/settings/presentation/settings_screen.dart';
import 'package:bucket_drop/features/navigation/presentation/index_controller.dart';
import 'package:bucket_drop/features/navigation/presentation/app_navigation_bar.dart';

void main() {
  debugPaintSizeEnabled = false; // ウィジェットの境界線（形）を表示する
  final database = AppDatabase(); //追加
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hello world",
      home: const MainPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        useMaterial3: true,
        // NavigationBarのグローバルテーマ設定
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color.fromARGB(255, 245, 245, 247), // 背景色
          indicatorColor: Colors.transparent,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            return const TextStyle(fontSize: 10);
          }),
        ),
      ),
    );
  }
}

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indexProvider);

    final List<Widget> pages = [
      const HomeScreen(),
      const CalendarScreen(),
      const AnalyticsScreen(),
      const ExportScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: const AppNavigationBar(),
    );
  }
}

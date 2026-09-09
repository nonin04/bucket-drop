import 'package:bucket_drop/app/theme.dart';
import 'package:bucket_drop/features/navigation/presentation/app_navigation_bar.dart';
import 'package:bucket_drop/features/navigation/presentation/index_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  debugPaintSizeEnabled = false; // ウィジェットの境界線（形）を表示する
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      theme: appTheme,
    );
  }
}

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indexProvider);

    final List<Widget> pages = [
      // const HomeScreen(),
      // const CalendarScreen(),
      // const AnalyticsScreen(),
      // const ExportScreen(),
      // const SettingsScreen(),
    ];

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: true (デフォルト) によりキーボード出現時にスクロール領域を確保
        body: IndexedStack(index: currentIndex, children: pages),
        bottomNavigationBar: const AppNavigationBar(),
      ),
    );
  }
}

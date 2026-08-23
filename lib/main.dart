import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bucket_drop/test_page_1.dart';
import 'package:bucket_drop/test_page_2.dart';
import 'package:bucket_drop/test_page_3.dart';
import 'package:bucket_drop/test_page_4.dart';
import 'package:bucket_drop/test_page_5.dart';
import 'package:bucket_drop/index_notifier.dart';
import 'package:bucket_drop/app_navigation_bar.dart';

void main() {
  debugPaintSizeEnabled = false; // ウィジェットの境界線（形）を表示する
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
      const TestPage1(),
      const TestPage2(),
      const TestPage3(),
      const TestPage4(),
      const TestPage5(),
    ];

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: const AppNavigationBar(),
    );
  }
}

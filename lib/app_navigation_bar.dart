import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bucket_drop/index_notifier.dart';
import 'package:material_symbols_icons/symbols.dart';

class AppNavigationBar extends ConsumerWidget {
  const AppNavigationBar({super.key});

  // Material Symbols用の共通Destination生成メソッド
  NavigationDestination _buildDestination({
    required IconData icon,
    required String label,
  }) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: Colors.black,
        fill: 0.0,
        weight: 400,
        grade: -25,
        opticalSize: 24,
      ),
      selectedIcon: Icon(
        icon,
        color: Colors.black,
        fill: 1.0,
        weight: 400,
        grade: -25,
        opticalSize: 24,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indexProvider);

    return NavigationBar(
      height: 70,
      backgroundColor: Colors.white,
      selectedIndex: currentIndex,
      onDestinationSelected: (int index) {
        ref.read(indexProvider.notifier).setIndex(index);
      },
      destinations: <Widget>[
        _buildDestination(icon: Symbols.home_rounded, label: 'ホーム'),
        _buildDestination(icon: Symbols.calendar_month_rounded, label: 'カレンダー'),
        _buildDestination(icon: Symbols.area_chart_rounded, label: '分析'),
        _buildDestination(icon: Symbols.save_as_rounded, label: 'エクスポート'),
        _buildDestination(icon: Symbols.settings_rounded, label: '設定'),
      ],
    );
  }
}

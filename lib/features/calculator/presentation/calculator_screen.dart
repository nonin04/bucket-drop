import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bucket_drop/features/calculator/presentation/calculator_controller.dart';

class CalculatorPage extends ConsumerWidget {
  const CalculatorPage({super.key});

  // 3桁区切りのカンマを挿入するメソッド
  String _formatWithCommas(String value) {
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return value.replaceAll(reg, ',');
  }

  // 個々のキーをビルドするヘルパーメソッド（軽量なGestureDetector+Container構成）
  Widget _buildKey(WidgetRef ref, String key) {
    final notifier = ref.read(calculatorProvider.notifier);

    Color bgColor = const Color.fromARGB(255, 249, 249, 249);
    Color fgColor;
    VoidCallback? onTap;

    GestureLongPressStartCallback? onLongPressStart;
    GestureLongPressEndCallback? onLongPressEnd;
    GestureLongPressUpCallback? onLongPressUp;

    if (key == 'C') {
      fgColor = const Color.fromARGB(255, 255, 183, 0);
      onTap = () => notifier.clear();
    } else if (key == 'Delete') {
      fgColor = const Color.fromARGB(255, 255, 1, 1);
      onTap = () => notifier.deleteDigit();
      onLongPressStart = (_) => notifier.startAutoDelete();
      onLongPressEnd = (_) => notifier.stopAutoDelete();
      onLongPressUp = () => notifier.stopAutoDelete();
    } else {
      fgColor = Colors.black;
      onTap = () => notifier.inputDigit(key);
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: onTap,
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          onLongPressUp: onLongPressUp,
          behavior: HitTestBehavior.opaque, // タッチ領域をContainer全体に広げる
          child: Container(
            height: 60, // 縦横比を整えるための固定の高さ
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                key,
                style: TextStyle(
                  fontSize: key == 'Delete' ? 20 : 24,
                  fontWeight: FontWeight.w500,
                  color: fgColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 現在値の表示エリア
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 208, 208, 208),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Consumer(
              builder: (context, ref, child) {
                final result = ref.watch(calculatorProvider);
                return Text(
                  '${_formatWithCommas(result)}円',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // テンキー部分（軽量なRow/Columnで固定配置）
          Column(
            children: [
              Row(
                children: [
                  _buildKey(ref, '1'),
                  _buildKey(ref, '2'),
                  _buildKey(ref, '3'),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  _buildKey(ref, '4'),
                  _buildKey(ref, '5'),
                  _buildKey(ref, '6'),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  _buildKey(ref, '7'),
                  _buildKey(ref, '8'),
                  _buildKey(ref, '9'),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  _buildKey(ref, 'C'),
                  _buildKey(ref, '0'),
                  _buildKey(ref, 'Delete'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

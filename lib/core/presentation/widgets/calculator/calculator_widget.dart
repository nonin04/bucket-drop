import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorWidget extends ConsumerWidget {
  const CalculatorWidget({super.key});

  // 個々のキーをビルドするヘルパーメソッド（軽量なGestureDetector+Container構成）
  Widget _buildKey(WidgetRef ref, String text, int key) {
    final notifier = ref.read(transactionInputControllerProvider.notifier);

    const bgColor = Color.fromARGB(255, 245, 245, 247);
    Color fgColor;

    if (key == 10) {
      fgColor = const Color.fromARGB(255, 255, 183, 0);
    } else if (key == 11) {
      fgColor = const Color.fromARGB(255, 255, 1, 1);
    } else {
      fgColor = Colors.black;
    }

    return Expanded(
      child: GestureDetector(
        onTapDown: (_) {
          if (key == 11) {
            notifier.startDelete();
          } else if (key == 10) {
            notifier.clearAmount();
          } else {
            notifier.inputDigit(text);
          }
        },
        onTapUp: key == 11 ? (_) => notifier.stopDelete() : null,
        onTapCancel: key == 11 ? notifier.stopDelete : null,
        behavior: HitTestBehavior.opaque, // タッチ領域をContainer全体に広げる
        child: Container(
          height: 60, // 縦横比を整えるための固定の高さ
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: key == 11 ? 20 : 24,
                fontWeight: FontWeight.w500,
                color: fgColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 余白入れる 8px
    return Column(
      spacing: 8,
      children: [
        Row(
          spacing: 8,
          children: [
            _buildKey(ref, '1', 1),
            _buildKey(ref, '2', 2),
            _buildKey(ref, '3', 3),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            _buildKey(ref, '4', 4),
            _buildKey(ref, '5', 5),
            _buildKey(ref, '6', 6),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            _buildKey(ref, '7', 7),
            _buildKey(ref, '8', 8),
            _buildKey(ref, '9', 9),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            _buildKey(ref, 'C', 10),
            _buildKey(ref, '0', 0),
            _buildKey(ref, '⌫', 11),
          ],
        ),
      ],
    );
  }
}

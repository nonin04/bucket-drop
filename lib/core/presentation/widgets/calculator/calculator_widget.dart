import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorWidget extends ConsumerWidget {
  const CalculatorWidget({super.key});

  // 個々のキーをビルドするヘルパーメソッド（軽量なGestureDetector+Container構成）
  Widget _buildKey(WidgetRef ref, String key) {
    final notifier = ref.read(transactionInputControllerProvider.notifier);

    const bgColor = Color.fromARGB(255, 245, 245, 247);
    Color fgColor;

    if (key == 'C') {
      fgColor = const Color.fromARGB(255, 255, 183, 0);
    } else if (key == 'Delete') {
      fgColor = const Color.fromARGB(255, 255, 1, 1);
    } else {
      fgColor = Colors.black;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTapDown: (_) {
            if (key == 'Delete') {
              notifier.startDelete();
            } else if (key == 'C') {
              notifier.clearAmount();
            } else {
              notifier.inputDigit(key);
            }
          },
          onTapUp: key == 'Delete' ? (_) => notifier.stopDelete() : null,
          onTapCancel: key == 'Delete' ? () => notifier.stopDelete() : null,
          behavior: HitTestBehavior.opaque, // タッチ領域をContainer全体に広げる
          child: Container(
            height: 60, // 縦横比を整えるための固定の高さ
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10.0),
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
      padding: const EdgeInsets.all(8.0),
      // mainAxisSize: MainAxisSize.min,
      // children: [
      //   // 現在値の表示エリア
      //   Container(
      //     margin: const EdgeInsets.symmetric(
      //       horizontal: 4.0,
      //     ),
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: 20.0,
      //       vertical: 8.0,
      //     ),
      //     alignment: Alignment.centerRight,
      //     child: Consumer(
      //       builder: (context, ref, child) {
      //         final result = ref.watch(calculatorProvider);
      //         return Text(
      //           '${_formatWithCommas(result)}円',
      //           style: const TextStyle(
      //             fontSize: 32,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // テンキー部分（軽量なRow/Columnで固定配置）
      child: Column(
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
    );
  }
}

import 'package:bucket_drop/core/presentation/widgets/calculator/calculator_controller.dart';
import 'package:bucket_drop/core/presentation/widgets/transaction_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReceiptWidget extends ConsumerWidget {
  const ReceiptWidget({super.key});

  // 3桁区切りのカンマを挿入するメソッド
  String _formatWithCommas(String value) {
    if (value.isEmpty) return '0';
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return value.replaceAll(reg, ',');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(calculatorProvider);
    final title = ref.watch(transactionTitleProvider);

    final now = DateTime.now();
    final formattedDate =
        "${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 249, 250),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 金額表示
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  '金額',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '¥ ${_formatWithCommas(amount)}',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 40, 40, 40),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 24,
              thickness: 1,
              color: Color.fromARGB(255, 230, 230, 235),
            ),

            // 日付
            _buildRow('日付', formattedDate),
            const SizedBox(height: 10),

            // メモ・品名
            _buildRow('メモ', title.isEmpty ? 'なし' : title),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 60, 60, 60),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

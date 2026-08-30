import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/bucket/data/bucket_repository.dart';
import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
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
    final formState = ref.watch(transactionInputControllerProvider);
    final amount = formState.amount;
    final title = formState.title;

    final bucketsAsync = ref.watch(bucketListStreamProvider);
    final buckets = bucketsAsync.value ?? [];
    final fromBucket = buckets
        .where((b) => b.id == formState.bucketId)
        .firstOrNull;
    final toBucket = buckets
        .where((b) => b.id == formState.toBucketId)
        .firstOrNull;

    final now = DateTime.now();
    final formattedDate =
        '${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}';

    final String bucketDisplay;
    if (formState.dropType == DropType.transfer) {
      final fromName = fromBucket?.name ?? '未選択';
      final toName = toBucket?.name ?? '未選択';
      bucketDisplay = '$fromName → $toName';
    } else {
      bucketDisplay = fromBucket?.name ?? '未選択';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 249, 250),
          borderRadius: BorderRadius.circular(16),
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

            // 種別（収入・支出・振替）
            _buildRow('種別', formState.dropType.label),
            const SizedBox(height: 12),

            // バケット
            _buildRow('バケット', bucketDisplay),
            const SizedBox(height: 12),

            // 日付
            _buildRow('日付', formattedDate),
            const SizedBox(height: 12),

            // メモ・品名
            _buildRow('タイトル', title.isEmpty ? 'なし' : title),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    const rowStrutStyle = StrutStyle(
      fontSize: 13,
      height: 1.2,
      forceStrutHeight: true,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          strutStyle: rowStrutStyle,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Text(
            value,
            strutStyle: rowStrutStyle,
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 60, 60, 60),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

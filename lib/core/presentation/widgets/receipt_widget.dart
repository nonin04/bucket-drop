import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/bucket/data/bucket_repository.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
import 'package:bucket_drop/features/drop/data/drop_category_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop_category.dart';
import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// コンパクトで洗練されたレシートプレビューウィジェット
class ReceiptWidget extends ConsumerWidget {
  const ReceiptWidget({super.key});

  // 3桁区切りのカンマフォーマット
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
    final dropType = formState.dropType;

    // カテゴリー
    final categoriesAsync = ref.watch(dropCategoryListStreamProvider);
    final categories = categoriesAsync.value ?? <DropCategory>[];
    final selectedCategory = categories
        .where((c) => c.id == formState.dropCategoryId)
        .firstOrNull;

    // バケット
    final bucketsAsync = ref.watch(bucketListStreamProvider);
    final buckets = bucketsAsync.value ?? <Bucket>[];
    final fromBucket = buckets
        .where((b) => b.id == formState.bucketId)
        .firstOrNull;
    final toBucket = buckets
        .where((b) => b.id == formState.toBucketId)
        .firstOrNull;

    // 日付フォーマット（例: 8/31(月)）
    final now = DateTime.now();
    const weekdays = ['月', '火', '水', '木', '金', '土', '日'];
    final formattedShortDate =
        '${now.month}/${now.day}(${weekdays[now.weekday - 1]})';

    final String bucketDisplay;
    if (dropType == DropType.transfer) {
      final fromName = fromBucket?.name ?? '未選択';
      final toName = toBucket?.name ?? '未選択';
      bucketDisplay = '$fromName → $toName';
    } else {
      bucketDisplay = fromBucket?.name ?? '未選択';
    }

    final typeColor = _getTypeColor(dropType);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 249, 250),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color.fromARGB(255, 235, 236, 240),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ① 上段: 日付 + 種別バッジ + カテゴリーバッジ + バケット名
            Row(
              children: [
                // 日付
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 13,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      formattedShortDate,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),

                // 種別バッジ
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: typeColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    dropType.label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: typeColor,
                    ),
                  ),
                ),
                const SizedBox(width: 6),

                // カテゴリーバッジ
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: selectedCategory != null
                        ? Colors.grey.shade200
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                    border: selectedCategory == null
                        ? Border.all(color: Colors.grey.shade300)
                        : null,
                  ),
                  child: Text(
                    selectedCategory?.name ?? '未分類',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: selectedCategory != null
                          ? FontWeight.bold
                          : FontWeight.w500,
                      color: selectedCategory != null
                          ? Colors.black87
                          : Colors.grey.shade500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // バケット名（右寄せ）
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 13,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          bucketDisplay,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ② 中段: タイトル（入力がある場合のみ表示）
            if (title.isNotEmpty) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.edit_note_rounded,
                    size: 14,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 8),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 8),

            // ③ ⭐️ 下段: 金額表示（主役として下に配置）
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  '金額',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '¥ ${_formatWithCommas(amount)}',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 30, 30, 30),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getTypeColor(DropType type) {
    switch (type) {
      case DropType.expense:
        return const Color(0xFFB33939); // 渋い赤
      case DropType.income:
        return const Color(0xFF2C5E8A); // 渋い青
      case DropType.transfer:
        return const Color(0xFF2E7D5B); // 渋い緑
    }
  }
}

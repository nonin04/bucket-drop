import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/bucket/data/bucket_repository.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
import 'package:bucket_drop/features/drop/data/drop_category_repository.dart';
import 'package:bucket_drop/features/drop/data/drop_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
import 'package:bucket_drop/features/drop/domain/drop_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  // 3桁区切りのカンマフォーマット
  String _formatCurrency(int amount) {
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return amount.toString().replaceAll(reg, ',');
  }

  // 日時フォーマット (YYYY/MM/DD HH:mm)
  String _formatDateTime(DateTime dt) {
    final y = dt.year;
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    final h = dt.hour.toString().padLeft(2, '0');
    final min = dt.minute.toString().padLeft(2, '0');
    return '$y/$m/$d $h:$min';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropsAsync = ref.watch(dropListStreamProvider);
    final categoriesAsync = ref.watch(dropCategoryListStreamProvider);
    final bucketsAsync = ref.watch(bucketListStreamProvider);

    final categories = categoriesAsync.value ?? <DropCategory>[];
    final buckets = bucketsAsync.value ?? <Bucket>[];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 247),
      appBar: AppBar(
        title: const Text(
          '取引履歴',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: dropsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text('取引の読み込みに失敗しました: $err'),
        ),
        data: (drops) {
          if (drops.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 56,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '登録された取引がまだありません',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ホーム画面から取引を追加してみてください',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            itemCount: drops.length,
            itemBuilder: (context, index) {
              final drop = drops[index];

              // 紐づくカテゴリーを取得
              final category = categories
                  .where((c) => c.id == drop.dropCategoryId)
                  .firstOrNull;

              // 紐づくバケットを取得
              final fromBucket =
                  buckets.where((b) => b.id == drop.bucketId).firstOrNull;
              final toBucket =
                  buckets.where((b) => b.id == drop.toBucketId).firstOrNull;

              return _buildDropCard(
                context,
                ref,
                drop: drop,
                category: category,
                fromBucket: fromBucket,
                toBucket: toBucket,
              );
            },
          );
        },
      ),
    );
  }

  /// 各取引（Drop）のカードウィジェット
  Widget _buildDropCard(
    BuildContext context,
    WidgetRef ref, {
    required Drop drop,
    required DropCategory? category,
    required Bucket? fromBucket,
    required Bucket? toBucket,
  }) {
    final dropType = category?.dropType ?? DropType.expense;

    // タイプごとの色と記号
    final Color typeColor;
    final String sign;
    final IconData typeIcon;

    switch (dropType) {
      case DropType.expense:
        typeColor = Colors.redAccent.shade400;
        sign = '-';
        typeIcon = Icons.shopping_bag_outlined;
      case DropType.income:
        typeColor = Colors.blue.shade600;
        sign = '+';
        typeIcon = Icons.attach_money;
      case DropType.transfer:
        typeColor = Colors.teal.shade600;
        sign = '';
        typeIcon = Icons.swap_horiz;
    }

    // バケット表示文字列
    final String bucketDisplay;
    if (dropType == DropType.transfer) {
      final from = fromBucket?.name ?? '未選択';
      final to = toBucket?.name ?? '未選択';
      bucketDisplay = '$from → $to';
    } else {
      bucketDisplay = fromBucket?.name ?? '未選択';
    }

    final categoryName = category?.name ?? '未分類';
    final titleText = drop.title.isNotEmpty ? drop.title : categoryName;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 上段: カテゴリーバッジ・日付・削除ボタン
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: typeColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(typeIcon, size: 14, color: typeColor),
                          const SizedBox(width: 4),
                          Text(
                            categoryName,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: typeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      _formatDateTime(drop.date),
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        size: 18,
                        color: Colors.grey.shade400,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      tooltip: '削除',
                      onPressed: () => _handleDelete(context, ref, drop),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 中段: タイトル と 金額
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    titleText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '$sign¥ ${_formatCurrency(drop.amount)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: typeColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Color(0xFFF0F0F0)),
            const SizedBox(height: 8),

            // 下段: バケット名
            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 14,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    bucketDisplay,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 取引削除の確認と実行
  Future<void> _handleDelete(
    BuildContext context,
    WidgetRef ref,
    Drop drop,
  ) async {
    if (drop.id == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('取引の削除'),
        content: const Text('この取引データを削除してもよろしいですか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('キャンセル'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red.shade600,
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('削除'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      try {
        await ref.read(dropRepositoryProvider).deleteDropById(drop.id!);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('取引を削除しました'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } on Exception catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('削除に失敗しました: $e')),
          );
        }
      }
    }
  }
}

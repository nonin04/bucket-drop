import 'dart:async';

import 'package:bucket_drop/features/bucket/data/bucket_category_repository.dart';
import 'package:bucket_drop/features/bucket/data/bucket_repository.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
import 'package:bucket_drop/features/bucket/domain/bucket_category.dart';
import 'package:bucket_drop/features/bucket/presentation/widgets/bucket_form_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// バケット（口座・財布など）のマスタ管理画面
class BucketMasterScreen extends ConsumerWidget {
  const BucketMasterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(bucketCategoryListStreamProvider);
    final bucketsAsync = ref.watch(bucketListStreamProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 247),
      appBar: AppBar(
        title: const Text(
          'バケット管理',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: categoriesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text('カテゴリーの取得に失敗しました: $err'),
        ),
        data: (categories) {
          return bucketsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(
              child: Text('バケットの取得に失敗しました: $err'),
            ),
            data: (buckets) {
              if (categories.isEmpty && buckets.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 48,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'バケットがまだ登録されていません',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final categoryBuckets = buckets
                      .where((b) => b.bucketCategoryId == category.id)
                      .toList();

                  return _buildCategorySection(
                    context,
                    category: category,
                    buckets: categoryBuckets,
                  );
                },
              );
            },
          );
        },
      ),
      // 右下の新規登録FAB
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          unawaited(BucketFormModal.show(context));
        },
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text(
          'バケットを追加',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /// カテゴリーごとのセクション（ヘッダー ＋ バケットリストカード）
  Widget _buildCategorySection(
    BuildContext context, {
    required BucketCategory category,
    required List<Bucket> buckets,
  }) {
    final isAsset = category.balanceType.isAsset;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // カテゴリーヘッダー
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: isAsset
                            ? Colors.blue.shade50
                            : Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        isAsset ? '資産' : '負債',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isAsset
                              ? Colors.blue.shade700
                              : Colors.orange.shade700,
                        ),
                      ),
                    ),
                    Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '(${buckets.length})',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                // カテゴリーごとの「＋」ボタン
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, size: 20),
                  color: Colors.blue.shade600,
                  tooltip: '${category.name} に追加',
                  onPressed: () {
                    unawaited(
                      BucketFormModal.show(
                        context,
                        initialCategoryId: category.id,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // バケット一覧カード
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: buckets.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        '登録されているバケットはありません',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: buckets.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      indent: 52,
                      color: Color(0xFFEEEEEE),
                    ),
                    itemBuilder: (context, index) {
                      final bucket = buckets[index];
                      return ListTile(
                        leading: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: isAsset
                                ? Colors.blue.shade50
                                : Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            isAsset
                                ? Icons.account_balance_wallet
                                : Icons.credit_card,
                            color: isAsset
                                ? Colors.blue.shade600
                                : Colors.orange.shade600,
                            size: 20,
                          ),
                        ),
                        title: Text(
                          bucket.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: bucket.notes != null && bucket.notes!.isNotEmpty
                            ? Text(
                                bucket.notes!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            : null,
                        trailing: const Icon(
                          Icons.chevron_right,
                          size: 18,
                          color: Colors.black26,
                        ),
                        onTap: () {
                          unawaited(
                            BucketFormModal.show(
                              context,
                              bucket: bucket,
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/drop/data/drop_category_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop_category.dart';
import 'package:bucket_drop/features/drop/presentation/widgets/drop_category_form_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ドロップカテゴリー（支出・収入・振替項目）のマスタ管理画面
class DropCategoryMasterScreen extends ConsumerWidget {
  const DropCategoryMasterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(dropCategoryListStreamProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 247),
      appBar: AppBar(
        title: const Text(
          'カテゴリー管理',
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
          if (categories.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.category_outlined,
                    size: 48,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'カテゴリーがまだ登録されていません',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }

          // 支出、収入、振替に分類
          final expenseCategories = categories
              .where((c) => c.dropType == DropType.expense)
              .toList();
          final incomeCategories = categories
              .where((c) => c.dropType == DropType.income)
              .toList();
          final transferCategories = categories
              .where((c) => c.dropType == DropType.transfer)
              .toList();

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
            children: [
              _buildSection(
                context,
                title: '支出カテゴリー',
                dropType: DropType.expense,
                color: Colors.redAccent,
                categories: expenseCategories,
              ),
              _buildSection(
                context,
                title: '収入カテゴリー',
                dropType: DropType.income,
                color: Colors.blueAccent,
                categories: incomeCategories,
              ),
              _buildSection(
                context,
                title: '振替カテゴリー',
                dropType: DropType.transfer,
                color: Colors.green,
                categories: transferCategories,
              ),
            ],
          );
        },
      ),
      // 右下の新規登録FAB
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          unawaited(DropCategoryFormModal.show(context));
        },
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text(
          'カテゴリーを追加',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /// 区分ごとのセクション（ヘッダー ＋ カテゴリーリストカード）
  Widget _buildSection(
    BuildContext context, {
    required String title,
    required DropType dropType,
    required Color color,
    required List<DropCategory> categories,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // セクションヘッダー
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 14,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '(${categories.length})',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                // セクションの「＋」ボタン
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, size: 20),
                  color: Colors.blue.shade600,
                  tooltip: '$title に追加',
                  onPressed: () {
                    unawaited(
                      DropCategoryFormModal.show(
                        context,
                        initialDropType: dropType,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // リストカード
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
            child: Material(
              color: Colors.white,
              child: categories.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          '登録されているカテゴリーはありません',
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
                      itemCount: categories.length,
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        indent: 52,
                        color: Color(0xFFEEEEEE),
                      ),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return ListTile(
                        leading: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            _getCategoryIcon(dropType),
                            color: color,
                            size: 20,
                          ),
                        ),
                        title: Text(
                          category.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: category.note != null && category.note!.isNotEmpty
                            ? Text(
                                category.note!,
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
                            DropCategoryFormModal.show(
                              context,
                              category: category,
                            ),
                          );
                        },
                      );
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(DropType dropType) {
    switch (dropType) {
      case DropType.expense:
        return Icons.shopping_bag_outlined;
      case DropType.income:
        return Icons.attach_money;
      case DropType.transfer:
        return Icons.swap_horiz;
    }
  }
}

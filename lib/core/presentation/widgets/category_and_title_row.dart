import 'dart:async';

import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/drop/data/drop_category_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop_category.dart';
import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:bucket_drop/features/drop/presentation/widgets/drop_category_picker_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 横スクロールカテゴリークイックチップ ＆ クリーンなタイトル入力
class CategoryAndTitleRow extends HookConsumerWidget {
  const CategoryAndTitleRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // リセット回数を監視
    final resetKey = ref.watch(
      transactionInputControllerProvider.select((s) => s.resetKey),
    );
    final textController = useTextEditingController(
      keys: [resetKey],
    );
    final focusNode = useFocusNode();

    // 取引タイプと選択中のカテゴリーIDを監視
    final dropType = ref.watch(
      transactionInputControllerProvider.select((s) => s.dropType),
    );
    final selectedCategoryId = ref.watch(
      transactionInputControllerProvider.select((s) => s.dropCategoryId),
    );

    // カテゴリー一覧を監視
    final categoriesAsync = ref.watch(dropCategoryListStreamProvider);
    final categories = categoriesAsync.value ?? <DropCategory>[];
    final filteredCategories =
        categories.where((c) => c.dropType == dropType).toList();

    final activeColor = _getThemeColor(dropType);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ① ⭐️ 横スクロールクイックカテゴリーチップ
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: filteredCategories.length + 1, // 末尾に「一覧」ボタン
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                // 末尾の「もっと見る（一覧）」ボタン
                if (index == filteredCategories.length) {
                  return _buildMoreCategoriesButton(
                    context,
                    ref,
                    filteredCategories: filteredCategories,
                    selectedCategoryId: selectedCategoryId,
                    dropType: dropType,
                  );
                }

                final category = filteredCategories[index];
                final isSelected = category.id == selectedCategoryId;

                return _buildCategoryChip(
                  ref,
                  category: category,
                  isSelected: isSelected,
                  activeColor: activeColor,
                  dropType: dropType,
                );
              },
            ),
          ),

          // ② ⭐️ スッキリしたインラインタイトル入力欄
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 245, 247),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 235, 236, 240),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.edit_note_rounded,
                  size: 18,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: textController,
                    focusNode: focusNode,
                    onChanged: (value) => ref
                        .read(transactionInputControllerProvider.notifier)
                        .updateTitle(value),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      hintText: 'タイトル・品名（任意）',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// クイックカテゴリーチップ
  Widget _buildCategoryChip(
    WidgetRef ref, {
    required DropCategory category,
    required bool isSelected,
    required Color activeColor,
    required DropType dropType,
  }) {
    return Material(
      color: isSelected
          ? activeColor
          : const Color.fromARGB(255, 245, 245, 247),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          unawaited(HapticFeedback.selectionClick());
          final notifier = ref.read(transactionInputControllerProvider.notifier);
          if (isSelected) {
            notifier.updateDropCategoryId(null); // 再タップで解除
          } else {
            notifier.updateDropCategoryId(category.id);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? activeColor
                  : const Color.fromARGB(255, 230, 232, 238),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getCategoryIcon(dropType),
                size: 14,
                color: isSelected ? Colors.white : Colors.grey.shade700,
              ),
              const SizedBox(width: 6),
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  color: isSelected ? Colors.white : const Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 「もっと見る」ボタン（全モーダル表示）
  Widget _buildMoreCategoriesButton(
    BuildContext context,
    WidgetRef ref, {
    required List<DropCategory> filteredCategories,
    required int? selectedCategoryId,
    required DropType dropType,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          unawaited(
            DropCategoryPickerModal.show(
              context,
              categories: filteredCategories,
              currentCategoryId: selectedCategoryId,
              dropType: dropType,
              onSelected: (id) => ref
                  .read(transactionInputControllerProvider.notifier)
                  .updateDropCategoryId(id),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromARGB(255, 220, 222, 230),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.grid_view_rounded,
                size: 13,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 4),
              Text(
                '一覧',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
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

  Color _getThemeColor(DropType type) {
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

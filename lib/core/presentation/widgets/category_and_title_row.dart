import 'dart:async';

import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/drop/data/drop_category_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop_category.dart';
import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:bucket_drop/features/drop/presentation/widgets/drop_category_picker_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// カテゴリー選択とタイトル入力を横並びにしたコンポーネント
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

    // 選択中のカテゴリーオブジェクト
    final selectedCategory = filteredCategories
        .where((c) => c.id == selectedCategoryId)
        .firstOrNull;

    final activeColor = _getThemeColor(dropType);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ① カテゴリー選択バー（タップでモーダル表示）
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              unawaited(
                DropCategoryPickerModal.show(
                  context,
                  categories: filteredCategories,
                  currentCategoryId: selectedCategoryId,
                  dropType: dropType,
                  onSelected: (categoryId) {
                    ref
                        .read(transactionInputControllerProvider.notifier)
                        .updateDropCategoryId(categoryId);
                  },
                ),
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 245, 247),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedCategory != null
                      ? activeColor.withValues(alpha: 0.35)
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    selectedCategory != null
                        ? _getTypeIcon(dropType)
                        : Icons.category_outlined,
                    size: 20,
                    color: selectedCategory != null
                        ? activeColor
                        : Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      selectedCategory?.name ?? 'カテゴリーを選択',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: selectedCategory != null
                            ? Colors.black87
                            : Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(
                    Icons.unfold_more_rounded,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),

          // ② タイトル入力欄
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 245, 247),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: textController,
              focusNode: focusNode,
              onChanged: (value) => ref
                  .read(transactionInputControllerProvider.notifier)
                  .updateTitle(value),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                isDense: true,
                hintText: 'タイトルを入力（任意）',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getThemeColor(DropType type) {
    switch (type) {
      case DropType.expense:
        return const Color(0xFFB33939); // 渋いバーガンディレッド
      case DropType.income:
        return const Color(0xFF2C5E8A); // 渋いスレートブルー / 藍色
      case DropType.transfer:
        return const Color(0xFF2E7D5B); // 渋いフォレストグリーン / 深緑
    }
  }

  IconData _getTypeIcon(DropType type) {
    switch (type) {
      case DropType.expense:
        return Icons.shopping_bag_outlined;
      case DropType.income:
        return Icons.attach_money;
      case DropType.transfer:
        return Icons.swap_horiz;
    }
  }
}

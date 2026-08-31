import 'dart:async';

import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/drop/domain/drop_category.dart';
import 'package:flutter/material.dart';

/// カテゴリー選択用のフローティングモーダルダイアログ
class DropCategoryPickerModal extends StatelessWidget {
  const DropCategoryPickerModal({
    required this.categories,
    required this.dropType,
    required this.onSelected,
    this.currentCategoryId,
    super.key,
  });

  final List<DropCategory> categories;
  final int? currentCategoryId;
  final DropType dropType;
  final ValueChanged<int?> onSelected;

  /// モーダルを表示する静的メソッド
  static Future<void> show(
    BuildContext context, {
    required List<DropCategory> categories,
    required DropType dropType,
    required ValueChanged<int?> onSelected,
    int? currentCategoryId,
  }) async {
    FocusScope.of(context).unfocus();
    await showDialog<void>(
      context: context,
      builder: (context) => DropCategoryPickerModal(
        categories: categories,
        currentCategoryId: currentCategoryId,
        dropType: dropType,
        onSelected: onSelected,
      ),
    );
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    // 画面の高さの最大70%に制限
    final maxHeight = MediaQuery.of(context).size.height * 0.7;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48), // 上下に十分な余白
      child: Container(
        constraints: BoxConstraints(maxHeight: maxHeight),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Material(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            // ヘッダー部
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 12, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: _getTypeColor(dropType).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          _getTypeIcon(dropType),
                          size: 18,
                          color: _getTypeColor(dropType),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${dropType.label}カテゴリーを選択',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  if (currentCategoryId != null)
                    TextButton(
                      onPressed: () {
                        onSelected(null);
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        foregroundColor: Colors.red.shade400,
                      ),
                      child: const Text('クリア'),
                    ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),

            // カテゴリー一覧リスト（スクロール可能）
            if (categories.isEmpty)
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.category_outlined,
                      size: 40,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '該当するカテゴリーがありません',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              )
            else
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    indent: 56,
                    color: Color(0xFFF5F5F7),
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category.id == currentCategoryId;

                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 2,
                      ),
                      leading: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? _getTypeColor(dropType).withValues(alpha: 0.15)
                              : const Color(0xFFF5F5F7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          _getTypeIcon(dropType),
                          size: 18,
                          color: isSelected
                              ? _getTypeColor(dropType)
                              : Colors.grey.shade600,
                        ),
                      ),
                      title: Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected
                              ? _getTypeColor(dropType)
                              : Colors.black87,
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
                      trailing: isSelected
                          ? Icon(
                              Icons.check_circle,
                              color: _getTypeColor(dropType),
                              size: 20,
                            )
                          : null,
                      onTap: () {
                        onSelected(category.id);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),

            // フッター（閉じるボタン）
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: const Color(0xFFF5F5F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '閉じる',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }

  Color _getTypeColor(DropType type) {
    switch (type) {
      case DropType.expense:
        return Colors.redAccent.shade400;
      case DropType.income:
        return Colors.blue.shade600;
      case DropType.transfer:
        return Colors.teal.shade600;
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

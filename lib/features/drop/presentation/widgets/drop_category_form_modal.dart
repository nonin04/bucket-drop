import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/drop/data/drop_category_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ドロップカテゴリー（支出・収入・振替項目）の新規作成・編集用ボトムシートモーダル
class DropCategoryFormModal extends HookConsumerWidget {
  const DropCategoryFormModal({
    super.key,
    this.category,
    this.initialDropType,
  });

  /// 編集対象のカテゴリー（新規作成時は null）
  final DropCategory? category;

  /// 初期選択する取引区分（任意）
  final DropType? initialDropType;

  /// モーダルを表示する静的ヘルパー関数
  static Future<void> show(
    BuildContext context, {
    DropCategory? category,
    DropType? initialDropType,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DropCategoryFormModal(
        category: category,
        initialDropType: initialDropType,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = category != null;

    // フォームの入力状態
    final nameController = useTextEditingController(text: category?.name ?? '');
    final noteController = useTextEditingController(text: category?.note ?? '');

    // 取引区分（支出・収入・振替）の選択状態
    final selectedDropType = useState<DropType>(
      category?.dropType ?? initialDropType ?? DropType.expense,
    );

    final isSubmitting = useState<bool>(false);

    // カテゴリー保存処理
    Future<void> handleSave() async {
      final name = nameController.text.trim();
      if (name.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('カテゴリー名を入力してください')),
        );
        return;
      }

      isSubmitting.value = true;
      try {
        final repository = ref.read(dropCategoryRepositoryProvider);
        if (isEditing) {
          await repository.updateDropCategory(
            id: category!.id,
            name: name,
            dropType: selectedDropType.value,
            note: noteController.text.trim().isEmpty
                ? null
                : noteController.text.trim(),
          );
        } else {
          await repository.insertDropCategory(
            name: name,
            dropType: selectedDropType.value,
            note: noteController.text.trim().isEmpty
                ? null
                : noteController.text.trim(),
          );
        }

        if (context.mounted) {
          Navigator.of(context).pop();
        }
      } on Exception catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('保存に失敗しました: $e')),
          );
        }
      } finally {
        isSubmitting.value = false;
      }
    }

    // 削除処理
    Future<void> handleDelete() async {
      if (!isEditing) return;

      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('カテゴリーの削除'),
          content: Text('「${category!.name}」を削除してもよろしいですか？\n※関連する取引データがある場合は注意してください。'),
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
        isSubmitting.value = true;
        try {
          await ref
              .read(dropCategoryRepositoryProvider)
              .deleteDropCategory(category!.id);
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        } on Exception catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('削除に失敗しました: $e')),
            );
          }
        } finally {
          isSubmitting.value = false;
        }
      }
    }

    // キーボード表示時の下部余白
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.fromLTRB(20, 16, 20, 20 + bottomInset),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ヘッダー（つまみ & タイトル）
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isEditing ? 'カテゴリーの編集' : 'カテゴリーの新規登録',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isEditing)
                  IconButton(
                    icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
                    tooltip: '削除',
                    onPressed: isSubmitting.value ? null : handleDelete,
                  ),
              ],
            ),
            const SizedBox(height: 20),

            // 取引区分の選択（セグメントボタン）
            const Text(
              '取引区分',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            SegmentedButton<DropType>(
              segments: const [
                ButtonSegment<DropType>(
                  value: DropType.expense,
                  label: Text('支出'),
                  icon: Icon(Icons.remove_circle_outline, size: 18),
                ),
                ButtonSegment<DropType>(
                  value: DropType.income,
                  label: Text('収入'),
                  icon: Icon(Icons.add_circle_outline, size: 18),
                ),
                ButtonSegment<DropType>(
                  value: DropType.transfer,
                  label: Text('振替'),
                  icon: Icon(Icons.swap_horiz, size: 18),
                ),
              ],
              selected: {selectedDropType.value},
              onSelectionChanged: (newSelection) {
                selectedDropType.value = newSelection.first;
              },
            ),
            const SizedBox(height: 16),

            // カテゴリー名入力
            const Text(
              'カテゴリー名',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: nameController,
              autofocus: !isEditing,
              decoration: InputDecoration(
                hintText: '例: 食費, 給与, 口座間振替',
                filled: true,
                fillColor: const Color(0xFFF5F5F7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // メモ入力
            const Text(
              'メモ（任意）',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: noteController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: '例: スーパーや外食など',
                filled: true,
                fillColor: const Color(0xFFF5F5F7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 保存ボタン
            FilledButton(
              onPressed: isSubmitting.value ? null : handleSave,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isSubmitting.value
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      isEditing ? '更新する' : '登録する',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

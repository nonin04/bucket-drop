import 'package:bucket_drop/features/bucket/data/bucket_category_repository.dart';
import 'package:bucket_drop/features/bucket/data/bucket_repository.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
import 'package:bucket_drop/features/bucket/domain/bucket_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// バケットの新規作成・編集用ボトムシートモーダル
class BucketFormModal extends HookConsumerWidget {
  const BucketFormModal({
    super.key,
    this.bucket,
    this.initialCategoryId,
  });

  /// 編集対象のバケット（新規作成時は null）
  final Bucket? bucket;

  /// 初期選択するカテゴリーID（任意）
  final int? initialCategoryId;

  /// モーダルを表示する静的ヘルパー関数
  static Future<void> show(
    BuildContext context, {
    Bucket? bucket,
    int? initialCategoryId,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BucketFormModal(
        bucket: bucket,
        initialCategoryId: initialCategoryId,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = bucket != null;

    final categoriesAsync = ref.watch(bucketCategoryListStreamProvider);
    final categories = categoriesAsync.value ?? <BucketCategory>[];

    // フォームの入力状態
    final nameController = useTextEditingController(text: bucket?.name ?? '');
    final notesController = useTextEditingController(text: bucket?.notes ?? '');

    // カテゴリーの初期選択
    final selectedCategoryId = useState<int?>(
      bucket?.bucketCategoryId ??
          initialCategoryId ??
          categories.firstOrNull?.id,
    );

    // カテゴリーリストが後から読み込まれた場合のフォールバック
    if (selectedCategoryId.value == null && categories.isNotEmpty) {
      selectedCategoryId.value = categories.first.id;
    }

    final isSubmitting = useState<bool>(false);

    // バケット保存処理
    Future<void> handleSave() async {
      final name = nameController.text.trim();
      if (name.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('バケット名を入力してください')),
        );
        return;
      }

      final categoryId = selectedCategoryId.value;
      if (categoryId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('カテゴリーを選択してください')),
        );
        return;
      }

      isSubmitting.value = true;
      try {
        final repository = ref.read(bucketRepositoryProvider);
        if (isEditing) {
          await repository.updateBucket(
            id: bucket!.id,
            name: name,
            bucketCategoryId: categoryId,
            notes: notesController.text.trim().isEmpty
                ? null
                : notesController.text.trim(),
          );
        } else {
          await repository.insertBucket(
            name: name,
            bucketCategoryId: categoryId,
            notes: notesController.text.trim().isEmpty
                ? null
                : notesController.text.trim(),
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
          title: const Text('バケットの削除'),
          content: Text('「${bucket!.name}」を削除してもよろしいですか？\n※関連する取引データがある場合は注意してください。'),
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
          await ref.read(bucketRepositoryProvider).deleteBucket(bucket!.id);
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
                  isEditing ? 'バケットの編集' : 'バケットの新規登録',
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

            // バケット名入力
            const Text(
              'バケット名',
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
                hintText: '例: 三井住友銀行, 財布, SBI証券',
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

            // カテゴリー選択
            const Text(
              'カテゴリー区分',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: selectedCategoryId.value,
                  isExpanded: true,
                  hint: const Text('カテゴリーを選択'),
                  items: categories.map((cat) {
                    final balanceLabel =
                        cat.balanceType.isAsset ? '資産' : '負債';
                    return DropdownMenuItem<int>(
                      value: cat.id,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: cat.balanceType.isAsset
                                  ? Colors.blue.shade50
                                  : Colors.orange.shade50,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              balanceLabel,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: cat.balanceType.isAsset
                                  ? Colors.blue.shade700
                                  : Colors.orange.shade700,
                              ),
                            ),
                          ),
                          Text(cat.name),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) {
                      selectedCategoryId.value = val;
                    }
                  },
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
              controller: notesController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: '例: 給与受取口座, 予備のクレカ',
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

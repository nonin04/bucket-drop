import 'dart:async';

import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/bucket/data/bucket_repository.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 収入・支出・振替に応じたバケット選択コンポーネント
class BucketSelector extends ConsumerWidget {
  const BucketSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(transactionInputControllerProvider);
    final dropType = formState.dropType;
    final bucketsAsync = ref.watch(bucketListStreamProvider);

    final buckets = bucketsAsync.value ?? <Bucket>[];

    // 初回ロード時のみデフォルトバケットを適用
    ref.listen<AsyncValue<List<Bucket>>>(bucketListStreamProvider, (_, next) {
      final list = next.value;
      if (list != null && list.isNotEmpty) {
        ref
            .read(transactionInputControllerProvider.notifier)
            .applyInitialDefaultBuckets(list);
      }
    });

    if (buckets.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(transactionInputControllerProvider.notifier)
            .applyInitialDefaultBuckets(buckets);
      });
    }

    // 選択中のバケット名を取得
    final fromBucket = buckets
        .where((b) => b.id == formState.bucketId)
        .firstOrNull;
    final toBucket = buckets
        .where((b) => b.id == formState.toBucketId)
        .firstOrNull;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child: dropType == DropType.transfer
            ? _buildTransferSelector(
                context,
                ref,
                fromBucket: fromBucket,
                toBucket: toBucket,
                buckets: buckets,
              )
            : _buildSingleSelector(
                context,
                ref,
                dropType: dropType,
                selectedBucket: fromBucket,
                buckets: buckets,
              ),
      ),
    );
  }

  /// 振替（2つのバケット選択：出金元 → 入金先）
  Widget _buildTransferSelector(
    BuildContext context,
    WidgetRef ref, {
    required Bucket? fromBucket,
    required Bucket? toBucket,
    required List<Bucket> buckets,
  }) {
    return Row(
      key: const ValueKey('transfer_selector'),
      children: [
        Expanded(
          child: _buildBucketCard(
            context,
            label: '出金元',
            bucket: fromBucket,
            isCompact: true,
            onTap: () => _showBucketPicker(
              context,
              ref,
              title: '出金元バケットを選択',
              currentId: fromBucket?.id,
              buckets: buckets,
              onSelected: (id) => ref
                  .read(transactionInputControllerProvider.notifier)
                  .updateBucketId(id),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Icon(
            Icons.arrow_forward_rounded,
            size: 18,
            color: Color.fromARGB(255, 140, 140, 145),
          ),
        ),
        Expanded(
          child: _buildBucketCard(
            context,
            label: '入金先',
            bucket: toBucket,
            isCompact: true,
            onTap: () => _showBucketPicker(
              context,
              ref,
              title: '入金先バケットを選択',
              currentId: toBucket?.id,
              buckets: buckets,
              onSelected: (id) => ref
                  .read(transactionInputControllerProvider.notifier)
                  .updateToBucketId(id),
            ),
          ),
        ),
      ],
    );
  }

  /// 収入・支出（単一のバケット選択）
  Widget _buildSingleSelector(
    BuildContext context,
    WidgetRef ref, {
    required DropType dropType,
    required Bucket? selectedBucket,
    required List<Bucket> buckets,
  }) {
    final label = dropType == DropType.income ? '入金先バケット' : '支出元バケット';

    return _buildBucketCard(
      context,
      key: const ValueKey('single_selector'),
      label: label,
      bucket: selectedBucket,
      onTap: () => _showBucketPicker(
        context,
        ref,
        title: '$labelを選択',
        currentId: selectedBucket?.id,
        buckets: buckets,
        onSelected: (id) => ref
            .read(transactionInputControllerProvider.notifier)
            .updateBucketId(id),
      ),
    );
  }

  /// バケット選択カードの共通UI
  Widget _buildBucketCard(
    BuildContext context, {
    required String label,
    required Bucket? bucket,
    required VoidCallback onTap,
    bool isCompact = false,
    Key? key,
  }) {
    return GestureDetector(
      key: key,
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isCompact ? 10 : 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 245, 247),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(255, 230, 230, 235),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              size: 20,
              color: Color.fromARGB(255, 100, 100, 110),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    bucket?.name ?? '選択',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: bucket != null
                          ? const Color.fromARGB(255, 30, 30, 30)
                          : const Color.fromARGB(255, 160, 160, 165),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.unfold_more_rounded,
              size: 20,
              color: Color.fromARGB(255, 160, 160, 170),
            ),
          ],
        ),
      ),
    );
  }

  /// バケット選択モーダルシート
  void _showBucketPicker(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required int? currentId,
    required List<Bucket> buckets,
    required ValueChanged<int?> onSelected,
  }) {
    FocusScope.of(context).unfocus();
    unawaited(
      showModalBottomSheet<void>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ヘッダーバー
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (currentId != null)
                          TextButton(
                            onPressed: () {
                              onSelected(null);
                              Navigator.of(context).pop();
                            },
                            child: const Text('クリア'),
                          ),
                      ],
                    ),
                  ),
                  const Divider(),
                  if (buckets.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Text(
                        '登録されているバケットがありません',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    )
                  else
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: buckets.length,
                        itemBuilder: (context, index) {
                          final item = buckets[index];
                          final isSelected = item.id == currentId;
                          return ListTile(
                            leading: const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 240, 240, 245),
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                size: 18,
                                color: Colors.black87,
                              ),
                            ),
                            title: Text(
                              item.name,
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            trailing: isSelected
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.blue,
                                  )
                                : null,
                            onTap: () {
                              onSelected(item.id);
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

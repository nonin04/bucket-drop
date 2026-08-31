import 'dart:async';

import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/bucket/data/bucket_repository.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 支出元・入金先バケットを選択するセレクター（振替スワップギミック付き）
class BucketSelector extends HookConsumerWidget {
  const BucketSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(transactionInputControllerProvider);
    final dropType = formState.dropType;
    final bucketsAsync = ref.watch(bucketListStreamProvider);

    final buckets = bucketsAsync.value ?? <Bucket>[];

    // スワップ時の回転アニメーション用状態
    final swapTurns = useState<double>(0);

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
                swapTurns: swapTurns,
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

  /// 振替（出金元 ⇄ 入金先、真ん中にスワップボタン）
  Widget _buildTransferSelector(
    BuildContext context,
    WidgetRef ref, {
    required Bucket? fromBucket,
    required Bucket? toBucket,
    required List<Bucket> buckets,
    required ValueNotifier<double> swapTurns,
  }) {
    return Row(
      key: const ValueKey('transfer_selector'),
      children: [
        // 出金元バケット
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

        // ⭐️ スワップ（反転）ボタン
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Material(
            color: const Color.fromARGB(255, 235, 238, 245),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                unawaited(HapticFeedback.lightImpact());
                swapTurns.value += 0.5; // 180度回転
                ref.read(transactionInputControllerProvider.notifier).swapBuckets();
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: AnimatedRotation(
                  turns: swapTurns.value,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutBack,
                  child: const Icon(
                    Icons.swap_horiz_rounded,
                    size: 20,
                    color: Color(0xFF2E7D5B), // 渋い緑
                  ),
                ),
              ),
            ),
          ),
        ),

        // 入金先バケット
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
      label: label,
      bucket: selectedBucket,
      isCompact: false,
      onTap: () => _showBucketPicker(
        context,
        ref,
        title: label,
        currentId: selectedBucket?.id,
        buckets: buckets,
        onSelected: (id) => ref
            .read(transactionInputControllerProvider.notifier)
            .updateBucketId(id),
      ),
    );
  }

  /// バケット選択カード
  Widget _buildBucketCard(
    BuildContext context, {
    required String label,
    required Bucket? bucket,
    required bool isCompact,
    required VoidCallback onTap,
  }) {
    final isSelected = bucket != null;

    return Material(
      color: const Color.fromARGB(255, 245, 245, 247),
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 48,
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 10 : 14,
          ),
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: const Color(0xFFD0D3DC))
                : null,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                size: isCompact ? 16 : 18,
                color: isSelected
                    ? const Color.fromARGB(255, 50, 50, 50)
                    : Colors.grey,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  bucket?.name ?? label,
                  style: TextStyle(
                    fontSize: isCompact ? 13 : 14,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected
                        ? const Color.fromARGB(255, 30, 30, 30)
                        : Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.unfold_more_rounded,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
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
                            child: const Text(
                              'クリア',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 13,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Color(0xFFEEEEEE)),
                  if (buckets.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'バケットが登録されていません',
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
                                Icons.account_balance_wallet_outlined,
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

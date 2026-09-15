import 'package:bucket_drop/features/drop/presentation/drop_index_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropIndexPage extends ConsumerWidget {
  const DropIndexPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropsAsync = ref.watch(dropIndexControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drop'),
      ),

      body: dropsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) {
          debugPrint('❌ DropIndexPage Error: $err');
          debugPrint('$stack');
          return Center(child: Text('エラー: $err'));
        },
        data: (drops) {
          if (drops.isEmpty) {
            return const Center(child: Text('ドロップがありません'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: drops.length,
                  itemBuilder: (context, index) {
                    final drop = drops[index];

                    return Dismissible(
                      // ① 一意のキー（Flutterがアニメーション中に要素を追跡するために必須）
                      key: Key(drop.id.toString()),
                      // ② 右から左へのスワイプのみ許可
                      direction: DismissDirection.endToStart,
                      // ③ スワイプ時に裏側に見える赤い背景とゴミ箱アイコン
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      // ④ スワイプが完了したときに実行する処理
                      onDismissed: (direction) async {
                        // Controllerの削除メソッドを呼び出す
                        await ref
                            .read(dropIndexControllerProvider.notifier)
                            .deleteDrop(drop.id);
                      },
                      child: ListTile(
                        // 左端：カテゴリアイコン
                        leading: CircleAvatar(
                          child: Icon(drop.dropCategoryIcon?.iconData),
                        ),
                        // メイン：タイトル
                        title: Text(
                          drop.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // サブ情報：Column を使って複数行で表示
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 移動元 → 移動先のバケット
                            Text(
                              '${drop.fromBucketName ?? "外部"} → ${drop.toBucketName ?? "外部"}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            // 日付
                            Text(
                              '${drop.droppedOn.year}/${drop.droppedOn.month}/${drop.droppedOn.day}',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        // 右端：金額
                        trailing: Text(
                          '¥${drop.amount}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              FilledButton(
                onPressed: () => ref
                    .read(dropIndexControllerProvider.notifier)
                    .deleteAllDrops(),
                child: const Text('全件削除'),
              ),
            ],
          );
        },
      ),
    );
  }
}

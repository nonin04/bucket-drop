import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 取引タイトルの入力フィールド
class TitleInputField extends HookConsumerWidget {
  const TitleInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // リセットされた回数だけを監視（文字入力中は再描画されない）
    final resetKey = ref.watch(
      transactionInputControllerProvider.select((s) => s.resetKey),
    );
    // 保存ボタンが押された時（resetKeyが変わった時）だけ空で再生成
    final textController = useTextEditingController(
      keys: [resetKey],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 245, 247),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: textController,
          onChanged: (value) => ref
              .read(transactionInputControllerProvider.notifier)
              .updateTitle(value),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            hintText: 'タイトルを書いてください',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

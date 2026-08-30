import 'package:bucket_drop/core/presentation/widgets/calculator/calculator_widget.dart';
import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpenseInputPanel extends HookConsumerWidget {
  const ExpenseInputPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ① リセットされた回数だけを監視（通常の文字入力中は再描画されない）
    final resetKey = ref.watch(
      transactionInputControllerProvider.select((s) => s.resetKey),
    );
    // ② 保存ボタンが押された時（resetKeyが変わった時）だけ空で再生成
    final textController = useTextEditingController(
      keys: [resetKey],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
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
          const CalculatorWidget(),
          ElevatedButton(
            // UI は「保存」というイベントを Controller に通知するだけ
            onPressed: () =>
                ref.read(transactionInputControllerProvider.notifier).save(),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: const Color.fromARGB(255, 120, 120, 120),
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(48),
            ),
            child: const Text(
              '追加する',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

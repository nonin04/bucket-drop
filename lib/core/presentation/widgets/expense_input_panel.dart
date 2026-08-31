import 'dart:async';

import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/core/presentation/widgets/calculator/calculator_widget.dart';
import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseInputPanel extends ConsumerWidget {
  const ExpenseInputPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 取引タイプを監視
    final dropType = ref.watch(
      transactionInputControllerProvider.select((s) => s.dropType),
    );

    // バリデーション状態の監視
    final validationError = ref.watch(
      transactionInputControllerProvider.select((s) => s.validationError),
    );
    final isValid = ref.watch(
      transactionInputControllerProvider.select((s) => s.isValid),
    );

    // 渋く落ち着いたテーマカラー
    final activeColor = _getThemeColor(dropType);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ① 計算機キーパッド
          const CalculatorWidget(),

          // ② インラインヒント（入力不足時に優しく案内）
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: validationError != null
                ? Padding(
                    key: ValueKey(validationError),
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          validationError,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(
                    key: ValueKey('valid'),
                    height: 18,
                  ),
          ),

          // ③ 動的アクティブ化ボタン（全条件が揃うと渋いテーマ色に点灯）
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: isValid ? activeColor : const Color(0xFFE5E5EA),
              borderRadius: BorderRadius.circular(10),
              boxShadow: isValid
                  ? [
                      BoxShadow(
                        color: activeColor.withValues(alpha: 0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : null,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: isValid
                    ? () async {
                        unawaited(HapticFeedback.mediumImpact());
                        await ref
                            .read(transactionInputControllerProvider.notifier)
                            .save();
                      }
                    : () {
                        unawaited(HapticFeedback.selectionClick());
                      },
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isValid ? Icons.check_rounded : Icons.add_rounded,
                        size: 20,
                        color: isValid ? Colors.white : Colors.grey.shade500,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '追加する',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isValid ? Colors.white : Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 渋く落ち着いたトーン（深みのある大人な配色）
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
}

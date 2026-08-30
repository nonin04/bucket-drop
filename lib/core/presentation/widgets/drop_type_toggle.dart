import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/drop/presentation/transaction_input_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 収入・支出・振替を切り替えるスライディングトグル
class DropTypeToggle extends ConsumerWidget {
  const DropTypeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentDropType = ref.watch(
      transactionInputControllerProvider.select((s) => s.dropType),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: SizedBox(
        width: double.infinity,
        child: CupertinoSlidingSegmentedControl<DropType>(
          groupValue: currentDropType,
          backgroundColor: const Color.fromARGB(255, 235, 236, 240),
          thumbColor: Colors.white,
          padding: const EdgeInsets.all(4),
          children: {
            DropType.income: _buildSegmentItem(
              DropType.income.label,
              isSelected: currentDropType == DropType.income,
            ),
            DropType.expense: _buildSegmentItem(
              DropType.expense.label,
              isSelected: currentDropType == DropType.expense,
            ),
            DropType.transfer: _buildSegmentItem(
              DropType.transfer.label,
              isSelected: currentDropType == DropType.transfer,
            ),
          },
          onValueChanged: (value) {
            if (value != null) {
              ref
                  .read(transactionInputControllerProvider.notifier)
                  .updateDropType(value);
            }
          },
        ),
      ),
    );
  }

  Widget _buildSegmentItem(String label, {required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: isSelected
              ? const Color.fromARGB(255, 30, 30, 30)
              : const Color.fromARGB(255, 120, 120, 120),
        ),
      ),
    );
  }
}

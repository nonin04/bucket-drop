import 'package:bucket_drop/core/presentation/widgets/calculator/calculator_controller.dart';
import 'package:bucket_drop/core/presentation/widgets/calculator/calculator_widget.dart';
import 'package:bucket_drop/core/presentation/widgets/transaction_providers.dart';
import 'package:bucket_drop/features/drop/data/drop_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionInputPanel extends ConsumerWidget {
  const TransactionInputPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 245, 247),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              onChanged: (value) =>
                  ref.read(transactionTitleProvider.notifier).set(value),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                hintText: 'Type here...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        const CalculatorWidget(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: ElevatedButton(
            onPressed: () async {
              final title = ref.read(transactionTitleProvider);
              final amount = int.tryParse(ref.read(calculatorProvider)) ?? 0;
              // DB保存処理
              final newDrop = Drop(
                title: title,
                amount: amount,
                date: DateTime.now(),
              );

              await ref.read(dropRepositoryProvider).insertDrop(newDrop);

              // 入力値を破棄
              ref.read(transactionTitleProvider.notifier).clear();
              ref.read(calculatorProvider.notifier).clear();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text(
              '保存',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

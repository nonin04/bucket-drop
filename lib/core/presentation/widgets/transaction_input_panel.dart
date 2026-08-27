import 'package:bucket_drop/core/presentation/widgets/calculator/calculator_widget.dart';
import 'package:bucket_drop/core/presentation/widgets/neumorphic_inner_shadow.dart';
import 'package:bucket_drop/core/presentation/widgets/transaction_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionInputPanel extends ConsumerWidget {
  const TransactionInputPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(transactionCategoryProvider);
    final categories = ['🍔 食費', '🛒 日用品', '🚗 交通費', '🎮 エンタメ', '💬 その他'];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: NeumorphicInnerShadow(
            child: TextField(
              onChanged: (value) => ref.read(transactionTitleProvider.notifier).set(value),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                hintText: 'Type here...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              final isSelected = selectedCategory == cat;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(
                    cat,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: const Color.fromARGB(255, 43, 93, 134),
                  backgroundColor: const Color.fromARGB(255, 245, 245, 247),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide.none,
                  ),
                  showCheckmark: false,
                  onSelected: (selected) {
                    if (selected) {
                      ref.read(transactionCategoryProvider.notifier).set(cat);
                    }
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8.0),
        const CalculatorWidget(),
      ],
    );
  }
}

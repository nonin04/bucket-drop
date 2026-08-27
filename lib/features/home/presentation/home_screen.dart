import 'package:bucket_drop/core/presentation/widgets/receipt_widget.dart';
import 'package:bucket_drop/core/presentation/widgets/transaction_input_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        // 上半分: レシート風ウィジェット（キーボード等で潰れてもスクロール可能にする）
        const Expanded(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ReceiptWidget(),
            ),
          ),
        ),
        // 下半分: 入力パネル
        const TransactionInputPanel(),
      ],
    );
  }
}

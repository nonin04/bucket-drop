import 'package:bucket_drop/core/presentation/widgets/bucket_selector.dart';
import 'package:bucket_drop/core/presentation/widgets/category_and_title_row.dart';
import 'package:bucket_drop/core/presentation/widgets/drop_type_toggle.dart';
import 'package:bucket_drop/core/presentation/widgets/expense_input_panel.dart';
import 'package:bucket_drop/core/presentation/widgets/receipt_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: const IntrinsicHeight(
                  child: Column(
                    children: [
                      DropTypeToggle(),
                      BucketSelector(),
                      CategoryAndTitleRow(),
                      ReceiptWidget(),
                      ExpenseInputPanel(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

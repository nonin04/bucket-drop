import 'package:flutter/material.dart';
import 'package:bucket_drop/core/presentation/widgets/calculator/calculator_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: Center(child: CalculatorWidget()));
  }
}

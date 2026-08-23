import 'package:flutter/material.dart';
import 'package:bucket_drop/features/calculator/presentation/calculator_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: Center(child: CalculatorPage()));
  }
}

import 'package:flutter/material.dart';
import 'package:bucket_drop/calculator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestPage1 extends ConsumerWidget {
  const TestPage1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Center(child: CalculatorPage()));
  }
}

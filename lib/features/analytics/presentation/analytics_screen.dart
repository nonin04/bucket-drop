import 'package:flutter/material.dart';
import 'package:bucket_drop/features/drop/presentation/widgets/message_widget.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const MessageWidget();
          },
          itemCount: 100,
        ),
      ),
    );
  }
}

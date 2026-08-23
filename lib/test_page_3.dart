import 'package:flutter/material.dart';
import 'package:bucket_drop/message_widget.dart';

class TestPage3 extends StatelessWidget {
  const TestPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MessageWidget();
          },
          itemCount: 100,
        ),
      ),
    );
  }
}

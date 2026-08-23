import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bucket_drop/index_notifier.dart';

class TestPage2 extends ConsumerWidget {
  const TestPage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              width: 100,
              height: 100,
              child: const Center(
                child: Text(
                  "hello World",
                  style: TextStyle(
                    backgroundColor: Colors.black,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Text(
              "page1です",
              style: TextStyle(
                backgroundColor: Colors.black,
                color: Colors.white,
              ),
            ),
            const Text(
              "page1です",
              style: TextStyle(
                backgroundColor: Colors.black,
                color: Colors.white,
              ),
            ),
            const Text("page2です"),
            const Text(
              "hello World",
              style: TextStyle(
                backgroundColor: Colors.black,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {
                // Riverpod を使ってタブインデックスを「2」(ページ3) に切り替える
                ref.read(indexProvider.notifier).setIndex(2);
              },
              child: const Text("ページ3に進む"),
            ),
          ],
        ),
      ),
    );
  }
}

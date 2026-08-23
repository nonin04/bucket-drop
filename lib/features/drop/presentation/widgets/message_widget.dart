import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageWidget extends ConsumerWidget {
  const MessageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255), // 背景色
        borderRadius: BorderRadius.circular(8), // 角丸の半径（大きさ）
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // 影の色
            spreadRadius: 1, // 影の広がり
            blurRadius: 4, // 影のぼかし
            offset: const Offset(0, 2), // 影の位置
          ),
        ],
      ),
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8), // 左上
              bottomLeft: Radius.circular(8), // 左下
            ),
            child: Container(
              width: 12,
              height: 80,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 43, 93, 134),
                    Color.fromARGB(255, 23, 52, 78),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12), // バーとアイコンの間の余白
          const Icon(
            CupertinoIcons.ticket,
            size: 24,
            color: Color.fromARGB(255, 21, 53, 79),
          ),
          const SizedBox(width: 12), // アイコンとテキストの間の余白
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                     "飛行機KIX-JFK",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Text(
                    "by UserA",
                    style: TextStyle(color: Color.fromARGB(255, 179, 179, 179)),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              "¥15,000",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

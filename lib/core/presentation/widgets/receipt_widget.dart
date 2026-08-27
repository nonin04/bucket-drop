import 'package:bucket_drop/core/presentation/widgets/calculator/calculator_controller.dart';
import 'package:bucket_drop/core/presentation/widgets/transaction_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReceiptWidget extends ConsumerWidget {
  const ReceiptWidget({super.key});

  // 3桁区切りのカンマを挿入するメソッド
  String _formatWithCommas(String value) {
    if (value.isEmpty) return '0';
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return value.replaceAll(reg, ',');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(calculatorProvider);
    final title = ref.watch(transactionTitleProvider);
    final category = ref.watch(transactionCategoryProvider);

    final now = DateTime.now();
    final formattedDate =
        "${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Container(
        // レシート自体の影
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipPath(
          clipper: ReceiptClipper(),
          child: Container(
            color: const Color.fromARGB(255, 253, 252, 248), // 少しレトロなレシート紙の白
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 28.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // アプリ名（ショップヘッダー風）
                const Text(
                  'BUCKET DROP OUTLET',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 2.0,
                    color: Color.fromARGB(255, 60, 60, 60),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '-- RECORD RECEIPT --',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),
                // 点線
                const Text(
                  '--------------------------------',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 8),

                // 日付
                _buildReceiptRow('DATE', formattedDate),
                const SizedBox(height: 8),
                // カテゴリー
                _buildReceiptRow(
                  'CATEGORY',
                  category.isEmpty ? '未分類' : category,
                ),
                const SizedBox(height: 8),
                // 品名（タイトル）
                _buildReceiptRow('ITEM', title.isEmpty ? '(入力してください)' : title),

                const SizedBox(height: 8),
                // 点線
                const Text(
                  '--------------------------------',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 16),

                // 合計金額表示
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text(
                      'TOTAL',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 40, 40, 40),
                      ),
                    ),
                    Text(
                      '¥ ${_formatWithCommas(amount)}',
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Color.fromARGB(255, 40, 40, 40),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: Color.fromARGB(255, 60, 60, 60),
            ),
          ),
        ),
      ],
    );
  }
}

// レシートの上下ギザギザを表現するクリッパー
class ReceiptClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // 上部のギザギザ
    path.moveTo(0, 6.0);
    double x = 0;
    double y = 6.0;
    double increment = 8.0;
    while (x < size.width) {
      x += increment;
      y = (y == 6.0) ? 0 : 6.0;
      path.lineTo(x, y);
    }

    // 右端
    path.lineTo(size.width, size.height - 6.0);

    // 下部のギザギザ
    x = size.width;
    y = size.height - 6.0;
    while (x > 0) {
      x -= increment;
      y = (y == size.height - 6.0) ? size.height : size.height - 6.0;
      path.lineTo(x, y);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';

class CalculatorKeypad extends StatelessWidget {
  const CalculatorKeypad({
    required this.onDigitInput,
    required this.onClear,
    required this.onStartDelete,
    required this.onStopDelete,
    super.key,
  });

  final ValueChanged<String> onDigitInput;
  final VoidCallback onClear;
  final VoidCallback onStartDelete;
  final VoidCallback onStopDelete;

  Widget _buildKey(BuildContext context, String text, int key) {
    const bgColor = Color.fromARGB(255, 245, 245, 247);
    final fgColor = switch (key) {
      10 => const Color.fromARGB(255, 255, 183, 0), // C
      11 => const Color.fromARGB(255, 255, 1, 1), // ⌫
      _ => Colors.black,
    };

    return Expanded(
      child: GestureDetector(
        onTapDown: (_) {
          if (key == 11) {
            onStartDelete();
          } else if (key == 10) {
            onClear();
          } else {
            onDigitInput(text);
          }
        },
        onTapUp: key == 11 ? (_) => onStopDelete() : null,
        onTapCancel: key == 11 ? onStopDelete : null,
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: key == 11 ? 20 : 24,
                fontWeight: FontWeight.w500,
                color: fgColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return IgnorePointer(
      ignoring: isKeyboardVisible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isKeyboardVisible ? 0.4 : 1.0,
        child: Column(
          spacing: 8,
          children: [
            Row(
              spacing: 8,
              children: [
                _buildKey(context, '1', 1),
                _buildKey(context, '2', 2),
                _buildKey(context, '3', 3),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                _buildKey(context, '4', 4),
                _buildKey(context, '5', 5),
                _buildKey(context, '6', 6),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                _buildKey(context, '7', 7),
                _buildKey(context, '8', 8),
                _buildKey(context, '9', 9),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                _buildKey(context, 'C', 10),
                _buildKey(context, '0', 0),
                _buildKey(context, '⌫', 11),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

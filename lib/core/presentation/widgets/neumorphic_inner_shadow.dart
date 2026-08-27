import 'package:flutter/material.dart';

class NeumorphicInnerShadow extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final Color bgColor;

  const NeumorphicInnerShadow({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    this.bgColor = const Color.fromARGB(255, 242, 242, 244), // 凹んだ部分の背景色（少し沈ませる）
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: bgColor,
      ),
      child: Stack(
        children: [
          // 左上の暗いインナーシャドウ
          Positioned.fill(
            child: CustomPaint(
              painter: _InnerShadowPainter(
                borderRadius: borderRadius,
                shadowColor: Colors.black.withOpacity(0.08),
                offset: const Offset(3, 3),
                blurRadius: 4.0,
              ),
            ),
          ),
          // 右下の白いインナーシャドウ（光）
          Positioned.fill(
            child: CustomPaint(
              painter: _InnerShadowPainter(
                borderRadius: borderRadius,
                shadowColor: Colors.white.withOpacity(0.9),
                offset: const Offset(-3, -3),
                blurRadius: 4.0,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _InnerShadowPainter extends CustomPainter {
  final BorderRadius borderRadius;
  final Color shadowColor;
  final Offset offset;
  final double blurRadius;

  _InnerShadowPainter({
    required this.borderRadius,
    required this.shadowColor,
    required this.offset,
    required this.blurRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rrect = borderRadius.toRRect(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.clipRRect(rrect);

    final Paint paint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurRadius);

    final Path path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(Rect.fromLTWH(-50, -50, size.width + 100, size.height + 100))
      ..addRRect(rrect);

    canvas.translate(offset.dx, offset.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

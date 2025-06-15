import 'dart:math';
import 'package:eskasan/utils/dimensions.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  final Widget child;

  const Demo({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // DEMO yazısını çizen CustomPaint
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: WatermarkPainter(),
            ),
          ),
        ),

        // Asıl içerik
        Positioned.fill(child: child),
      ],
    );
  }
}

class WatermarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final text = 'DEMO';
    final style = TextStyle(
      color: Colors.black.withOpacity(0.04),
      fontSize: Dimensions.height120,
      fontWeight: FontWeight.bold,
      letterSpacing: 8,
    );

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final angle = -pi / 4;
    final center = Offset(size.width / 2, size.height / 2);

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle);

    textPainter.paint(
      canvas,
      Offset(-textPainter.width / 2, -textPainter.height / 2),
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

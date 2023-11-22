// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';

class BarLinesCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(70.3333, 3);
    path_0.cubicTo(70.3333, 4.47276, 71.5272, 5.66667, 73, 5.66667);
    path_0.cubicTo(74.4728, 5.66667, 75.6667, 4.47276, 75.6667, 3);
    path_0.cubicTo(75.6667, 1.52724, 74.4728, 0.333333, 73, 0.333333);
    path_0.cubicTo(71.5272, 0.333333, 70.3333, 1.52724, 70.3333, 3);
    path_0.close();
    path_0.moveTo(3, 3);
    path_0.lineTo(3, 2.5);
    path_0.lineTo(2.5, 2.5);
    path_0.lineTo(2.5, 3);
    path_0.lineTo(3, 3);
    path_0.close();
    path_0.moveTo(0.333333, 360);
    path_0.cubicTo(0.333333, 361.473, 1.52724, 362.667, 3, 362.667);
    path_0.cubicTo(4.47276, 362.667, 5.66667, 361.473, 5.66667, 360);
    path_0.cubicTo(5.66667, 358.527, 4.47276, 357.333, 3, 357.333);
    path_0.cubicTo(1.52724, 357.333, 0.333333, 358.527, 0.333333, 360);
    path_0.close();
    path_0.moveTo(68.9333, 277);
    path_0.cubicTo(68.9333, 278.473, 70.1272, 279.667, 71.6, 279.667);
    path_0.cubicTo(73.0728, 279.667, 74.2667, 278.473, 74.2667, 277);
    path_0.cubicTo(74.2667, 275.527, 73.0728, 274.333, 71.6, 274.333);
    path_0.cubicTo(70.1272, 274.333, 68.9333, 275.527, 68.9333, 277);
    path_0.close();
    path_0.moveTo(2.5, 3);
    path_0.lineTo(2.5, 277);
    path_0.lineTo(3.5, 277);
    path_0.lineTo(3.5, 3);
    path_0.lineTo(2.5, 3);
    path_0.close();
    path_0.moveTo(2.5, 277);
    path_0.lineTo(2.5, 360);
    path_0.lineTo(3.5, 360);
    path_0.lineTo(3.5, 277);
    path_0.lineTo(2.5, 277);
    path_0.close();
    path_0.moveTo(71.6, 276.5);
    path_0.lineTo(38, 276.5);
    path_0.lineTo(38, 277.5);
    path_0.lineTo(71.6, 277.5);
    path_0.lineTo(71.6, 276.5);
    path_0.close();
    path_0.moveTo(38, 276.5);
    path_0.lineTo(3, 276.5);
    path_0.lineTo(3, 277.5);
    path_0.lineTo(38, 277.5);
    path_0.lineTo(38, 276.5);
    path_0.close();
    path_0.moveTo(73, 2.5);
    path_0.lineTo(38, 2.5);
    path_0.lineTo(38, 3.5);
    path_0.lineTo(73, 3.5);
    path_0.lineTo(73, 2.5);
    path_0.close();
    path_0.moveTo(38, 2.5);
    path_0.lineTo(3, 2.5);
    path_0.lineTo(3, 3.5);
    path_0.lineTo(38, 3.5);
    path_0.lineTo(38, 2.5);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff5E668A).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

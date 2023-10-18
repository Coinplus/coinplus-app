// ignore_for_file: cascade_invocations

import 'package:flutter/cupertino.dart';

class LineCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(19.3333, 3);
    path_0.cubicTo(19.3333, 4.47276, 20.5272, 5.66667, 22, 5.66667);
    path_0.cubicTo(23.4728, 5.66667, 24.6667, 4.47276, 24.6667, 3);
    path_0.cubicTo(24.6667, 1.52724, 23.4728, 0.333333, 22, 0.333333);
    path_0.cubicTo(20.5272, 0.333333, 19.3333, 1.52724, 19.3333, 3);
    path_0.close();
    path_0.moveTo(3, 3);
    path_0.lineTo(3, 2.5);
    path_0.lineTo(2.5, 2.5);
    path_0.lineTo(2.5, 3);
    path_0.lineTo(3, 3);
    path_0.close();
    path_0.moveTo(0.333333, 371);
    path_0.cubicTo(0.333333, 372.473, 1.52724, 373.667, 3, 373.667);
    path_0.cubicTo(4.47276, 373.667, 5.66667, 372.473, 5.66667, 371);
    path_0.cubicTo(5.66667, 369.527, 4.47276, 368.333, 3, 368.333);
    path_0.cubicTo(1.52724, 368.333, 0.333333, 369.527, 0.333333, 371);
    path_0.close();
    path_0.moveTo(19.3333, 251.5);
    path_0.cubicTo(19.3333, 252.973, 20.5272, 254.167, 22, 254.167);
    path_0.cubicTo(23.4728, 254.167, 24.6667, 252.973, 24.6667, 251.5);
    path_0.cubicTo(24.6667, 250.027, 23.4728, 248.833, 22, 248.833);
    path_0.cubicTo(20.5272, 248.833, 19.3333, 250.027, 19.3333, 251.5);
    path_0.close();
    path_0.moveTo(22, 2.5);
    path_0.lineTo(3, 2.5);
    path_0.lineTo(3, 3.5);
    path_0.lineTo(22, 3.5);
    path_0.lineTo(22, 2.5);
    path_0.close();
    path_0.moveTo(2.5, 3);
    path_0.lineTo(2.5, 251.5);
    path_0.lineTo(3.5, 251.5);
    path_0.lineTo(3.5, 3);
    path_0.lineTo(2.5, 3);
    path_0.close();
    path_0.moveTo(2.5, 251.5);
    path_0.lineTo(2.5, 371);
    path_0.lineTo(3.5, 371);
    path_0.lineTo(3.5, 251.5);
    path_0.lineTo(2.5, 251.5);
    path_0.close();
    path_0.moveTo(22, 251);
    path_0.lineTo(3, 251);
    path_0.lineTo(3, 252);
    path_0.lineTo(22, 252);
    path_0.lineTo(22, 251);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff0D2449).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

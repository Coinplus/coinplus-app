// ignore_for_file: cascade_invocations

import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.9963348);
    path_0.cubicTo(
      0,
      size.height * 0.9330793,
      size.width * 0.03104160,
      size.height * 0.8817974,
      size.width * 0.06933333,
      size.height * 0.8817974,
    );
    path_0.lineTo(size.width * 0.9306667, size.height * 0.8817974);
    path_0.cubicTo(
      size.width * 0.9689573,
      size.height * 0.8817974,
      size.width,
      size.height * 0.9330793,
      size.width,
      size.height * 0.9963348,
    );
    path_0.lineTo(size.width, 0);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
      const Offset(0, 0),
      Offset(size.width * 0.5334533, size.height * 1.461172),
      [
        const Color(0xffFF335C).withOpacity(1),
        const Color(0xffFF6138).withOpacity(1),
      ],
      [0, 1],
    );
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

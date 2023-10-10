// ignore_for_file: cascade_invocations

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(390, 0);
    path_0.lineTo(390, 155.772);
    path_0.cubicTo(390, 141.413, 378.359, 129.772, 364, 129.772);
    path_0.lineTo(195.52, 129.772);
    path_0.lineTo(26, 129.772);
    path_0.cubicTo(11.6406, 129.772, 0, 141.413, 0, 155.772);
    path_0.lineTo(0, 0);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.000002667795, size.height * -3.743526),
        Offset(size.width * 0.3849308, size.height * 1.933750), [
      const Color(0xffFF335C).withOpacity(1),
      const Color(0xffFF6138).withOpacity(1),
    ], [
      0,
      1,
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

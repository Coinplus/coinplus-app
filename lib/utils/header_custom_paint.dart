//Copy this CustomPainter code to the Bottom of the File
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

class HeaderCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.8253012)
      ..cubicTo(
        size.width,
        size.height * 0.7321446,
        size.width * 0.9665707,
        size.height * 0.6566265,
        size.width * 0.9253333,
        size.height * 0.6566265,
      )
      ..lineTo(size.width * 0.6720000, size.height * 0.6566265)
      ..cubicTo(
        size.width * 0.6307627,
        size.height * 0.6566265,
        size.width * 0.5973333,
        size.height * 0.7321446,
        size.width * 0.5973333,
        size.height * 0.8253012,
      )
      ..lineTo(size.width * 0.5973333, size.height * 0.7710843)
      ..cubicTo(
        size.width * 0.5973333,
        size.height * 0.8975120,
        size.width * 0.5519653,
        size.height,
        size.width * 0.4960000,
        size.height,
      )
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(size.width * 0.3276933, size.height * 1.672307),
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

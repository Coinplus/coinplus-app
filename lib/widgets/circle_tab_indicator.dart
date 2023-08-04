import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size;
    if (size == null) {
      return;
    }
    final paint = Paint()
      ..color = color
      ..isAntiAlias = true;
    final circleOffset = Offset(
      size.width * .5 - radius * .5,
      size.height * .8,
    );
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}

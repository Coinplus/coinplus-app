import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get media => MediaQuery.of(this);

  double get height => media.size.height;

  double get bodyHeight => height - 100;

  double get width => media.size.width;

  double get topPadding => media.padding.top;

  double get bottomPadding => media.padding.bottom;

  bool get isDarkMode => media.platformBrightness == Brightness.dark;
}

extension ElevatedButtonHelper on ButtonStyle {
  ButtonStyle buttonColor(Color color) => copyWith(
        shadowColor: WidgetStateProperty.all(color),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.disabled) ? color.withOpacity(0.5) : color;
          },
        ),
      );

  ButtonStyle elevationSize(double elevation) {
    return copyWith(
      elevation: WidgetStateProperty.all(
        elevation,
      ),
    );
  }

  ButtonStyle paddingAll(double padding) {
    return copyWith(
      padding: WidgetStateProperty.all(
        EdgeInsets.all(padding),
      ),
    );
  }

  ButtonStyle paddingVertical(double padding) {
    return copyWith(
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(vertical: padding),
      ),
    );
  }

  ButtonStyle get removePaddings => copyWith(
        padding: WidgetStateProperty.all(
          EdgeInsets.zero,
        ),
      );

  ButtonStyle textColor(
    Color color,
  ) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all(
        color,
      ),
    );
  }
}

extension GlobalKeyEx on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();

    return translation != null && renderObject?.paintBounds != null
        ? renderObject!.paintBounds.shift(Offset(translation.x, translation.y))
        : null;
  }
}

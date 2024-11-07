import 'package:flutter/material.dart';

class ResponsiveGaps {
  final BuildContext context;
  final double height;
  final double width;

  ResponsiveGaps(this.context)
      : height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;

  double get secretStickersGap {
    if (height >= 932) {
      return width * 0.125;
    } else if (height >= 926) {
      return width * 0.115;
    } else if (height >= 874) {
      return width * 0.09;
    } else if (height >= 844 && height < 874) {
      return width * 0.08;
    } else if (height >= 667) {
      return width * 0.075;
    } else {
      return width * 0.125;
    }
  }

  double get betweenStickersAndTextFieldGap {
    if (height >= 932) {
      return height * 0.047;
    } else if (height >= 926) {
      return height * 0.048;
    } else if (height >= 867.4) {
      return height * 0.051;
    } else if (height >= 844) {
      return width * 0.114;
    } else if (height > 667) {
      return width * 0.1175;
    } else {
      return width * 0.065;
    }
  }

  double get logoPositionGap {
    if (height >= 932) {
      return height * 0.037;
    } else if (height >= 926) {
      return height * 0.036;
    } else if (height >= 867.4) {
      return height * 0.035;
    } else if (height > 844) {
      return height * 0.035;
    } else if (height > 667) {
      return height * 0.04;
    } else {
      return height * 0.03;
    }
  }

  double get containerHeight {
    if (height >= 932) {
      return height * 0.231;
    } else if (height >= 926) {
      return height * 0.24;
    } else if (height >= 867.4) {
      return height * 0.255;
    } else if (height > 844) {
      return height * 0.26;
    } else {
      return height * 0.265;
    }
  }

  double get containerWidth {
    if (height >= 932) {
      return width * 0.22;
    } else if (height >= 926) {
      return width * 0.225;
    } else if (height >= 874) {
      return width * 0.235;
    } else if (height >= 867.4) {
      return width * 0.23;
    } else if (height > 844) {
      return width * 0.241;
    } else if (height > 667) {
      return width * 0.25;
    } else {
      return width * 0.21;
    }
  }

  double get dynamicGap {
    if (height >= 932) {
      return 47;
    } else if (height >= 926) {
      return 42;
    } else if (height > 874) {
      return 42;
    } else if (height > 852) {
      if (height > 844) {
        return 30;
      } else if (height > 667) {
        return 28;
      } else {
        return 38;
      }
    } else {
      return 28;
    }
  }
}

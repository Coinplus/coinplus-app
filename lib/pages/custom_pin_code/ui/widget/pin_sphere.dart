import 'package:flutter/material.dart';

import '../../../../gen/colors.gen.dart';

class PinSphere extends StatelessWidget {
  final bool input;

  const PinSphere({Key? key, required this.input}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 13,
        height: 13,
        decoration: BoxDecoration(
          color: input
              ? AppColors.primaryButtonColor
              : Colors.grey.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

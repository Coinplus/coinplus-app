import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Center(
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: Image.asset('assets/images/coinpluslogo.png'),
        ),
      ),
    );
  }
}

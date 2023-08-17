import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../onboarding_page/form_factor_pages/bar_scan_methods_page.dart';

class BarBottomSheet extends HookWidget {
  final PageController controller;

  const BarBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const Gap(10),
          Row(
            children: [
              const Gap(16),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close_sharp,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              const Expanded(
                child: Text(
                  'Add new wallet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.redHatSemiBold,
                    fontSize: 17,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 60,
              ),
            ],
          ),
          const Gap(10),
          const Divider(
            thickness: 2,
            height: 2,
            indent: 15,
            endIndent: 15,
            color: Color(0xFFF1F1F1),
          ),
          const SizedBox(
            height: 300,
            child: BarScanMethodsPage(),
          ),
        ],
      ),
    );
  }
}

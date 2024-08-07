import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';

class CardAndBarTab extends StatelessWidget {
  const CardAndBarTab({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 128,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            color: Colors.grey.withOpacity(0.4),
          ),
        ],
      ),
      child: DefaultTabController(
        length: 2,
        child: SegmentedTabControl(
          textStyle: const TextStyle(
            fontFamily: FontFamily.redHatSemiBold,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          splashColor: Colors.transparent,
          splashHighlightColor: Colors.transparent,
          barDecoration:
              BoxDecoration(borderRadius: BorderRadius.circular(100)),
          indicatorDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          controller: tabController,
          tabs: const [
            SegmentTab(
              backgroundColor: Colors.white,
              label: 'Card',
              textColor: Colors.grey,
              splashColor: Colors.transparent,
              selectedTextColor: AppColors.primaryTextColor,
            ),
            SegmentTab(
              backgroundColor: Colors.white,
              label: 'Bar',
              textColor: Colors.grey,
              splashColor: Colors.transparent,
              selectedTextColor: AppColors.primaryTextColor,
            ),
          ],
        ),
      ),
    );
  }
}

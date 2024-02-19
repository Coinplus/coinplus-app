import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class HistoryDropdownShimmer extends StatelessWidget {
  const HistoryDropdownShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          Container(
            height: 35,
            width: 25,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.grey),
          ),
          const Gap(16.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
                height: 10,
                width: 125,
                margin: const EdgeInsets.only(bottom: 8),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
                height: 10,
                width: 75,
                margin: const EdgeInsets.only(bottom: 8),
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            height: 15,
            width: 65,
            margin: const EdgeInsets.only(bottom: 8),
          ),
        ],
      ),
    );
  }
}

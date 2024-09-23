import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class MarketPageShimmer extends StatelessWidget {
  const MarketPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        child: Row(
          children: [
            Container(
              height: 13,
              width: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey,
              ),
            ),
            const Gap(10),
            const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 13,
            ),
            const Gap(16.5),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  height: 10,
                  width: 55,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  height: 10,
                  width: 25,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  height: 13,
                  width: 65,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                const Gap(55),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  height: 13,
                  width: 70,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

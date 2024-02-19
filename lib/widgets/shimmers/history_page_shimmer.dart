import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class HistoryPageShimmer extends StatelessWidget {
  const HistoryPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
                height: 15,
                width: 75,
                margin: const EdgeInsets.only(bottom: 8),
              ),
              const Gap(25),
              ListView.separated(
                physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const Gap(15),
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 17,
                      ),
                      const Gap(16.5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        height: 15,
                        width: 75,
                        margin: const EdgeInsets.only(bottom: 8),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
                            height: 13,
                            width: 95,
                            margin: const EdgeInsets.only(bottom: 8),
                          ),
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

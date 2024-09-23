import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../extensions/context_extension.dart';
import '../../../gen/fonts.gen.dart';
import 'coins_data.dart';

class CoinsListWidget extends StatelessWidget {
  const CoinsListWidget({
    super.key,
    required this.pullToRefresh,
    required this.secondScrollController,
  });

  final Future<void> Function()? pullToRefresh;
  final ScrollController? secondScrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: secondScrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          elevation: 0.1,
          toolbarHeight: 20,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.width - 185,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '#',
                        style: TextStyle(
                          color: Color(0xFF838995),
                          fontFamily: FontFamily.redHatMedium,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(20),
                      Text(
                        'Market cap',
                        style: TextStyle(
                          color: Color(0xFF838995),
                          fontFamily: FontFamily.redHatMedium,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '24h %',
                        style: TextStyle(
                          color: Color(0xFF838995),
                          fontFamily: FontFamily.redHatMedium,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Price',
                  style: TextStyle(
                    color: Color(0xFF838995),
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: pullToRefresh,
        ),
        const SliverToBoxAdapter(child: Gap(10)),
        const CoinsDataWidget(),
        const SliverToBoxAdapter(child: Gap(120)),
      ],
    );
  }
}

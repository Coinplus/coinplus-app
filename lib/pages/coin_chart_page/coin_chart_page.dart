// ignore_for_file: cascade_invocations

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/chart_period_enum.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/coins_dto/coin_model.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../providers/screen_service.dart';
import '../../widgets/chart_loading_indicator/chart_loading_indicator.dart';
import 'card_select_dropdown.dart';
import 'chart_widget.dart';
import 'coin_name_and_price.dart';
import 'market_data_widget.dart';
import 'methods.dart';
import 'period_selection_tab_bar.dart';

@RoutePage()
class CoinChartPage extends StatefulWidget {
  const CoinChartPage({super.key, required this.data});

  final CoinResultModel? data;

  @override
  State<CoinChartPage> createState() => _CoinChartPageState();
}

class _CoinChartPageState extends State<CoinChartPage> {
  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  @override
  void initState() {
    super.initState();
    _marketPageStore
      ..getChartData(
        coinId: widget.data!.id,
        data: widget.data,
        period: '24h',
      )
      ..chartEnum = ChartEnum.ONE_DAY
      ..defaultPercentage(data: widget.data);
    timeStamp(marketPageStore: _marketPageStore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '${widget.data?.name}/USD',
          style: const TextStyle(
            fontFamily: FontFamily.redHatMedium,
            color: AppColors.primary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: Observer(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: () {
                  return onRefresh(
                    marketPageStore: _marketPageStore,
                    data: widget.data!,
                  );
                },
              ),
              SliverToBoxAdapter(
                child: CoinNameAndPrice(
                  widget: widget,
                  marketPageStore: _marketPageStore,
                ),
              ),
              const SliverToBoxAdapter(
                child: Gap(20),
              ),
              if (_marketPageStore.chartLoading ||
                  _marketPageStore.chartData.isEmpty)
                SliverToBoxAdapter(
                  child: ChartLoadingIndicator(widget: widget),
                )
              else
                SliverToBoxAdapter(
                  child: ChartWidget(
                    marketPageStore: _marketPageStore,
                    data: widget.data,
                  ),
                ),
              const SliverToBoxAdapter(
                child: Gap(30),
              ),
              SliverToBoxAdapter(
                child: PeriodSelectionTab(
                  marketPageStore: _marketPageStore,
                  widget: widget,
                ),
              ),
              const SliverToBoxAdapter(child: Gap(16)),
              Builder(
                builder: (context) {
                  return SliverToBoxAdapter(
                    child: MarketCapData(
                      widget: widget,
                    ),
                  );
                },
              ),
              const SliverToBoxAdapter(
                child: Gap(24),
              ),
              if (widget.data!.symbol == 'BTC')
                SliverToBoxAdapter(
                  child: ScaleTap(
                    enableFeedback: false,
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: router.navigatorKey.currentContext!,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        builder: (_) {
                          return const CardSelectDropdown();
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: const Color(0xFFf7931a),
                      ),
                      child: const Center(
                        child: Text(
                          'Buy bitcoin',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ).paddingHorizontal(60),
                )
              else
                const SliverToBoxAdapter(),
              const SliverToBoxAdapter(
                child: Gap(60),
              ),
            ],
          );
        },
      ),
    );
  }
}

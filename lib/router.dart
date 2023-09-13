import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

export 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class Router extends $Router {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AdaptiveRoute(
      page: SplashScreenRoute.page,
      fullscreenDialog: true,
      initial: true,
    ),
    AdaptiveRoute(
      page: OnboardingRoute.page,
    ),
    AdaptiveRoute(
      page: QrScannerRoute.page,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: BarFillRoute.page,
    ),
    AdaptiveRoute(
      page: Dashboard.page,
    ),
    AdaptiveRoute(
      page: CardFillRoute.page,
    ),
    AdaptiveRoute(
      page: WalletProtectionRoute.page,
    ),
    AdaptiveRoute(
      page: CardSettingsRoute.page,
    ),
    AdaptiveRoute(
      page: SettingsRoute.page,
    ),
    AdaptiveRoute(
      page: BarSettingsRoute.page,
    ),
    AdaptiveRoute(
      page: CreatePinRoute.page,
    ),
    AdaptiveRoute(page: PinRoute.page),
  ];
}

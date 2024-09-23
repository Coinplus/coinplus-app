import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

export 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class Router extends $Router {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AdaptiveRoute(
      page: SplashRoute.page,
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
      page: BarConnectRoute.page,
    ),
    AdaptiveRoute(
      page: BarConnectWithNfc.page,
    ),
    AdaptiveRoute(
      page: DashboardRoute.page,
    ),
    AdaptiveRoute(
      page: CardConnectRoute.page,
    ),
    AdaptiveRoute(
      page: CardConnectWithNfc.page,
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
      page: CreatePinCode.page,
    ),
    AdaptiveRoute(
      page: ChangePinCode.page,
    ),
    AdaptiveRoute(
      page: PinCodeRoute.page,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: PinRemove.page,
    ),
    AdaptiveRoute(
      page: PinAfterSplash.page,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: PinCodeForPrivateKey.page,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: PinCodeForEthPrivateKey.page,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: EthCardSettingsRoute.page,
    ),
    AdaptiveRoute(
      page: PinCodeForAllRoutes.page,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: ContactUs.page,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: CardActivationRoute.page,
    ),
    AdaptiveRoute(
      page: BarActivationRoute.page,
    ),
    AdaptiveRoute(
      page: AboutAppRoute.page,
    ),
    AdaptiveRoute(
      page: CoinChartRoute.page,
    ),
    AdaptiveRoute(
      page: BuyCardRoute.page,
    ),
  ];
}

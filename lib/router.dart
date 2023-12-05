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
      page: BarFillRoute.page,
    ),
    AdaptiveRoute(
      page: BarFillWithNfc.page,
    ),
    AdaptiveRoute(
      page: DashboardRoute.page,
    ),
    AdaptiveRoute(
      page: CardFillRoute.page,
    ),
    AdaptiveRoute(
      page: CardFillWithNfc.page,
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
      page: PinCodeForAllRoutes.page,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: ContactUs.page,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: CardSecretFillRoute.page,
    ),
    AdaptiveRoute(
      page: BarSecretFillRoute.page,
    ),
    AdaptiveRoute(
      page: AboutAppRoute.page,
    ),
  ];
}

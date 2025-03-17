import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../constants/button_settings.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../modals/android_nfc_session_modal/android_nfc_session_modal.dart';
import '../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../services/firebase_service.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../utils/card_nfc_session.dart';
import '../../utils/deep_link_util.dart';
import '../../widgets/connect_manually_button/connect_manually_button.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../splash_screen/splash_screen.dart';

@RoutePage()
class OnboardingPage extends HookWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.width.toString());
    final _nfcState = useMemoized(AllSettingsState.new);
    final cardColorRes = useRef<String?>(null);
    final deepLinkRes = useRef<String?>(null);
    final resumed = useState(false);

    useOnAppLifecycleStateChange(
      (previous, current) => resumed.value = [AppLifecycleState.resumed].contains(current),
    );

    useEffect(
      () {
        _nfcState.checkNfcSupport();
        final streamSubscription = FlutterBranchSdk.listSession().listen(
          (data) async {
            deepLinkRes.value = onLinkPassed(data);
            final cardDataFromDb = await getCardData(deepLinkRes.value.toString());
            cardColorRes.value = cardDataFromDb?.color ?? '';
            if (deepLinkRes.value != null &&
                router.current.name != CardConnectWithNfc.name &&
                router.current.name != CardConnectRoute.name &&
                router.current.name != BarConnectRoute.name &&
                router.current.name != BarConnectWithNfc.name) {
              await router.push(
                CardConnectWithNfc(
                  receivedData: deepLinkRes.value,
                  cardColor: cardColorRes.value,
                  backupPack: cardDataFromDb?.backupPack ?? false,
                  backup: cardDataFromDb?.backup ?? false,
                  isOriginalNxp: true,
                  isActivated: cardDataFromDb?.activated,
                ),
              );
              await recordAmplitudeEvent(
                DeeplinkClicked(
                  source: 'Onboarding',
                  walletAddress: deepLinkRes.value!,
                  walletType: 'Card',
                ),
              );
              deepLinkRes.value = null;
            }
          },
        );

        return streamSubscription.cancel;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
        ),
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Observer(
        builder: (context) {
          return Column(
            children: [
              const Spacer(flex: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(16),
                  SizedBox(
                    height: 56,
                    child: Assets.images.coinpluslogo.image(),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              const Text(
                'Hey there,\nlet’s connect your new wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: FontFamily.redHatSemiBold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const Spacer(flex: 3),
              if (_nfcState.isNfcSupported)
                LoadingButton(
                  onPressed: Platform.isIOS
                      ? nfcSessionIos
                      : () async {
                          await nfcSessionAndroid();
                          await showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return const AndroidNfcSessionModal();
                            },
                          );
                        },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(5),
                      const Text(
                        'Connect wallet',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontFamily.redHatSemiBold,
                        ),
                      ),
                      const Gap(5),
                      Assets.icons.nfcIcon.image(
                        height: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ).paddingHorizontal(63)
              else
                const SizedBox(),
              const Gap(10),
              const ConnectManuallyButton(),
              const Spacer(flex: 3),
              LoadingButton(
                onPressed: () async {
                  unawaited(
                    recordAmplitudeEventPartTwo(
                      const DontHaveCardClicked(),
                    ),
                  );
                  await signInAnonymously();
                  await setWalletShown();
                  await router.pushAndPopAll(const DashboardRoute());
                },
                style: context.theme
                    .buttonStyle(
                      buttonType: ButtonTypes.TRANSPARENT,
                      textStyle: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontSize: 15,
                      ),
                    )
                    .copyWith(
                      overlayColor: WidgetStateProperty.all(
                        Colors.grey.withValues(alpha: 0.1),
                      ),
                      splashFactory: NoSplash.splashFactory,
                    ),
                child: const Text('Don’t have a card?'),
              ).paddingHorizontal(64),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../../extensions/context_extension.dart';
import '../../../extensions/elevated_button_extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../utils/card_nfc_session.dart';
import '../../../widgets/loading_button/loading_button.dart';

@RoutePage()
class BackupMyWalletPage extends StatefulWidget {
  const BackupMyWalletPage({
    super.key,
    required this.walletAddress,
    required this.hasBackup,
    required this.isWalletActivated,
  });

  final String walletAddress;
  final bool? hasBackup;
  final bool? isWalletActivated;

  @override
  State<BackupMyWalletPage> createState() => _BackupMyWalletPageState();
}

class _BackupMyWalletPageState extends State<BackupMyWalletPage> {
  final _pageController = PageController();
  final _settingsState = AllSettingsState();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = _pageController.page?.round() ?? 0;
    _settingsState.setPage(page);
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Observer(
          builder: (context) {
            return Row(
              children: [
                if (_settingsState.currentPage == 0)
                  IconButton(
                    splashRadius: 30,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      router.pushAndPopAll(const DashboardRoute());
                    },
                    icon: Assets.icons.close.image(),
                  )
                else
                  IconButton(
                    splashRadius: 30,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: Assets.icons.arrowBackIos.image(height: 25),
                  ),
                const Gap(5),
                const Text(
                  'Backup my wallet',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            );
          },
        ),
        iconTheme: const IconThemeData(color: AppColors.primary),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Assets.icons.backupWalletIllustration.image(
                  height: 212,
                ),
              ),
              const Gap(11),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 31),
                child: Text(
                  'Backing up your wallet adds an extra layer of security, allowing you to quickly transfer your funds if the original wallet is lost.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              if (widget.isWalletActivated == true)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: LoadingButton(
                    style: context.theme
                        .buttonStyle(
                          textStyle: const TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            color: AppColors.primaryTextColor,
                            fontSize: 15,
                          ),
                        )
                        .copyWith(),
                    onPressed: () async {
                      await router.pushAndPopAll(const DashboardRoute());
                      await connectBackupWalletIos(
                        mainWalletAddress: widget.walletAddress,
                      );
                    },
                    child: const Text(
                      'Add a backup card',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: LoadingButton(
                    style: context.theme
                        .buttonStyle(
                          textStyle: const TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            color: AppColors.primaryTextColor,
                            fontSize: 15,
                          ),
                        )
                        .copyWith(),
                    onPressed: () async {
                      await _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      'Activate card',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              if (widget.isWalletActivated == true)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    children: [
                      const Gap(14),
                      LoadingButton(
                        onPressed: () async {},
                        style: context.theme
                            .buttonStyle(
                              textStyle: const TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                color: AppColors.primaryTextColor,
                                fontSize: 15,
                              ),
                            )
                            .copyWith(
                              overlayColor: WidgetStateProperty.all(
                                Colors.grey.withOpacity(0.1),
                              ),
                              splashFactory: NoSplash.splashFactory,
                              backgroundColor: WidgetStateProperty.all(
                                Colors.grey.withOpacity(0.2),
                              ),
                            ),
                        child: const Text('Get a backup card'),
                      ),
                    ],
                  ),
                ),
              const Gap(40),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Assets.icons.activateWalletIllustration.image(
                  height: 212,
                ),
              ),
              const Gap(11),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 31),
                child: Text(
                  'To back up your wallet, you need to scratch off the security stickers on your card and enter the \nrevealed codes into the app.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: LoadingButton(
                  style: context.theme
                      .buttonStyle(
                        textStyle: const TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          color: AppColors.primaryTextColor,
                          fontSize: 15,
                        ),
                      )
                      .copyWith(),
                  onPressed: () async {
                    await router.push(
                      CardActivationRoute(
                        receivedData: widget.walletAddress,
                        hasBackup: widget.hasBackup,
                      ),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Gap(40),
            ],
          ),
        ],
      ),
    );
  }
}

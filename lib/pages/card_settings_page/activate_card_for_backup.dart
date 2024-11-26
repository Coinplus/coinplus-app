import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../all_alert_dialogs/dont_have_secrets_dialog/dont_have_secrets_dialog.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../widgets/loading_button/loading_button.dart';

@RoutePage()
class ActivateCardForBackup extends StatefulWidget {
  const ActivateCardForBackup({super.key, required this.card});

  final AbstractCard card;

  @override
  State<ActivateCardForBackup> createState() => _ActivateCardForBackupState();
}

HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

class _ActivateCardForBackupState extends State<ActivateCardForBackup> {
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
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Theme(
              data: ThemeData(
                canvasColor: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: IconButton(
                highlightColor: Colors.transparent,
                onPressed: () async {
                  if (_settingsState.currentPage == 1) {
                    await _pageController.animateTo(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    await router.maybePop();
                  }
                },
                icon: Assets.icons.arrowBackIos.image(height: 30),
              ),
            ),
            const Gap(10),
            const Text(
              'Lost my card',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                color: AppColors.primary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Column(
              children: [
                const Spacer(),
                Assets.images.lostCardIllustration.image(),
                const Gap(46),
                const Text(
                  'Immediate action is required!',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const Gap(8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 31),
                  child: Text(
                    'All your funds will be transferred to your backup wallet, and this wallet will be blocked. This ensures that anyone who finds it won’t be able to send funds using the Coinplus app.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                LoadingButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text(
                    'Activate Card',
                    style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 15),
                  ),
                ).paddingHorizontal(64),
                const Gap(40),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                const Spacer(),
                Assets.images.card.secretsScratchImage.image(),
                const Gap(46),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 31),
                  child: Text(
                    'Do you have the codes found beneath the security stickers?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 130,
                      child: LoadingButton(
                        onPressed: () async {
                          final cardIndex = _balanceStore.cards.indexOf(widget.card);
                          await _historyPageStore.setCardActivationIndex(index: cardIndex);
                          final cardData = await getCardData(widget.card.address);
                          await router.push(CardActivationRoute(s: cardData?.s, backupPack: cardData?.backupPack));
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      child: LoadingButton(
                        onPressed: () {
                          router.popUntilRouteWithName(DashboardRoute.name);
                          dontHaveSecretsDialog(context);
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

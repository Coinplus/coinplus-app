import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amplitude_event_part_two.freezed.dart';

part 'amplitude_event_part_two.g.dart';

@freezed
class AmplitudeEventPartTwo with _$AmplitudeEventPartTwo {
  const factory AmplitudeEventPartTwo.continueClicked({
    @Default('CONTINUE_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = ContinueCLicked;

  const factory AmplitudeEventPartTwo.editSecretsClicked({
    @Default('EDIT_SECRETS_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = EditSecretsClicked;

  const factory AmplitudeEventPartTwo.walletActivated({
    @Default('WALLET_ACTIVATED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = WalletActivated;

  const factory AmplitudeEventPartTwo.walletActivationFailed({
    @Default('WALLET_ACTIVATION_FAILED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = WalletActivationFailed;

  const factory AmplitudeEventPartTwo.guideMeClicked({
    @Default('GUIDE_ME_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = GuideMeClicked;

  const factory AmplitudeEventPartTwo.cardColorChanged({
    @Default('CARD_COLOR_CHANGED') String eventType,
    required String walletAddress,
    required String color,
  }) = CardColorCHanged;

  const factory AmplitudeEventPartTwo.clickedOnPrivateKey({
    @Default('CLICKED_ON_PRIVATE_KEY') String eventType,
    required String walletAddress,
    required String walletType,
  }) = ClickedOnPrivateKey;

  const factory AmplitudeEventPartTwo.privateKeyRevealed({
    @Default('PRIVATE_KEY_REVEALED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = PrivateKeyRevealed;

  const factory AmplitudeEventPartTwo.privateKeyCopied({
    @Default('PRIVATE_KEY_COPIED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = PrivateKeyCopied;

  const factory AmplitudeEventPartTwo.cardNameChanged({
    @Default('CARD_NAME_CHANGED') String eventType,
    required String walletType,
  }) = CardNameChanged;

  const factory AmplitudeEventPartTwo.helpCenterClicked({
    @Default('HELP_CENTER_CLICKED') String eventType,
    required String source,
  }) = HelpCenterClicked;

  const factory AmplitudeEventPartTwo.removeCardClicked({
    @Default('REMOVE_CARD_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = RemoveCardClicked;

  const factory AmplitudeEventPartTwo.cardDeleted({
    @Default('CARD_DELETED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = CardDeleted;

  const factory AmplitudeEventPartTwo.notSureClicked({
    @Default('NOT_SURE_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = NotSureClicked;

  const factory AmplitudeEventPartTwo.contactUsClicked({
    @Default('CONTACT_US_CLICKED') String eventType,
  }) = ContactUsClicked;

  const factory AmplitudeEventPartTwo.appLockClicked({
    @Default('APP_LOCK_CLICKED') String eventType,
  }) = AppLockClicked;

  const factory AmplitudeEventPartTwo.appLockDisabled({
    @Default('APP_LOCK_DISABLED') String eventType,
  }) = AppLockDisabled;

  const factory AmplitudeEventPartTwo.changePasscodeClicked({
    @Default('CHANGE_PASSCODE_CLICKED') String eventType,
  }) = ChangePasscodeClicked;

  const factory AmplitudeEventPartTwo.passcodeChanged({
    @Default('PASSCODE_CHANGED') String eventType,
  }) = PasscodeChanged;

  const factory AmplitudeEventPartTwo.faceIdEnabled({
    @Default('FACE_ID_ENABLED') String eventType,
  }) = FaceIdEnabled;

  const factory AmplitudeEventPartTwo.faceIdDisabled({
    @Default('FACE_ID_DISABLED') String eventType,
  }) = FaceIdDisabled;

  const factory AmplitudeEventPartTwo.pushNotificationsOn({
    @Default('PUSH_NOTIFICATIONS_ON') String eventType,
  }) = PushNotificationsOn;

  const factory AmplitudeEventPartTwo.pushNotificationsOff({
    @Default('PUSH_NOTIFICATIONS_OFF') String eventType,
  }) = PushNotificationsOff;

  const factory AmplitudeEventPartTwo.joinCommunityClicked({
    @Default('JOIN_COMMUNITY_CLICKED') String eventType,
    required String social,
  }) = JoinCommunityClicked;

  const factory AmplitudeEventPartTwo.privacyPolicyClicked({
    @Default('PRIVACY_POLICY_CLICKED') String eventType,
  }) = PrivacyPolicyClicked;

  const factory AmplitudeEventPartTwo.termsOfUseClicked({
    @Default('TERMS_OF_USE_CLICKED') String eventType,
  }) = TermsOfUseClicked;

  const factory AmplitudeEventPartTwo.verifyCardClicked({
    @Default('VERIFY_CARD_CLICKED') String eventType,
  }) = VerifyCardClicked;

  const factory AmplitudeEventPartTwo.verifyCardTapped({
    @Default('VERIFY_CARD_TAPPED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = VerifyCardTapped;

  const factory AmplitudeEventPartTwo.sendMessageClicked({
    @Default('SEND_MESSAGE_CLICKED') String eventType,
  }) = SendMessageClicked;

  const factory AmplitudeEventPartTwo.cardTabClicked({
    @Default('CARD_TAB_CLICKED') String eventType,
  }) = CardTabClicked;

  const factory AmplitudeEventPartTwo.barTabClicked({
    @Default('BAR_TAB_CLICKED') String eventType,
  }) = BarTabClicked;

  const factory AmplitudeEventPartTwo.tapToConnectClicked({
    @Default('TAP_TO_CONNECT_CLICKED') String eventType,
    required String tab,
  }) = TapToConnectClicked;

  const factory AmplitudeEventPartTwo.cardDamagedClicked({
    @Default('CARD_DAMAGED_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = CardDamagedClicked;

  const factory AmplitudeEventPartTwo.nfcNotWorkingClicked({
    @Default('NFC_NOT_WORKING_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = NfcNotWorkingCLicked;

  const factory AmplitudeEventPartTwo.dontHaveCardWithMeNowClicked({
    @Default('DONT_HAVE_CARD_WITH_ME_NOW_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = DontHaveCardWithMeNowClicked;

  const factory AmplitudeEventPartTwo.lostCardClicked({
    @Default('LOST_CARD_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = LostCardClicked;

  const factory AmplitudeEventPartTwo.troubleActivateClicked({
    @Default('TROUBLE_ACTIVATE_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = TroubleActivateClicked;

  const factory AmplitudeEventPartTwo.troubleCloseClicked({
    @Default('TROUBLE_CLOSE_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = TroubleCloseClicked;

  const factory AmplitudeEventPartTwo.troubleGotItClicked({
    @Default('TROUBLE_GOT_IT_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = TroubleGotItClicked;

  const factory AmplitudeEventPartTwo.troubleActivateNowClicked({
    @Default('TROUBLE_ACTIVATE_NOW_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = TroubleActivateNowClicked;

  const factory AmplitudeEventPartTwo.cardAdded({
    @Default('CARD_ADDED') String eventType,
    required String address,
  }) = CardAddedEvent;

  const factory AmplitudeEventPartTwo.barAdded({
    @Default('BAR_ADDED') String eventType,
    required String address,
  }) = BarAddedEvent;

  const factory AmplitudeEventPartTwo.eraseMyDataClicked({
    @Default('ERASE_MY_DATA_CLICKED') String eventType,
  }) = EraseMyDataClicked;

  const factory AmplitudeEventPartTwo.eraseMyDataConfirmed({
    @Default('ERASE_MY_DATA_CONFIRMED') String eventType,
  }) = EraseMyDataConfirmed;

  const factory AmplitudeEventPartTwo.coinSearchClicked({
    @Default('COIN_SEARCH_CLICKED') String eventType,
  }) = CoinSearchClicked;

  const factory AmplitudeEventPartTwo.coinSearched({
    @Default('COIN_SEARCHED') String eventType,
    required String coinName,
  }) = CoinSearched;

  const factory AmplitudeEventPartTwo.fiatClicked({
    @Default('FIAT_CLICKED') String eventType,
  }) = FiatCliked;

  const factory AmplitudeEventPartTwo.coinClicked({
    @Default('COIN_CLICKED') String eventType,
    required String coinName,
  }) = CoinClicked;

  const factory AmplitudeEventPartTwo.loadCoinsClicked({
    @Default('LOAD_COINS_CLICKED') String eventType,
  }) = LoadCoinsClicked;

  const factory AmplitudeEventPartTwo.goUpClicked({
    @Default('GO_UP_CLICKED') String eventType,
  }) = GoUpClicked;

  const factory AmplitudeEventPartTwo.cardTabHistoryClicked({
    @Default('CARD_TAB_HISTORY_CLICKED') String eventType,
  }) = CardTabHistoryClicked;

  const factory AmplitudeEventPartTwo.barTabHistoryClicked({
    @Default('BAR_TAB_HISTORY_CLICKED') String eventType,
  }) = BarTabHistoryClicked;

  const factory AmplitudeEventPartTwo.selectWalletClicked({
    @Default('SELECT_WALLET_CLICKED') String eventType,
    required String walletType,
  }) = SelectWalletClicked;

  const factory AmplitudeEventPartTwo.walletSelected({
    @Default('WALLET_SELECTED') String eventType,
    required String walletType,
    required String address,
  }) = WalletSelected;

  const factory AmplitudeEventPartTwo.pullToRefresh({
    @Default('PULL_TO_REFRESH') String eventType,
    required String source,
  }) = PullToRefresh;

  const factory AmplitudeEventPartTwo.transactionClicked({
    @Default('TRANSACTION_CLICKED') String eventType,
  }) = TransactionClicked;

  const factory AmplitudeEventPartTwo.loadTransactionClicked({
    @Default('LOAD_TRANSACTION_CLICKED') String eventType,
  }) = LoadTransactionClicked;

  const factory AmplitudeEventPartTwo.refreshClicked({
    @Default('REFRESH_CLICKED') String eventType,
    required String address,
  }) = RefreshClicked;

  const factory AmplitudeEventPartTwo.buyBitcoinShown({
    @Default('BUY_BITCOIN_SHOWN') String eventType,
  }) = BuyBitcoinShown;

  const factory AmplitudeEventPartTwo.buyBitcoinNowClicked({
    @Default('BUY_BITCOIN_NOW_CLICKED') String eventType,
  }) = BuyBitcoinNowClicked;

  const factory AmplitudeEventPartTwo.dontHaveCardClicked({
    @Default('DONT_HAVE_CARD_CLICKED') String eventType,
  }) = DontHaveCardClicked;

  const factory AmplitudeEventPartTwo.pageIndicatorClicked({
    @Default('PAGE_INDICATOR_CLICKED') String eventType,
  }) = PageIndicatorClicked;

  const factory AmplitudeEventPartTwo.activationNextClicked({
    @Default('ACTIVATION_NEXT_CLICKED') String eventType,
    required String address,
  }) = ActivationNextClicked;

  const factory AmplitudeEventPartTwo.sendToAddressFilled({
    @Default('SEND_TO_ADDRESS_FILLED') String eventType,
    required String address,
  }) = SendToAddressFilled;

  const factory AmplitudeEventPartTwo.sendFromAddressChanged({
    @Default('SEND_FROM_ADDRESS_CHANGED') String eventType,
    required String address,
  }) = SendFromAddressChanged;

  const factory AmplitudeEventPartTwo.sendNextClicked({
    @Default('SEND_NEXT_CLICKED') String eventType,
    required String sendToAddress,
    required String sendFromAddress,
  }) = SendNextClicked;

  const factory AmplitudeEventPartTwo.amountEntered({
    @Default('AMOUNT_ENTERED') String eventType,
    required String amount,
    required String balance,
    required String fee,
  }) = AmountEntered;

  const factory AmplitudeEventPartTwo.sendCurrencyChanged({
    @Default('SEND_CURRENCY_CHANGED') String eventType,
    required String currency,
  }) = SendCurrencyChanged;

  const factory AmplitudeEventPartTwo.useMaxClicked({
    @Default('USE_MAX_CLICKED') String eventType,
    required String amount,
    required String enoughFunds,
  }) = UseMaxClicked;

  const factory AmplitudeEventPartTwo.amountNextClicked({
    @Default('AMOUNT_NEXT_CLICKED') String eventType,
    required String sendToAddress,
    required String sendFromAddress,
    required String amount,
    required String balance,
    required String fee,
  }) = AmountNextClicked;

  const factory AmplitudeEventPartTwo.sendClicked({
    @Default('SEND_CLICKED') String eventType,
    required String sendToAddress,
    required String sendFromAddress,
    required String amount,
    required String balance,
    required String fee,
    required String txHash,
  }) = SendClicked;

  factory AmplitudeEventPartTwo.fromJson(Map<String, dynamic> json) =>
      _$AmplitudeEventPartTwoFromJson(json);
}

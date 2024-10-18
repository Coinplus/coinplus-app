import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amplitude_event.freezed.dart';

part 'amplitude_event.g.dart';

@freezed
class AmplitudeEvent with _$AmplitudeEvent {
  const factory AmplitudeEvent.connectWalletClicked({
    @Default('CONNECT_WALLET_CLICKED') String eventType,
  }) = ConnectWalletClicked;

  const factory AmplitudeEvent.connectManuallyClicked({
    @Default('CONNECT_MANUALLY_CLICKED') String eventType,
    required String source,
  }) = ConnectManuallyClicked;

  const factory AmplitudeEvent.connectWithQrClicked({
    @Default('CONNECT_WITH_QR_CLICKED') String eventType,
    required String source,
  }) = ConnectWitchQrClicked;

  const factory AmplitudeEvent.qrButtonClicked({
    @Default('QR_BUTTON_CLICKED') String eventType,
    required String walletType,
    required String source,
  }) = QrButtonClicked;

  const factory AmplitudeEvent.qrScanned({
    @Default('QR_SCANNED') String eventType,
    required String source,
    required String walletAddress,
  }) = QrScanned;

  const factory AmplitudeEvent.buyNewCardClicked({
    @Default('BUY_NEW_CARD_CLICKED') String eventType,
    required String source,
  }) = BuyNewCardClicked;

  const factory AmplitudeEvent.connectOptionSelected({
    @Default('CONNECT_OPTION_SELECTED') String eventType,
    required String source,
    required String connectOption,
  }) = ConnectOptionSelected;

  const factory AmplitudeEvent.nfcTapped({
    @Default('NFC_TAPPED') String eventType,
    required String source,
    required String walletAddress,
  }) = NfcTapped;

  const factory AmplitudeEvent.nfcClosed({
    @Default('NFC_CLOSED') String eventType,
    required String source,
  }) = NfcClosed;

  const factory AmplitudeEvent.addressFilled({
    @Default('ADDRESS_FILLED') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
  }) = AddressFilled;

  const factory AmplitudeEvent.deepLinkClicked({
    @Default('DEEPLINK_CLICKED') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
  }) = DeeplinkClicked;

  const factory AmplitudeEvent.typeSelected({
    @Default('WALLET_TYPE_SELECTED') String eventType,
    required String source,
    required String walletType,
  }) = TypeSelected;

  const factory AmplitudeEvent.saveToWalletClicked({
    @Default('SAVE_TO_WALLET_CLICKED') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
  }) = SaveToWalletClicked;

  const factory AmplitudeEvent.alreadySavedGotItClicked({
    @Default('ALREADY_SAVED_GOT_IT_CLICKED') String eventType,
    required String walletType,
    required String walletAddress,
  }) = AlreadySavedGotItClicked;

  const factory AmplitudeEvent.activatedCheckboxClicked({
    @Default('ACTIVATED_CHECKBOX_CLICKED') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
  }) = ActivatedCheckboxClicked;

  const factory AmplitudeEvent.gotItClicked({
    @Default('GOT_IT_CLICKED') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
  }) = GotItClicked;

  const factory AmplitudeEvent.fakeWallet({
    @Default('FAKE_WALLET') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
  }) = FakeWallet;

  const factory AmplitudeEvent.warningCheckboxClicked({
    @Default('WARNING_CHECKBOX_CLICKED') String eventType,
  }) = WarningCheckboxClicked;

  const factory AmplitudeEvent.appLockEnabled({
    @Default('APP_LOCK_ENABLED') String eventType,
  }) = AppLockEnabled;

  const factory AmplitudeEvent.notNowLockClicked({
    @Default('NOT_NOW_LOCK_CLICKED') String eventType,
  }) = NotNowLockClicked;

  const factory AmplitudeEvent.walletTabClicked({
    @Default('WALLET_TAB_CLICKED') String eventType,
  }) = WalletTabClicked;

  const factory AmplitudeEvent.marketTabClicked({
    @Default('MARKET_TAB_CLICKED') String eventType,
  }) = MarketTabClicked;

  const factory AmplitudeEvent.historyTabClicked({
    @Default('HISTORY_TAB_CLICKED') String eventType,
  }) = HistoryTabClicked;

  const factory AmplitudeEvent.settingsTabClicked({
    @Default('SETTINGS_TAB_CLICKED') String eventType,
  }) = SettingsTabClicked;

  const factory AmplitudeEvent.transactionsButtonClicked({
    @Default('TRANSACTIONS_BUTTON_CLICKED') String eventType,
    required String walletType,
    required String walletAddress,
    required bool activated,
  }) = TransactionsButtonClicked;

  const factory AmplitudeEvent.addNewClicked({
    @Default('ADD_NEW_CLICKED') String eventType,
    required String tab,
  }) = AddNewClicked;

  const factory AmplitudeEvent.addNewPlusClicked({
    @Default('ADD_NEW_PLUS_CLICKED') String eventType,
    required String source,
  }) = AddNewPlusClicked;

  const factory AmplitudeEvent.walletSettingsClicked({
    @Default('WALLET_SETTINGS_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = WalletSettingsClicked;

  const factory AmplitudeEvent.topUpButtonCLicked({
    @Default('TOP_UP_BUTTON_CLICKED') String eventType,
    required String walletType,
    required String walletAddress,
    required bool activated,
  }) = TopUpButtonClicked;

  const factory AmplitudeEvent.receiveClicked({
    @Default('RECEIVE_CLICKED') String eventType,
    required String walletType,
    required String walletAddress,
    required bool activated,
  }) = ReceiveClicked;

  const factory AmplitudeEvent.sendClicked({
    @Default('SEND_CLICKED') String eventType,
    required String walletType,
    required String walletAddress,
    required bool activated,
  }) = SendClicked;

  const factory AmplitudeEvent.buyWithCardClicked({
    @Default('BUY_WITH_CARD_CLICKED') String eventType,
    required String walletType,
    required String walletAddress,
    required bool activated,
  }) = BuyWithCardClicked;

  const factory AmplitudeEvent.historyClicked({
    @Default('HISTORY_CLICKED') String eventType,
    required String walletType,
    required String walletAddress,
    required bool activated,
  }) = HistoryClicked;

  const factory AmplitudeEvent.addressCopied({
    @Default('ADDRESS_COPIED') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
    required bool activated,
  }) = AddressCopied;

  const factory AmplitudeEvent.shareAddressClicked({
    @Default('SHARE_ADDRESS_CLICKED') String eventType,
    required String walletType,
    required String walletAddress,
    required bool activated,
  }) = ShareAddressClicked;

  const factory AmplitudeEvent.gotItSendClicked({
    @Default('GOT_IT_SEND_CLICKED') String eventType,
  }) = GotItSendClicked;

  const factory AmplitudeEvent.iNeedToSendNow({
    @Default('I_NEED_TO_SEND_NOW') String eventType,
  }) = IneedToSendNow;

  const factory AmplitudeEvent.iNeedToSendGotIt({
    @Default('I_NEED_TO_SEND_GOT_IT') String eventType,
  }) = IneedToSendGotIt;

  const factory AmplitudeEvent.backButtonClicked({
    @Default('BACK_BUTTON_CLICKED') String eventType,
    required String source,
  }) = BackButtonClicked;

  const factory AmplitudeEvent.secret1Validated({
    @Default('SECRET_1_VALIDATED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = Secret1Validated;

  const factory AmplitudeEvent.secret2Validated({
    @Default('SECRET_2_VALIDATED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = Secret2Validated;

  const factory AmplitudeEvent.onboardingStarted({
    @Default('ONBOARDING_STARTED') String eventType,
  }) = OnboardingStarted;

  const factory AmplitudeEvent.walletOpened({
    @Default('WALLET_OPENED') String eventType,
  }) = WalletOpened;

  factory AmplitudeEvent.fromJson(Map<String, dynamic> json) => _$AmplitudeEventFromJson(json);
}

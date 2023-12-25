import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amplitude_event.freezed.dart';

part 'amplitude_event.g.dart';

@freezed
class AmplitudeEvent with _$AmplitudeEvent {
  const factory AmplitudeEvent.login({
    @Default('LOGIN') String eventType,
  }) = LoginEvent;

  const factory AmplitudeEvent.connectWalletClicked({
    @Default('CONNECT_WALLET_CLICKED') String eventType,
  }) = ConnectWalletClicked;

  const factory AmplitudeEvent.connectManuallyClicked({
    @Default('CONNECT_MANUALLY_CLICKED') String eventType,
  }) = ConnectManuallyClicked;

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

  const factory AmplitudeEvent.qrScanned({
    @Default('QR_SCANNED') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
  }) = QrScanned;

  const factory AmplitudeEvent.deepLinkClicked({
    @Default('DEEPLINK_CLICKED') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
  }) = DeeplinkClicked;

  const factory AmplitudeEvent.typeSelected({
    @Default('TYPE_SELECTED') String eventType,
    required String source,
    required String walletType,
  }) = TypeSelected;

  const factory AmplitudeEvent.saveToWalletClicked({
    @Default('SAVE_TO_WALLET_CLICKED') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
  }) = SaveToWalletClicked;

  const factory AmplitudeEvent.gotItClicked({
    @Default('GOT_IT_CLICKED') String eventType,
    required String source,
    required String walletType,
    required String walletAddress,
  }) = GotItClicked;

  const factory AmplitudeEvent.warningCheckboxClicked({
    @Default('WARNING_CHECKBOX_CLICKED') String eventType,
  }) = WarningCheckboxClicked;

  const factory AmplitudeEvent.appLockEnabled({
    @Default('APP_LOCK_ENABLED') String eventType,
  }) = AppLockEnabled;

  const factory AmplitudeEvent.notNowClicked({
    @Default('NOT_NOW_CLICKED') String eventType,
  }) = NotNowClicked;

  const factory AmplitudeEvent.walletTabClicked({
    @Default('WALLET_TAB_CLICKED') String eventType,
  }) = WalletTabClicked;

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

  const factory AmplitudeEvent.sendAnywayClicked({
    @Default('SEND_ANYWAY_CLICKED') String eventType,
  }) = SendAnywayClicked;

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

  const factory AmplitudeEvent.continueClicked({
    @Default('CONTINUE_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = ContinueCLicked;

  const factory AmplitudeEvent.validationSuccessful({
    @Default('VALIDATION_SUCCESSFUL') String eventType,
    required String walletAddress,
    required String walletType,
  }) = ValidationSuccessful;

  const factory AmplitudeEvent.validationFailed({
    @Default('VALIDATION_FAILED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = ValidationFailed;

  const factory AmplitudeEvent.guideMeClicked({
    @Default('GUIDE_ME_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = GuideMeClicked;

  const factory AmplitudeEvent.cardColorChanged({
    @Default('CARD_COLOR_CHANGED') String eventType,
    required String walletAddress,
    required String color,
  }) = CardColorCHanged;

  const factory AmplitudeEvent.clickedOnPrivateKey({
    @Default('CLICKED_ON_PRIVATE_KEY') String eventType,
    required String walletAddress,
    required String walletType,
  }) = ClickedOnPrivateKey;

  const factory AmplitudeEvent.privateKeyRevealed({
    @Default('PRIVATE_KEY_REVEALED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = PrivateKeyRevealed;

  const factory AmplitudeEvent.privateKeyCopied({
    @Default('PRIVATE_KEY_COPIED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = PrivateKeyCopied;

  const factory AmplitudeEvent.cardNameChanged({
    @Default('CARD_NAME_CHANGED') String eventType,
    required String walletType,
  }) = CardNameChanged;

  const factory AmplitudeEvent.helpCenterClicked({
    @Default('HELP_CENTER_CLICKED') String eventType,
    required String source,
  }) = HelpCenterClicked;

  const factory AmplitudeEvent.removeCardClicked({
    @Default('REMOVE_CARD_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = RemoveCardClicked;

  const factory AmplitudeEvent.cardDeleted({
    @Default('CARD_DELETED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = CardDeleted;

  const factory AmplitudeEvent.notSureClicked({
    @Default('NOT_SURE_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = NotSureClicked;

  const factory AmplitudeEvent.contactUsClicked({
    @Default('CONTACT_US_CLICKED') String eventType,
  }) = ContactUsClicked;

  const factory AmplitudeEvent.appLockClicked({
    @Default('APP_LOCK_CLICKED') String eventType,
  }) = AppLockClicked;

  const factory AmplitudeEvent.appLockDisabled({
    @Default('APP_LOCK_DISABLED') String eventType,
  }) = AppLockDisabled;

  const factory AmplitudeEvent.changePasscodeClicked({
    @Default('CHANGE_PASSCODE_CLICKED') String eventType,
  }) = ChangePasscodeClicked;

  const factory AmplitudeEvent.passcodeChanged({
    @Default('PASSCODE_CHANGED') String eventType,
  }) = PasscodeChanged;

  const factory AmplitudeEvent.faceIdEnabled({
    @Default('FACE_ID_ENABLED') String eventType,
  }) = FaceIdEnabled;

  const factory AmplitudeEvent.pushNotificationsOn({
    @Default('PUSH_NOTIFICATIONS_ON') String eventType,
  }) = PushNotificationsOn;

  const factory AmplitudeEvent.pushNotificationsOff({
    @Default('PUSH_NOTIFICATIONS_OFF') String eventType,
  }) = PushNotificationsOff;

  const factory AmplitudeEvent.joinCommunityClicked({
    @Default('JOIN_COMMUNITY_CLICKED') String eventType,
    required String social,
  }) = JoinCommunityClicked;

  const factory AmplitudeEvent.privacyPolicyClicked({
    @Default('PRIVACY_POLICY_CLICKED') String eventType,
  }) = PrivacyPolicyClicked;

  const factory AmplitudeEvent.termsOfUseClicked({
    @Default('TERMS_OF_USE_CLICKED') String eventType,
  }) = TermsOfUseClicked;

  const factory AmplitudeEvent.verifyCardClicked({
    @Default('PUSH_NOTIFICATIONS_ON') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = VerifyCardClicked;

  const factory AmplitudeEvent.sendMessageClicked({
    @Default('SEND_MESSAGE_CLICKED') String eventType,
  }) = SendMessageClicked;

  const factory AmplitudeEvent.cardAdded({
    @Default('CARD_ADDED') String eventType,
    required String address,
  }) = CardAddedEvent;

  const factory AmplitudeEvent.barAdded({
    @Default('BAR_ADDED') String eventType,
    required String address,
  }) = BarAddedEvent;

  factory AmplitudeEvent.fromJson(Map<String, dynamic> json) => _$AmplitudeEventFromJson(json);
}

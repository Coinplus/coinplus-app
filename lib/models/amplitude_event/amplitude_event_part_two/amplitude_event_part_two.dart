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

  const factory AmplitudeEventPartTwo.validationSuccessful({
    @Default('VALIDATION_SUCCESSFUL') String eventType,
    required String walletAddress,
    required String walletType,
  }) = ValidationSuccessful;

  const factory AmplitudeEventPartTwo.validationFailed({
    @Default('VALIDATION_FAILED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = ValidationFailed;

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

  const factory AmplitudeEventPartTwo.dontHaveCardClicked({
    @Default('DONT_HAVE_CARD_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
    required bool activated,
  }) = DontHaveCardClicked;

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

  factory AmplitudeEventPartTwo.fromJson(Map<String, dynamic> json) => _$AmplitudeEventPartTwoFromJson(json);
}

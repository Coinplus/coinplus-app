// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amplitude_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginEventImpl _$$LoginEventImplFromJson(Map json) => _$LoginEventImpl(
      eventType: json['eventType'] as String? ?? 'LOGIN',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoginEventImplToJson(_$LoginEventImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$ConnectWalletClickedImpl _$$ConnectWalletClickedImplFromJson(Map json) => _$ConnectWalletClickedImpl(
      eventType: json['eventType'] as String? ?? 'CONNECT_WALLET_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConnectWalletClickedImplToJson(_$ConnectWalletClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$ConnectManuallyClickedImpl _$$ConnectManuallyClickedImplFromJson(Map json) => _$ConnectManuallyClickedImpl(
      eventType: json['eventType'] as String? ?? 'CONNECT_MANUALLY_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConnectManuallyClickedImplToJson(_$ConnectManuallyClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$ConnectWitchQrClickedImpl _$$ConnectWitchQrClickedImplFromJson(Map json) => _$ConnectWitchQrClickedImpl(
      eventType: json['eventType'] as String? ?? 'CONNECT_WITH_QR_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConnectWitchQrClickedImplToJson(_$ConnectWitchQrClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$QrButtonClickedImpl _$$QrButtonClickedImplFromJson(Map json) => _$QrButtonClickedImpl(
      eventType: json['eventType'] as String? ?? 'QR_BUTTON_CLICKED',
      walletType: json['walletType'] as String,
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QrButtonClickedImplToJson(_$QrButtonClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$QrScannedImpl _$$QrScannedImplFromJson(Map json) => _$QrScannedImpl(
      eventType: json['eventType'] as String? ?? 'QR_SCANNED',
      source: json['source'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QrScannedImplToJson(_$QrScannedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$BuyNewCardClickedImpl _$$BuyNewCardClickedImplFromJson(Map json) => _$BuyNewCardClickedImpl(
      eventType: json['eventType'] as String? ?? 'BUY_NEW_CARD_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BuyNewCardClickedImplToJson(_$BuyNewCardClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$ConnectOptionSelectedImpl _$$ConnectOptionSelectedImplFromJson(Map json) => _$ConnectOptionSelectedImpl(
      eventType: json['eventType'] as String? ?? 'CONNECT_OPTION_SELECTED',
      source: json['source'] as String,
      connectOption: json['connectOption'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConnectOptionSelectedImplToJson(_$ConnectOptionSelectedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'connectOption': instance.connectOption,
      'runtimeType': instance.$type,
    };

_$NfcTappedImpl _$$NfcTappedImplFromJson(Map json) => _$NfcTappedImpl(
      eventType: json['eventType'] as String? ?? 'NFC_TAPPED',
      source: json['source'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NfcTappedImplToJson(_$NfcTappedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$NfcClosedImpl _$$NfcClosedImplFromJson(Map json) => _$NfcClosedImpl(
      eventType: json['eventType'] as String? ?? 'NFC_CLOSED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NfcClosedImplToJson(_$NfcClosedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$AddressFilledImpl _$$AddressFilledImplFromJson(Map json) => _$AddressFilledImpl(
      eventType: json['eventType'] as String? ?? 'ADDRESS_FILLED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AddressFilledImplToJson(_$AddressFilledImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$DeeplinkClickedImpl _$$DeeplinkClickedImplFromJson(Map json) => _$DeeplinkClickedImpl(
      eventType: json['eventType'] as String? ?? 'DEEPLINK_CLICKED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DeeplinkClickedImplToJson(_$DeeplinkClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$TypeSelectedImpl _$$TypeSelectedImplFromJson(Map json) => _$TypeSelectedImpl(
      eventType: json['eventType'] as String? ?? 'WALLET_TYPE_SELECTED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TypeSelectedImplToJson(_$TypeSelectedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$SaveToWalletClickedImpl _$$SaveToWalletClickedImplFromJson(Map json) => _$SaveToWalletClickedImpl(
      eventType: json['eventType'] as String? ?? 'SAVE_TO_WALLET_CLICKED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SaveToWalletClickedImplToJson(_$SaveToWalletClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$AlreadySavedGotItClickedImpl _$$AlreadySavedGotItClickedImplFromJson(Map json) => _$AlreadySavedGotItClickedImpl(
      eventType: json['eventType'] as String? ?? 'ALREADY_SAVED_GOT_IT_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AlreadySavedGotItClickedImplToJson(_$AlreadySavedGotItClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$ActivatedCheckboxClickedImpl _$$ActivatedCheckboxClickedImplFromJson(Map json) => _$ActivatedCheckboxClickedImpl(
      eventType: json['eventType'] as String? ?? 'ACTIVATED_CHECKBOX_CLICKED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ActivatedCheckboxClickedImplToJson(_$ActivatedCheckboxClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$GotItClickedImpl _$$GotItClickedImplFromJson(Map json) => _$GotItClickedImpl(
      eventType: json['eventType'] as String? ?? 'GOT_IT_CLICKED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GotItClickedImplToJson(_$GotItClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$WarningCheckboxClickedImpl _$$WarningCheckboxClickedImplFromJson(Map json) => _$WarningCheckboxClickedImpl(
      eventType: json['eventType'] as String? ?? 'WARNING_CHECKBOX_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WarningCheckboxClickedImplToJson(_$WarningCheckboxClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$AppLockEnabledImpl _$$AppLockEnabledImplFromJson(Map json) => _$AppLockEnabledImpl(
      eventType: json['eventType'] as String? ?? 'APP_LOCK_ENABLED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppLockEnabledImplToJson(_$AppLockEnabledImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$NotNowLockClickedImpl _$$NotNowLockClickedImplFromJson(Map json) => _$NotNowLockClickedImpl(
      eventType: json['eventType'] as String? ?? 'NOT_NOW_LOCK_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotNowLockClickedImplToJson(_$NotNowLockClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$WalletTabClickedImpl _$$WalletTabClickedImplFromJson(Map json) => _$WalletTabClickedImpl(
      eventType: json['eventType'] as String? ?? 'WALLET_TAB_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WalletTabClickedImplToJson(_$WalletTabClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$SettingsTabClickedImpl _$$SettingsTabClickedImplFromJson(Map json) => _$SettingsTabClickedImpl(
      eventType: json['eventType'] as String? ?? 'SETTINGS_TAB_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SettingsTabClickedImplToJson(_$SettingsTabClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$TransactionsButtonClickedImpl _$$TransactionsButtonClickedImplFromJson(Map json) => _$TransactionsButtonClickedImpl(
      eventType: json['eventType'] as String? ?? 'TRANSACTIONS_BUTTON_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TransactionsButtonClickedImplToJson(_$TransactionsButtonClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$AddNewClickedImpl _$$AddNewClickedImplFromJson(Map json) => _$AddNewClickedImpl(
      eventType: json['eventType'] as String? ?? 'ADD_NEW_CLICKED',
      tab: json['tab'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AddNewClickedImplToJson(_$AddNewClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'tab': instance.tab,
      'runtimeType': instance.$type,
    };

_$AddNewPlusClickedImpl _$$AddNewPlusClickedImplFromJson(Map json) => _$AddNewPlusClickedImpl(
      eventType: json['eventType'] as String? ?? 'ADD_NEW_PLUS_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AddNewPlusClickedImplToJson(_$AddNewPlusClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$WalletSettingsClickedImpl _$$WalletSettingsClickedImplFromJson(Map json) => _$WalletSettingsClickedImpl(
      eventType: json['eventType'] as String? ?? 'WALLET_SETTINGS_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WalletSettingsClickedImplToJson(_$WalletSettingsClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$TopUpButtonClickedImpl _$$TopUpButtonClickedImplFromJson(Map json) => _$TopUpButtonClickedImpl(
      eventType: json['eventType'] as String? ?? 'TOP_UP_BUTTON_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TopUpButtonClickedImplToJson(_$TopUpButtonClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$ReceiveClickedImpl _$$ReceiveClickedImplFromJson(Map json) => _$ReceiveClickedImpl(
      eventType: json['eventType'] as String? ?? 'RECEIVE_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReceiveClickedImplToJson(_$ReceiveClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$SendClickedImpl _$$SendClickedImplFromJson(Map json) => _$SendClickedImpl(
      eventType: json['eventType'] as String? ?? 'SEND_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SendClickedImplToJson(_$SendClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$BuyWithCardClickedImpl _$$BuyWithCardClickedImplFromJson(Map json) => _$BuyWithCardClickedImpl(
      eventType: json['eventType'] as String? ?? 'BUY_WITH_CARD_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BuyWithCardClickedImplToJson(_$BuyWithCardClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$HistoryClickedImpl _$$HistoryClickedImplFromJson(Map json) => _$HistoryClickedImpl(
      eventType: json['eventType'] as String? ?? 'HISTORY_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HistoryClickedImplToJson(_$HistoryClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$AddressCopiedImpl _$$AddressCopiedImplFromJson(Map json) => _$AddressCopiedImpl(
      eventType: json['eventType'] as String? ?? 'ADDRESS_COPIED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AddressCopiedImplToJson(_$AddressCopiedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$ShareAddressClickedImpl _$$ShareAddressClickedImplFromJson(Map json) => _$ShareAddressClickedImpl(
      eventType: json['eventType'] as String? ?? 'SHARE_ADDRESS_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ShareAddressClickedImplToJson(_$ShareAddressClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$GotItSendClickedImpl _$$GotItSendClickedImplFromJson(Map json) => _$GotItSendClickedImpl(
      eventType: json['eventType'] as String? ?? 'GOT_IT_SEND_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GotItSendClickedImplToJson(_$GotItSendClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$SendAnywayClickedImpl _$$SendAnywayClickedImplFromJson(Map json) => _$SendAnywayClickedImpl(
      eventType: json['eventType'] as String? ?? 'SEND_ANYWAY_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SendAnywayClickedImplToJson(_$SendAnywayClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$BackButtonClickedImpl _$$BackButtonClickedImplFromJson(Map json) => _$BackButtonClickedImpl(
      eventType: json['eventType'] as String? ?? 'BACK_BUTTON_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BackButtonClickedImplToJson(_$BackButtonClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$Secret1ValidatedImpl _$$Secret1ValidatedImplFromJson(Map json) => _$Secret1ValidatedImpl(
      eventType: json['eventType'] as String? ?? 'SECRET_1_VALIDATED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$Secret1ValidatedImplToJson(_$Secret1ValidatedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$Secret2ValidatedImpl _$$Secret2ValidatedImplFromJson(Map json) => _$Secret2ValidatedImpl(
      eventType: json['eventType'] as String? ?? 'SECRET_2_VALIDATED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$Secret2ValidatedImplToJson(_$Secret2ValidatedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$ContinueCLickedImpl _$$ContinueCLickedImplFromJson(Map json) => _$ContinueCLickedImpl(
      eventType: json['eventType'] as String? ?? 'CONTINUE_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ContinueCLickedImplToJson(_$ContinueCLickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$EditSecretsClickedImpl _$$EditSecretsClickedImplFromJson(Map json) => _$EditSecretsClickedImpl(
      eventType: json['eventType'] as String? ?? 'EDIT_SECRETS_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EditSecretsClickedImplToJson(_$EditSecretsClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$ValidationSuccessfulImpl _$$ValidationSuccessfulImplFromJson(Map json) => _$ValidationSuccessfulImpl(
      eventType: json['eventType'] as String? ?? 'VALIDATION_SUCCESSFUL',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ValidationSuccessfulImplToJson(_$ValidationSuccessfulImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$ValidationFailedImpl _$$ValidationFailedImplFromJson(Map json) => _$ValidationFailedImpl(
      eventType: json['eventType'] as String? ?? 'VALIDATION_FAILED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ValidationFailedImplToJson(_$ValidationFailedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$GuideMeClickedImpl _$$GuideMeClickedImplFromJson(Map json) => _$GuideMeClickedImpl(
      eventType: json['eventType'] as String? ?? 'GUIDE_ME_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GuideMeClickedImplToJson(_$GuideMeClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$CardColorCHangedImpl _$$CardColorCHangedImplFromJson(Map json) => _$CardColorCHangedImpl(
      eventType: json['eventType'] as String? ?? 'CARD_COLOR_CHANGED',
      walletAddress: json['walletAddress'] as String,
      color: json['color'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CardColorCHangedImplToJson(_$CardColorCHangedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'color': instance.color,
      'runtimeType': instance.$type,
    };

_$ClickedOnPrivateKeyImpl _$$ClickedOnPrivateKeyImplFromJson(Map json) => _$ClickedOnPrivateKeyImpl(
      eventType: json['eventType'] as String? ?? 'CLICKED_ON_PRIVATE_KEY',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ClickedOnPrivateKeyImplToJson(_$ClickedOnPrivateKeyImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$PrivateKeyRevealedImpl _$$PrivateKeyRevealedImplFromJson(Map json) => _$PrivateKeyRevealedImpl(
      eventType: json['eventType'] as String? ?? 'PRIVATE_KEY_REVEALED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PrivateKeyRevealedImplToJson(_$PrivateKeyRevealedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$PrivateKeyCopiedImpl _$$PrivateKeyCopiedImplFromJson(Map json) => _$PrivateKeyCopiedImpl(
      eventType: json['eventType'] as String? ?? 'PRIVATE_KEY_COPIED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PrivateKeyCopiedImplToJson(_$PrivateKeyCopiedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$CardNameChangedImpl _$$CardNameChangedImplFromJson(Map json) => _$CardNameChangedImpl(
      eventType: json['eventType'] as String? ?? 'CARD_NAME_CHANGED',
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CardNameChangedImplToJson(_$CardNameChangedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$HelpCenterClickedImpl _$$HelpCenterClickedImplFromJson(Map json) => _$HelpCenterClickedImpl(
      eventType: json['eventType'] as String? ?? 'HELP_CENTER_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HelpCenterClickedImplToJson(_$HelpCenterClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$RemoveCardClickedImpl _$$RemoveCardClickedImplFromJson(Map json) => _$RemoveCardClickedImpl(
      eventType: json['eventType'] as String? ?? 'REMOVE_CARD_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RemoveCardClickedImplToJson(_$RemoveCardClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$CardDeletedImpl _$$CardDeletedImplFromJson(Map json) => _$CardDeletedImpl(
      eventType: json['eventType'] as String? ?? 'CARD_DELETED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CardDeletedImplToJson(_$CardDeletedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$NotSureClickedImpl _$$NotSureClickedImplFromJson(Map json) => _$NotSureClickedImpl(
      eventType: json['eventType'] as String? ?? 'NOT_SURE_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotSureClickedImplToJson(_$NotSureClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$ContactUsClickedImpl _$$ContactUsClickedImplFromJson(Map json) => _$ContactUsClickedImpl(
      eventType: json['eventType'] as String? ?? 'CONTACT_US_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ContactUsClickedImplToJson(_$ContactUsClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$AppLockClickedImpl _$$AppLockClickedImplFromJson(Map json) => _$AppLockClickedImpl(
      eventType: json['eventType'] as String? ?? 'APP_LOCK_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppLockClickedImplToJson(_$AppLockClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$AppLockDisabledImpl _$$AppLockDisabledImplFromJson(Map json) => _$AppLockDisabledImpl(
      eventType: json['eventType'] as String? ?? 'APP_LOCK_DISABLED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppLockDisabledImplToJson(_$AppLockDisabledImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$ChangePasscodeClickedImpl _$$ChangePasscodeClickedImplFromJson(Map json) => _$ChangePasscodeClickedImpl(
      eventType: json['eventType'] as String? ?? 'CHANGE_PASSCODE_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChangePasscodeClickedImplToJson(_$ChangePasscodeClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$PasscodeChangedImpl _$$PasscodeChangedImplFromJson(Map json) => _$PasscodeChangedImpl(
      eventType: json['eventType'] as String? ?? 'PASSCODE_CHANGED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PasscodeChangedImplToJson(_$PasscodeChangedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$FaceIdEnabledImpl _$$FaceIdEnabledImplFromJson(Map json) => _$FaceIdEnabledImpl(
      eventType: json['eventType'] as String? ?? 'FACE_ID_ENABLED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FaceIdEnabledImplToJson(_$FaceIdEnabledImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$FaceIdDisabledImpl _$$FaceIdDisabledImplFromJson(Map json) => _$FaceIdDisabledImpl(
      eventType: json['eventType'] as String? ?? 'FACE_ID_DISABLED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FaceIdDisabledImplToJson(_$FaceIdDisabledImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$PushNotificationsOnImpl _$$PushNotificationsOnImplFromJson(Map json) => _$PushNotificationsOnImpl(
      eventType: json['eventType'] as String? ?? 'PUSH_NOTIFICATIONS_ON',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PushNotificationsOnImplToJson(_$PushNotificationsOnImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$PushNotificationsOffImpl _$$PushNotificationsOffImplFromJson(Map json) => _$PushNotificationsOffImpl(
      eventType: json['eventType'] as String? ?? 'PUSH_NOTIFICATIONS_OFF',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PushNotificationsOffImplToJson(_$PushNotificationsOffImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$JoinCommunityClickedImpl _$$JoinCommunityClickedImplFromJson(Map json) => _$JoinCommunityClickedImpl(
      eventType: json['eventType'] as String? ?? 'JOIN_COMMUNITY_CLICKED',
      social: json['social'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$JoinCommunityClickedImplToJson(_$JoinCommunityClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'social': instance.social,
      'runtimeType': instance.$type,
    };

_$PrivacyPolicyClickedImpl _$$PrivacyPolicyClickedImplFromJson(Map json) => _$PrivacyPolicyClickedImpl(
      eventType: json['eventType'] as String? ?? 'PRIVACY_POLICY_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PrivacyPolicyClickedImplToJson(_$PrivacyPolicyClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$TermsOfUseClickedImpl _$$TermsOfUseClickedImplFromJson(Map json) => _$TermsOfUseClickedImpl(
      eventType: json['eventType'] as String? ?? 'TERMS_OF_USE_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TermsOfUseClickedImplToJson(_$TermsOfUseClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$VerifyCardClickedImpl _$$VerifyCardClickedImplFromJson(Map json) => _$VerifyCardClickedImpl(
      eventType: json['eventType'] as String? ?? 'VERIFY_CARD_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$VerifyCardClickedImplToJson(_$VerifyCardClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$VerifyCardTappedImpl _$$VerifyCardTappedImplFromJson(Map json) => _$VerifyCardTappedImpl(
      eventType: json['eventType'] as String? ?? 'VERIFY_CARD_TAPPED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$VerifyCardTappedImplToJson(_$VerifyCardTappedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$SendMessageClickedImpl _$$SendMessageClickedImplFromJson(Map json) => _$SendMessageClickedImpl(
      eventType: json['eventType'] as String? ?? 'SEND_MESSAGE_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SendMessageClickedImplToJson(_$SendMessageClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$CardTabClickedImpl _$$CardTabClickedImplFromJson(Map json) => _$CardTabClickedImpl(
      eventType: json['eventType'] as String? ?? 'CARD_TAB_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CardTabClickedImplToJson(_$CardTabClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$BarTabClickedImpl _$$BarTabClickedImplFromJson(Map json) => _$BarTabClickedImpl(
      eventType: json['eventType'] as String? ?? 'BAR_TAB_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BarTabClickedImplToJson(_$BarTabClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$TapToConnectClickedImpl _$$TapToConnectClickedImplFromJson(Map json) => _$TapToConnectClickedImpl(
      eventType: json['eventType'] as String? ?? 'TAP_TO_CONNECT_CLICKED',
      tab: json['tab'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TapToConnectClickedImplToJson(_$TapToConnectClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'tab': instance.tab,
      'runtimeType': instance.$type,
    };

_$CardDamagedClickedImpl _$$CardDamagedClickedImplFromJson(Map json) => _$CardDamagedClickedImpl(
      eventType: json['eventType'] as String? ?? 'CARD_DAMAGED_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CardDamagedClickedImplToJson(_$CardDamagedClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$NfcNotWorkingCLickedImpl _$$NfcNotWorkingCLickedImplFromJson(Map json) => _$NfcNotWorkingCLickedImpl(
      eventType: json['eventType'] as String? ?? 'NFC_NOT_WORKING_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NfcNotWorkingCLickedImplToJson(_$NfcNotWorkingCLickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$DontHaveCardClickedImpl _$$DontHaveCardClickedImplFromJson(Map json) => _$DontHaveCardClickedImpl(
      eventType: json['eventType'] as String? ?? 'DONT_HAVE_CARD_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DontHaveCardClickedImplToJson(_$DontHaveCardClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$LostCardClickedImpl _$$LostCardClickedImplFromJson(Map json) => _$LostCardClickedImpl(
      eventType: json['eventType'] as String? ?? 'LOST_CARD_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LostCardClickedImplToJson(_$LostCardClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$TroubleActivateClickedImpl _$$TroubleActivateClickedImplFromJson(Map json) => _$TroubleActivateClickedImpl(
      eventType: json['eventType'] as String? ?? 'TROUBLE_ACTIVATE_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TroubleActivateClickedImplToJson(_$TroubleActivateClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$TroubleCloseClickedImpl _$$TroubleCloseClickedImplFromJson(Map json) => _$TroubleCloseClickedImpl(
      eventType: json['eventType'] as String? ?? 'TROUBLE_CLOSE_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TroubleCloseClickedImplToJson(_$TroubleCloseClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$TroubleGotItClickedImpl _$$TroubleGotItClickedImplFromJson(Map json) => _$TroubleGotItClickedImpl(
      eventType: json['eventType'] as String? ?? 'TROUBLE_GOT_IT_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TroubleGotItClickedImplToJson(_$TroubleGotItClickedImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$TroubleActivateNowClickedImpl _$$TroubleActivateNowClickedImplFromJson(Map json) => _$TroubleActivateNowClickedImpl(
      eventType: json['eventType'] as String? ?? 'TROUBLE_ACTIVATE_NOW_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TroubleActivateNowClickedImplToJson(_$TroubleActivateNowClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$CardAddedEventImpl _$$CardAddedEventImplFromJson(Map json) => _$CardAddedEventImpl(
      eventType: json['eventType'] as String? ?? 'CARD_ADDED',
      address: json['address'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CardAddedEventImplToJson(_$CardAddedEventImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'address': instance.address,
      'runtimeType': instance.$type,
    };

_$BarAddedEventImpl _$$BarAddedEventImplFromJson(Map json) => _$BarAddedEventImpl(
      eventType: json['eventType'] as String? ?? 'BAR_ADDED',
      address: json['address'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BarAddedEventImplToJson(_$BarAddedEventImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'address': instance.address,
      'runtimeType': instance.$type,
    };

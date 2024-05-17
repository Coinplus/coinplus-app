// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amplitude_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectWalletClickedImpl _$$ConnectWalletClickedImplFromJson(Map json) =>
    _$ConnectWalletClickedImpl(
      eventType: json['eventType'] as String? ?? 'CONNECT_WALLET_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConnectWalletClickedImplToJson(
        _$ConnectWalletClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$ConnectManuallyClickedImpl _$$ConnectManuallyClickedImplFromJson(Map json) =>
    _$ConnectManuallyClickedImpl(
      eventType: json['eventType'] as String? ?? 'CONNECT_MANUALLY_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConnectManuallyClickedImplToJson(
        _$ConnectManuallyClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$ConnectWitchQrClickedImpl _$$ConnectWitchQrClickedImplFromJson(Map json) =>
    _$ConnectWitchQrClickedImpl(
      eventType: json['eventType'] as String? ?? 'CONNECT_WITH_QR_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConnectWitchQrClickedImplToJson(
        _$ConnectWitchQrClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$QrButtonClickedImpl _$$QrButtonClickedImplFromJson(Map json) =>
    _$QrButtonClickedImpl(
      eventType: json['eventType'] as String? ?? 'QR_BUTTON_CLICKED',
      walletType: json['walletType'] as String,
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QrButtonClickedImplToJson(
        _$QrButtonClickedImpl instance) =>
    <String, dynamic>{
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

Map<String, dynamic> _$$QrScannedImplToJson(_$QrScannedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$BuyNewCardClickedImpl _$$BuyNewCardClickedImplFromJson(Map json) =>
    _$BuyNewCardClickedImpl(
      eventType: json['eventType'] as String? ?? 'BUY_NEW_CARD_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BuyNewCardClickedImplToJson(
        _$BuyNewCardClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$ConnectOptionSelectedImpl _$$ConnectOptionSelectedImplFromJson(Map json) =>
    _$ConnectOptionSelectedImpl(
      eventType: json['eventType'] as String? ?? 'CONNECT_OPTION_SELECTED',
      source: json['source'] as String,
      connectOption: json['connectOption'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConnectOptionSelectedImplToJson(
        _$ConnectOptionSelectedImpl instance) =>
    <String, dynamic>{
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

Map<String, dynamic> _$$NfcTappedImplToJson(_$NfcTappedImpl instance) =>
    <String, dynamic>{
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

Map<String, dynamic> _$$NfcClosedImplToJson(_$NfcClosedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$AddressFilledImpl _$$AddressFilledImplFromJson(Map json) =>
    _$AddressFilledImpl(
      eventType: json['eventType'] as String? ?? 'ADDRESS_FILLED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AddressFilledImplToJson(_$AddressFilledImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$DeeplinkClickedImpl _$$DeeplinkClickedImplFromJson(Map json) =>
    _$DeeplinkClickedImpl(
      eventType: json['eventType'] as String? ?? 'DEEPLINK_CLICKED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DeeplinkClickedImplToJson(
        _$DeeplinkClickedImpl instance) =>
    <String, dynamic>{
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

Map<String, dynamic> _$$TypeSelectedImplToJson(_$TypeSelectedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$SaveToWalletClickedImpl _$$SaveToWalletClickedImplFromJson(Map json) =>
    _$SaveToWalletClickedImpl(
      eventType: json['eventType'] as String? ?? 'SAVE_TO_WALLET_CLICKED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SaveToWalletClickedImplToJson(
        _$SaveToWalletClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$AlreadySavedGotItClickedImpl _$$AlreadySavedGotItClickedImplFromJson(
        Map json) =>
    _$AlreadySavedGotItClickedImpl(
      eventType: json['eventType'] as String? ?? 'ALREADY_SAVED_GOT_IT_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AlreadySavedGotItClickedImplToJson(
        _$AlreadySavedGotItClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$ActivatedCheckboxClickedImpl _$$ActivatedCheckboxClickedImplFromJson(
        Map json) =>
    _$ActivatedCheckboxClickedImpl(
      eventType: json['eventType'] as String? ?? 'ACTIVATED_CHECKBOX_CLICKED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ActivatedCheckboxClickedImplToJson(
        _$ActivatedCheckboxClickedImpl instance) =>
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

Map<String, dynamic> _$$GotItClickedImplToJson(_$GotItClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$FakeWalletImpl _$$FakeWalletImplFromJson(Map json) => _$FakeWalletImpl(
      eventType: json['eventType'] as String? ?? 'FAKE_WALLET',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FakeWalletImplToJson(_$FakeWalletImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'runtimeType': instance.$type,
    };

_$WarningCheckboxClickedImpl _$$WarningCheckboxClickedImplFromJson(Map json) =>
    _$WarningCheckboxClickedImpl(
      eventType: json['eventType'] as String? ?? 'WARNING_CHECKBOX_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WarningCheckboxClickedImplToJson(
        _$WarningCheckboxClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$AppLockEnabledImpl _$$AppLockEnabledImplFromJson(Map json) =>
    _$AppLockEnabledImpl(
      eventType: json['eventType'] as String? ?? 'APP_LOCK_ENABLED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppLockEnabledImplToJson(
        _$AppLockEnabledImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$NotNowLockClickedImpl _$$NotNowLockClickedImplFromJson(Map json) =>
    _$NotNowLockClickedImpl(
      eventType: json['eventType'] as String? ?? 'NOT_NOW_LOCK_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotNowLockClickedImplToJson(
        _$NotNowLockClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$WalletTabClickedImpl _$$WalletTabClickedImplFromJson(Map json) =>
    _$WalletTabClickedImpl(
      eventType: json['eventType'] as String? ?? 'WALLET_TAB_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WalletTabClickedImplToJson(
        _$WalletTabClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$MarketTabClickedImpl _$$MarketTabClickedImplFromJson(Map json) =>
    _$MarketTabClickedImpl(
      eventType: json['eventType'] as String? ?? 'MARKET_TAB_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MarketTabClickedImplToJson(
        _$MarketTabClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$HistoryTabClickedImpl _$$HistoryTabClickedImplFromJson(Map json) =>
    _$HistoryTabClickedImpl(
      eventType: json['eventType'] as String? ?? 'HISTORY_TAB_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HistoryTabClickedImplToJson(
        _$HistoryTabClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$SettingsTabClickedImpl _$$SettingsTabClickedImplFromJson(Map json) =>
    _$SettingsTabClickedImpl(
      eventType: json['eventType'] as String? ?? 'SETTINGS_TAB_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SettingsTabClickedImplToJson(
        _$SettingsTabClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$TransactionsButtonClickedImpl _$$TransactionsButtonClickedImplFromJson(
        Map json) =>
    _$TransactionsButtonClickedImpl(
      eventType: json['eventType'] as String? ?? 'TRANSACTIONS_BUTTON_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TransactionsButtonClickedImplToJson(
        _$TransactionsButtonClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$AddNewClickedImpl _$$AddNewClickedImplFromJson(Map json) =>
    _$AddNewClickedImpl(
      eventType: json['eventType'] as String? ?? 'ADD_NEW_CLICKED',
      tab: json['tab'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AddNewClickedImplToJson(_$AddNewClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'tab': instance.tab,
      'runtimeType': instance.$type,
    };

_$AddNewPlusClickedImpl _$$AddNewPlusClickedImplFromJson(Map json) =>
    _$AddNewPlusClickedImpl(
      eventType: json['eventType'] as String? ?? 'ADD_NEW_PLUS_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AddNewPlusClickedImplToJson(
        _$AddNewPlusClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$WalletSettingsClickedImpl _$$WalletSettingsClickedImplFromJson(Map json) =>
    _$WalletSettingsClickedImpl(
      eventType: json['eventType'] as String? ?? 'WALLET_SETTINGS_CLICKED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WalletSettingsClickedImplToJson(
        _$WalletSettingsClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$TopUpButtonClickedImpl _$$TopUpButtonClickedImplFromJson(Map json) =>
    _$TopUpButtonClickedImpl(
      eventType: json['eventType'] as String? ?? 'TOP_UP_BUTTON_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TopUpButtonClickedImplToJson(
        _$TopUpButtonClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$ReceiveClickedImpl _$$ReceiveClickedImplFromJson(Map json) =>
    _$ReceiveClickedImpl(
      eventType: json['eventType'] as String? ?? 'RECEIVE_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReceiveClickedImplToJson(
        _$ReceiveClickedImpl instance) =>
    <String, dynamic>{
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

Map<String, dynamic> _$$SendClickedImplToJson(_$SendClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$BuyWithCardClickedImpl _$$BuyWithCardClickedImplFromJson(Map json) =>
    _$BuyWithCardClickedImpl(
      eventType: json['eventType'] as String? ?? 'BUY_WITH_CARD_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BuyWithCardClickedImplToJson(
        _$BuyWithCardClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$HistoryClickedImpl _$$HistoryClickedImplFromJson(Map json) =>
    _$HistoryClickedImpl(
      eventType: json['eventType'] as String? ?? 'HISTORY_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HistoryClickedImplToJson(
        _$HistoryClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$AddressCopiedImpl _$$AddressCopiedImplFromJson(Map json) =>
    _$AddressCopiedImpl(
      eventType: json['eventType'] as String? ?? 'ADDRESS_COPIED',
      source: json['source'] as String,
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AddressCopiedImplToJson(_$AddressCopiedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$ShareAddressClickedImpl _$$ShareAddressClickedImplFromJson(Map json) =>
    _$ShareAddressClickedImpl(
      eventType: json['eventType'] as String? ?? 'SHARE_ADDRESS_CLICKED',
      walletType: json['walletType'] as String,
      walletAddress: json['walletAddress'] as String,
      activated: json['activated'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ShareAddressClickedImplToJson(
        _$ShareAddressClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletType': instance.walletType,
      'walletAddress': instance.walletAddress,
      'activated': instance.activated,
      'runtimeType': instance.$type,
    };

_$GotItSendClickedImpl _$$GotItSendClickedImplFromJson(Map json) =>
    _$GotItSendClickedImpl(
      eventType: json['eventType'] as String? ?? 'GOT_IT_SEND_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GotItSendClickedImplToJson(
        _$GotItSendClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$SendAnywayClickedImpl _$$SendAnywayClickedImplFromJson(Map json) =>
    _$SendAnywayClickedImpl(
      eventType: json['eventType'] as String? ?? 'SEND_ANYWAY_CLICKED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SendAnywayClickedImplToJson(
        _$SendAnywayClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$BackButtonClickedImpl _$$BackButtonClickedImplFromJson(Map json) =>
    _$BackButtonClickedImpl(
      eventType: json['eventType'] as String? ?? 'BACK_BUTTON_CLICKED',
      source: json['source'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BackButtonClickedImplToJson(
        _$BackButtonClickedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'source': instance.source,
      'runtimeType': instance.$type,
    };

_$Secret1ValidatedImpl _$$Secret1ValidatedImplFromJson(Map json) =>
    _$Secret1ValidatedImpl(
      eventType: json['eventType'] as String? ?? 'SECRET_1_VALIDATED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$Secret1ValidatedImplToJson(
        _$Secret1ValidatedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

_$Secret2ValidatedImpl _$$Secret2ValidatedImplFromJson(Map json) =>
    _$Secret2ValidatedImpl(
      eventType: json['eventType'] as String? ?? 'SECRET_2_VALIDATED',
      walletAddress: json['walletAddress'] as String,
      walletType: json['walletType'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$Secret2ValidatedImplToJson(
        _$Secret2ValidatedImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'walletAddress': instance.walletAddress,
      'walletType': instance.walletType,
      'runtimeType': instance.$type,
    };

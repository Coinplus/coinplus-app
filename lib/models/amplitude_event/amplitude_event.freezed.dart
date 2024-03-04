// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amplitude_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AmplitudeEvent _$AmplitudeEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'connectWalletClicked':
      return ConnectWalletClicked.fromJson(json);
    case 'connectManuallyClicked':
      return ConnectManuallyClicked.fromJson(json);
    case 'connectWithQrClicked':
      return ConnectWitchQrClicked.fromJson(json);
    case 'qrButtonClicked':
      return QrButtonClicked.fromJson(json);
    case 'qrScanned':
      return QrScanned.fromJson(json);
    case 'buyNewCardClicked':
      return BuyNewCardClicked.fromJson(json);
    case 'connectOptionSelected':
      return ConnectOptionSelected.fromJson(json);
    case 'nfcTapped':
      return NfcTapped.fromJson(json);
    case 'nfcClosed':
      return NfcClosed.fromJson(json);
    case 'addressFilled':
      return AddressFilled.fromJson(json);
    case 'deepLinkClicked':
      return DeeplinkClicked.fromJson(json);
    case 'typeSelected':
      return TypeSelected.fromJson(json);
    case 'saveToWalletClicked':
      return SaveToWalletClicked.fromJson(json);
    case 'alreadySavedGotItClicked':
      return AlreadySavedGotItClicked.fromJson(json);
    case 'activatedCheckboxClicked':
      return ActivatedCheckboxClicked.fromJson(json);
    case 'gotItClicked':
      return GotItClicked.fromJson(json);
    case 'fakeWallet':
      return FakeWallet.fromJson(json);
    case 'warningCheckboxClicked':
      return WarningCheckboxClicked.fromJson(json);
    case 'appLockEnabled':
      return AppLockEnabled.fromJson(json);
    case 'notNowLockClicked':
      return NotNowLockClicked.fromJson(json);
    case 'walletTabClicked':
      return WalletTabClicked.fromJson(json);
    case 'settingsTabClicked':
      return SettingsTabClicked.fromJson(json);
    case 'transactionsButtonClicked':
      return TransactionsButtonClicked.fromJson(json);
    case 'addNewClicked':
      return AddNewClicked.fromJson(json);
    case 'addNewPlusClicked':
      return AddNewPlusClicked.fromJson(json);
    case 'walletSettingsClicked':
      return WalletSettingsClicked.fromJson(json);
    case 'topUpButtonCLicked':
      return TopUpButtonClicked.fromJson(json);
    case 'receiveClicked':
      return ReceiveClicked.fromJson(json);
    case 'sendClicked':
      return SendClicked.fromJson(json);
    case 'buyWithCardClicked':
      return BuyWithCardClicked.fromJson(json);
    case 'historyClicked':
      return HistoryClicked.fromJson(json);
    case 'addressCopied':
      return AddressCopied.fromJson(json);
    case 'shareAddressClicked':
      return ShareAddressClicked.fromJson(json);
    case 'gotItSendClicked':
      return GotItSendClicked.fromJson(json);
    case 'sendAnywayClicked':
      return SendAnywayClicked.fromJson(json);
    case 'backButtonClicked':
      return BackButtonClicked.fromJson(json);
    case 'secret1Validated':
      return Secret1Validated.fromJson(json);
    case 'secret2Validated':
      return Secret2Validated.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'runtimeType', 'AmplitudeEvent', 'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AmplitudeEvent {
  String get eventType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmplitudeEventCopyWith<AmplitudeEvent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmplitudeEventCopyWith<$Res> {
  factory $AmplitudeEventCopyWith(AmplitudeEvent value, $Res Function(AmplitudeEvent) then) =
      _$AmplitudeEventCopyWithImpl<$Res, AmplitudeEvent>;
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class _$AmplitudeEventCopyWithImpl<$Res, $Val extends AmplitudeEvent> implements $AmplitudeEventCopyWith<$Res> {
  _$AmplitudeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectWalletClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$ConnectWalletClickedImplCopyWith(
          _$ConnectWalletClickedImpl value, $Res Function(_$ConnectWalletClickedImpl) then) =
      __$$ConnectWalletClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$ConnectWalletClickedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$ConnectWalletClickedImpl>
    implements _$$ConnectWalletClickedImplCopyWith<$Res> {
  __$$ConnectWalletClickedImplCopyWithImpl(
      _$ConnectWalletClickedImpl _value, $Res Function(_$ConnectWalletClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$ConnectWalletClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectWalletClickedImpl with DiagnosticableTreeMixin implements ConnectWalletClicked {
  const _$ConnectWalletClickedImpl({this.eventType = 'CONNECT_WALLET_CLICKED', final String? $type})
      : $type = $type ?? 'connectWalletClicked';

  factory _$ConnectWalletClickedImpl.fromJson(Map<String, dynamic> json) => _$$ConnectWalletClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.connectWalletClicked(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.connectWalletClicked'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectWalletClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectWalletClickedImplCopyWith<_$ConnectWalletClickedImpl> get copyWith =>
      __$$ConnectWalletClickedImplCopyWithImpl<_$ConnectWalletClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return connectWalletClicked(eventType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return connectWalletClicked?.call(eventType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (connectWalletClicked != null) {
      return connectWalletClicked(eventType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return connectWalletClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return connectWalletClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (connectWalletClicked != null) {
      return connectWalletClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectWalletClickedImplToJson(
      this,
    );
  }
}

abstract class ConnectWalletClicked implements AmplitudeEvent {
  const factory ConnectWalletClicked({final String eventType}) = _$ConnectWalletClickedImpl;

  factory ConnectWalletClicked.fromJson(Map<String, dynamic> json) = _$ConnectWalletClickedImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$ConnectWalletClickedImplCopyWith<_$ConnectWalletClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectManuallyClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$ConnectManuallyClickedImplCopyWith(
          _$ConnectManuallyClickedImpl value, $Res Function(_$ConnectManuallyClickedImpl) then) =
      __$$ConnectManuallyClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source});
}

/// @nodoc
class __$$ConnectManuallyClickedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$ConnectManuallyClickedImpl>
    implements _$$ConnectManuallyClickedImplCopyWith<$Res> {
  __$$ConnectManuallyClickedImplCopyWithImpl(
      _$ConnectManuallyClickedImpl _value, $Res Function(_$ConnectManuallyClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
  }) {
    return _then(_$ConnectManuallyClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectManuallyClickedImpl with DiagnosticableTreeMixin implements ConnectManuallyClicked {
  const _$ConnectManuallyClickedImpl(
      {this.eventType = 'CONNECT_MANUALLY_CLICKED', required this.source, final String? $type})
      : $type = $type ?? 'connectManuallyClicked';

  factory _$ConnectManuallyClickedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConnectManuallyClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.connectManuallyClicked(eventType: $eventType, source: $source)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.connectManuallyClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectManuallyClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectManuallyClickedImplCopyWith<_$ConnectManuallyClickedImpl> get copyWith =>
      __$$ConnectManuallyClickedImplCopyWithImpl<_$ConnectManuallyClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return connectManuallyClicked(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return connectManuallyClicked?.call(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (connectManuallyClicked != null) {
      return connectManuallyClicked(eventType, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return connectManuallyClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return connectManuallyClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (connectManuallyClicked != null) {
      return connectManuallyClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectManuallyClickedImplToJson(
      this,
    );
  }
}

abstract class ConnectManuallyClicked implements AmplitudeEvent {
  const factory ConnectManuallyClicked({final String eventType, required final String source}) =
      _$ConnectManuallyClickedImpl;

  factory ConnectManuallyClicked.fromJson(Map<String, dynamic> json) = _$ConnectManuallyClickedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$ConnectManuallyClickedImplCopyWith<_$ConnectManuallyClickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectWitchQrClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$ConnectWitchQrClickedImplCopyWith(
          _$ConnectWitchQrClickedImpl value, $Res Function(_$ConnectWitchQrClickedImpl) then) =
      __$$ConnectWitchQrClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source});
}

/// @nodoc
class __$$ConnectWitchQrClickedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$ConnectWitchQrClickedImpl>
    implements _$$ConnectWitchQrClickedImplCopyWith<$Res> {
  __$$ConnectWitchQrClickedImplCopyWithImpl(
      _$ConnectWitchQrClickedImpl _value, $Res Function(_$ConnectWitchQrClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
  }) {
    return _then(_$ConnectWitchQrClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectWitchQrClickedImpl with DiagnosticableTreeMixin implements ConnectWitchQrClicked {
  const _$ConnectWitchQrClickedImpl(
      {this.eventType = 'CONNECT_WITH_QR_CLICKED', required this.source, final String? $type})
      : $type = $type ?? 'connectWithQrClicked';

  factory _$ConnectWitchQrClickedImpl.fromJson(Map<String, dynamic> json) => _$$ConnectWitchQrClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.connectWithQrClicked(eventType: $eventType, source: $source)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.connectWithQrClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectWitchQrClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectWitchQrClickedImplCopyWith<_$ConnectWitchQrClickedImpl> get copyWith =>
      __$$ConnectWitchQrClickedImplCopyWithImpl<_$ConnectWitchQrClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return connectWithQrClicked(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return connectWithQrClicked?.call(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (connectWithQrClicked != null) {
      return connectWithQrClicked(eventType, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return connectWithQrClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return connectWithQrClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (connectWithQrClicked != null) {
      return connectWithQrClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectWitchQrClickedImplToJson(
      this,
    );
  }
}

abstract class ConnectWitchQrClicked implements AmplitudeEvent {
  const factory ConnectWitchQrClicked({final String eventType, required final String source}) =
      _$ConnectWitchQrClickedImpl;

  factory ConnectWitchQrClicked.fromJson(Map<String, dynamic> json) = _$ConnectWitchQrClickedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$ConnectWitchQrClickedImplCopyWith<_$ConnectWitchQrClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QrButtonClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$QrButtonClickedImplCopyWith(_$QrButtonClickedImpl value, $Res Function(_$QrButtonClickedImpl) then) =
      __$$QrButtonClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletType, String source});
}

/// @nodoc
class __$$QrButtonClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$QrButtonClickedImpl>
    implements _$$QrButtonClickedImplCopyWith<$Res> {
  __$$QrButtonClickedImplCopyWithImpl(_$QrButtonClickedImpl _value, $Res Function(_$QrButtonClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletType = null,
    Object? source = null,
  }) {
    return _then(_$QrButtonClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrButtonClickedImpl with DiagnosticableTreeMixin implements QrButtonClicked {
  const _$QrButtonClickedImpl(
      {this.eventType = 'QR_BUTTON_CLICKED', required this.walletType, required this.source, final String? $type})
      : $type = $type ?? 'qrButtonClicked';

  factory _$QrButtonClickedImpl.fromJson(Map<String, dynamic> json) => _$$QrButtonClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletType;
  @override
  final String source;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.qrButtonClicked(eventType: $eventType, walletType: $walletType, source: $source)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.qrButtonClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('source', source));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrButtonClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrButtonClickedImplCopyWith<_$QrButtonClickedImpl> get copyWith =>
      __$$QrButtonClickedImplCopyWithImpl<_$QrButtonClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return qrButtonClicked(eventType, walletType, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return qrButtonClicked?.call(eventType, walletType, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (qrButtonClicked != null) {
      return qrButtonClicked(eventType, walletType, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return qrButtonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return qrButtonClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (qrButtonClicked != null) {
      return qrButtonClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$QrButtonClickedImplToJson(
      this,
    );
  }
}

abstract class QrButtonClicked implements AmplitudeEvent {
  const factory QrButtonClicked(
      {final String eventType, required final String walletType, required final String source}) = _$QrButtonClickedImpl;

  factory QrButtonClicked.fromJson(Map<String, dynamic> json) = _$QrButtonClickedImpl.fromJson;

  @override
  String get eventType;
  String get walletType;
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$QrButtonClickedImplCopyWith<_$QrButtonClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QrScannedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$QrScannedImplCopyWith(_$QrScannedImpl value, $Res Function(_$QrScannedImpl) then) =
      __$$QrScannedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String walletAddress});
}

/// @nodoc
class __$$QrScannedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$QrScannedImpl>
    implements _$$QrScannedImplCopyWith<$Res> {
  __$$QrScannedImplCopyWithImpl(_$QrScannedImpl _value, $Res Function(_$QrScannedImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? walletAddress = null,
  }) {
    return _then(_$QrScannedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrScannedImpl with DiagnosticableTreeMixin implements QrScanned {
  const _$QrScannedImpl(
      {this.eventType = 'QR_SCANNED', required this.source, required this.walletAddress, final String? $type})
      : $type = $type ?? 'qrScanned';

  factory _$QrScannedImpl.fromJson(Map<String, dynamic> json) => _$$QrScannedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String walletAddress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.qrScanned(eventType: $eventType, source: $source, walletAddress: $walletAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.qrScanned'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('walletAddress', walletAddress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScannedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, walletAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScannedImplCopyWith<_$QrScannedImpl> get copyWith =>
      __$$QrScannedImplCopyWithImpl<_$QrScannedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return qrScanned(eventType, source, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return qrScanned?.call(eventType, source, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (qrScanned != null) {
      return qrScanned(eventType, source, walletAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return qrScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return qrScanned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (qrScanned != null) {
      return qrScanned(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$QrScannedImplToJson(
      this,
    );
  }
}

abstract class QrScanned implements AmplitudeEvent {
  const factory QrScanned({final String eventType, required final String source, required final String walletAddress}) =
      _$QrScannedImpl;

  factory QrScanned.fromJson(Map<String, dynamic> json) = _$QrScannedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get walletAddress;
  @override
  @JsonKey(ignore: true)
  _$$QrScannedImplCopyWith<_$QrScannedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BuyNewCardClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$BuyNewCardClickedImplCopyWith(_$BuyNewCardClickedImpl value, $Res Function(_$BuyNewCardClickedImpl) then) =
      __$$BuyNewCardClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source});
}

/// @nodoc
class __$$BuyNewCardClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$BuyNewCardClickedImpl>
    implements _$$BuyNewCardClickedImplCopyWith<$Res> {
  __$$BuyNewCardClickedImplCopyWithImpl(_$BuyNewCardClickedImpl _value, $Res Function(_$BuyNewCardClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
  }) {
    return _then(_$BuyNewCardClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuyNewCardClickedImpl with DiagnosticableTreeMixin implements BuyNewCardClicked {
  const _$BuyNewCardClickedImpl({this.eventType = 'BUY_NEW_CARD_CLICKED', required this.source, final String? $type})
      : $type = $type ?? 'buyNewCardClicked';

  factory _$BuyNewCardClickedImpl.fromJson(Map<String, dynamic> json) => _$$BuyNewCardClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.buyNewCardClicked(eventType: $eventType, source: $source)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.buyNewCardClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyNewCardClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyNewCardClickedImplCopyWith<_$BuyNewCardClickedImpl> get copyWith =>
      __$$BuyNewCardClickedImplCopyWithImpl<_$BuyNewCardClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return buyNewCardClicked(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return buyNewCardClicked?.call(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (buyNewCardClicked != null) {
      return buyNewCardClicked(eventType, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return buyNewCardClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return buyNewCardClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (buyNewCardClicked != null) {
      return buyNewCardClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyNewCardClickedImplToJson(
      this,
    );
  }
}

abstract class BuyNewCardClicked implements AmplitudeEvent {
  const factory BuyNewCardClicked({final String eventType, required final String source}) = _$BuyNewCardClickedImpl;

  factory BuyNewCardClicked.fromJson(Map<String, dynamic> json) = _$BuyNewCardClickedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$BuyNewCardClickedImplCopyWith<_$BuyNewCardClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectOptionSelectedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$ConnectOptionSelectedImplCopyWith(
          _$ConnectOptionSelectedImpl value, $Res Function(_$ConnectOptionSelectedImpl) then) =
      __$$ConnectOptionSelectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String connectOption});
}

/// @nodoc
class __$$ConnectOptionSelectedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$ConnectOptionSelectedImpl>
    implements _$$ConnectOptionSelectedImplCopyWith<$Res> {
  __$$ConnectOptionSelectedImplCopyWithImpl(
      _$ConnectOptionSelectedImpl _value, $Res Function(_$ConnectOptionSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? connectOption = null,
  }) {
    return _then(_$ConnectOptionSelectedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      connectOption: null == connectOption
          ? _value.connectOption
          : connectOption // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectOptionSelectedImpl with DiagnosticableTreeMixin implements ConnectOptionSelected {
  const _$ConnectOptionSelectedImpl(
      {this.eventType = 'CONNECT_OPTION_SELECTED',
      required this.source,
      required this.connectOption,
      final String? $type})
      : $type = $type ?? 'connectOptionSelected';

  factory _$ConnectOptionSelectedImpl.fromJson(Map<String, dynamic> json) => _$$ConnectOptionSelectedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String connectOption;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.connectOptionSelected(eventType: $eventType, source: $source, connectOption: $connectOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.connectOptionSelected'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('connectOption', connectOption));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectOptionSelectedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.connectOption, connectOption) || other.connectOption == connectOption));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, connectOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectOptionSelectedImplCopyWith<_$ConnectOptionSelectedImpl> get copyWith =>
      __$$ConnectOptionSelectedImplCopyWithImpl<_$ConnectOptionSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return connectOptionSelected(eventType, source, connectOption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return connectOptionSelected?.call(eventType, source, connectOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (connectOptionSelected != null) {
      return connectOptionSelected(eventType, source, connectOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return connectOptionSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return connectOptionSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (connectOptionSelected != null) {
      return connectOptionSelected(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectOptionSelectedImplToJson(
      this,
    );
  }
}

abstract class ConnectOptionSelected implements AmplitudeEvent {
  const factory ConnectOptionSelected(
      {final String eventType,
      required final String source,
      required final String connectOption}) = _$ConnectOptionSelectedImpl;

  factory ConnectOptionSelected.fromJson(Map<String, dynamic> json) = _$ConnectOptionSelectedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get connectOption;
  @override
  @JsonKey(ignore: true)
  _$$ConnectOptionSelectedImplCopyWith<_$ConnectOptionSelectedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NfcTappedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$NfcTappedImplCopyWith(_$NfcTappedImpl value, $Res Function(_$NfcTappedImpl) then) =
      __$$NfcTappedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String walletAddress});
}

/// @nodoc
class __$$NfcTappedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$NfcTappedImpl>
    implements _$$NfcTappedImplCopyWith<$Res> {
  __$$NfcTappedImplCopyWithImpl(_$NfcTappedImpl _value, $Res Function(_$NfcTappedImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? walletAddress = null,
  }) {
    return _then(_$NfcTappedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NfcTappedImpl with DiagnosticableTreeMixin implements NfcTapped {
  const _$NfcTappedImpl(
      {this.eventType = 'NFC_TAPPED', required this.source, required this.walletAddress, final String? $type})
      : $type = $type ?? 'nfcTapped';

  factory _$NfcTappedImpl.fromJson(Map<String, dynamic> json) => _$$NfcTappedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String walletAddress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.nfcTapped(eventType: $eventType, source: $source, walletAddress: $walletAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.nfcTapped'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('walletAddress', walletAddress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NfcTappedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, walletAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NfcTappedImplCopyWith<_$NfcTappedImpl> get copyWith =>
      __$$NfcTappedImplCopyWithImpl<_$NfcTappedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return nfcTapped(eventType, source, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return nfcTapped?.call(eventType, source, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (nfcTapped != null) {
      return nfcTapped(eventType, source, walletAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return nfcTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return nfcTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (nfcTapped != null) {
      return nfcTapped(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NfcTappedImplToJson(
      this,
    );
  }
}

abstract class NfcTapped implements AmplitudeEvent {
  const factory NfcTapped({final String eventType, required final String source, required final String walletAddress}) =
      _$NfcTappedImpl;

  factory NfcTapped.fromJson(Map<String, dynamic> json) = _$NfcTappedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get walletAddress;
  @override
  @JsonKey(ignore: true)
  _$$NfcTappedImplCopyWith<_$NfcTappedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NfcClosedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$NfcClosedImplCopyWith(_$NfcClosedImpl value, $Res Function(_$NfcClosedImpl) then) =
      __$$NfcClosedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source});
}

/// @nodoc
class __$$NfcClosedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$NfcClosedImpl>
    implements _$$NfcClosedImplCopyWith<$Res> {
  __$$NfcClosedImplCopyWithImpl(_$NfcClosedImpl _value, $Res Function(_$NfcClosedImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
  }) {
    return _then(_$NfcClosedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NfcClosedImpl with DiagnosticableTreeMixin implements NfcClosed {
  const _$NfcClosedImpl({this.eventType = 'NFC_CLOSED', required this.source, final String? $type})
      : $type = $type ?? 'nfcClosed';

  factory _$NfcClosedImpl.fromJson(Map<String, dynamic> json) => _$$NfcClosedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.nfcClosed(eventType: $eventType, source: $source)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.nfcClosed'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NfcClosedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NfcClosedImplCopyWith<_$NfcClosedImpl> get copyWith =>
      __$$NfcClosedImplCopyWithImpl<_$NfcClosedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return nfcClosed(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return nfcClosed?.call(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (nfcClosed != null) {
      return nfcClosed(eventType, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return nfcClosed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return nfcClosed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (nfcClosed != null) {
      return nfcClosed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NfcClosedImplToJson(
      this,
    );
  }
}

abstract class NfcClosed implements AmplitudeEvent {
  const factory NfcClosed({final String eventType, required final String source}) = _$NfcClosedImpl;

  factory NfcClosed.fromJson(Map<String, dynamic> json) = _$NfcClosedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$NfcClosedImplCopyWith<_$NfcClosedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddressFilledImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$AddressFilledImplCopyWith(_$AddressFilledImpl value, $Res Function(_$AddressFilledImpl) then) =
      __$$AddressFilledImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String walletType, String walletAddress});
}

/// @nodoc
class __$$AddressFilledImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$AddressFilledImpl>
    implements _$$AddressFilledImplCopyWith<$Res> {
  __$$AddressFilledImplCopyWithImpl(_$AddressFilledImpl _value, $Res Function(_$AddressFilledImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? walletType = null,
    Object? walletAddress = null,
  }) {
    return _then(_$AddressFilledImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressFilledImpl with DiagnosticableTreeMixin implements AddressFilled {
  const _$AddressFilledImpl(
      {this.eventType = 'ADDRESS_FILLED',
      required this.source,
      required this.walletType,
      required this.walletAddress,
      final String? $type})
      : $type = $type ?? 'addressFilled';

  factory _$AddressFilledImpl.fromJson(Map<String, dynamic> json) => _$$AddressFilledImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String walletType;
  @override
  final String walletAddress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.addressFilled(eventType: $eventType, source: $source, walletType: $walletType, walletAddress: $walletAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.addressFilled'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressFilledImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, walletType, walletAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressFilledImplCopyWith<_$AddressFilledImpl> get copyWith =>
      __$$AddressFilledImplCopyWithImpl<_$AddressFilledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return addressFilled(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return addressFilled?.call(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (addressFilled != null) {
      return addressFilled(eventType, source, walletType, walletAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return addressFilled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return addressFilled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (addressFilled != null) {
      return addressFilled(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressFilledImplToJson(
      this,
    );
  }
}

abstract class AddressFilled implements AmplitudeEvent {
  const factory AddressFilled(
      {final String eventType,
      required final String source,
      required final String walletType,
      required final String walletAddress}) = _$AddressFilledImpl;

  factory AddressFilled.fromJson(Map<String, dynamic> json) = _$AddressFilledImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get walletType;
  String get walletAddress;
  @override
  @JsonKey(ignore: true)
  _$$AddressFilledImplCopyWith<_$AddressFilledImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeeplinkClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$DeeplinkClickedImplCopyWith(_$DeeplinkClickedImpl value, $Res Function(_$DeeplinkClickedImpl) then) =
      __$$DeeplinkClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String walletType, String walletAddress});
}

/// @nodoc
class __$$DeeplinkClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$DeeplinkClickedImpl>
    implements _$$DeeplinkClickedImplCopyWith<$Res> {
  __$$DeeplinkClickedImplCopyWithImpl(_$DeeplinkClickedImpl _value, $Res Function(_$DeeplinkClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? walletType = null,
    Object? walletAddress = null,
  }) {
    return _then(_$DeeplinkClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeplinkClickedImpl with DiagnosticableTreeMixin implements DeeplinkClicked {
  const _$DeeplinkClickedImpl(
      {this.eventType = 'DEEPLINK_CLICKED',
      required this.source,
      required this.walletType,
      required this.walletAddress,
      final String? $type})
      : $type = $type ?? 'deepLinkClicked';

  factory _$DeeplinkClickedImpl.fromJson(Map<String, dynamic> json) => _$$DeeplinkClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String walletType;
  @override
  final String walletAddress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.deepLinkClicked(eventType: $eventType, source: $source, walletType: $walletType, walletAddress: $walletAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.deepLinkClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplinkClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, walletType, walletAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplinkClickedImplCopyWith<_$DeeplinkClickedImpl> get copyWith =>
      __$$DeeplinkClickedImplCopyWithImpl<_$DeeplinkClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return deepLinkClicked(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return deepLinkClicked?.call(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (deepLinkClicked != null) {
      return deepLinkClicked(eventType, source, walletType, walletAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return deepLinkClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return deepLinkClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (deepLinkClicked != null) {
      return deepLinkClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeplinkClickedImplToJson(
      this,
    );
  }
}

abstract class DeeplinkClicked implements AmplitudeEvent {
  const factory DeeplinkClicked(
      {final String eventType,
      required final String source,
      required final String walletType,
      required final String walletAddress}) = _$DeeplinkClickedImpl;

  factory DeeplinkClicked.fromJson(Map<String, dynamic> json) = _$DeeplinkClickedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get walletType;
  String get walletAddress;
  @override
  @JsonKey(ignore: true)
  _$$DeeplinkClickedImplCopyWith<_$DeeplinkClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TypeSelectedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$TypeSelectedImplCopyWith(_$TypeSelectedImpl value, $Res Function(_$TypeSelectedImpl) then) =
      __$$TypeSelectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String walletType});
}

/// @nodoc
class __$$TypeSelectedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$TypeSelectedImpl>
    implements _$$TypeSelectedImplCopyWith<$Res> {
  __$$TypeSelectedImplCopyWithImpl(_$TypeSelectedImpl _value, $Res Function(_$TypeSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? walletType = null,
  }) {
    return _then(_$TypeSelectedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeSelectedImpl with DiagnosticableTreeMixin implements TypeSelected {
  const _$TypeSelectedImpl(
      {this.eventType = 'WALLET_TYPE_SELECTED', required this.source, required this.walletType, final String? $type})
      : $type = $type ?? 'typeSelected';

  factory _$TypeSelectedImpl.fromJson(Map<String, dynamic> json) => _$$TypeSelectedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String walletType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.typeSelected(eventType: $eventType, source: $source, walletType: $walletType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.typeSelected'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('walletType', walletType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeSelectedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.walletType, walletType) || other.walletType == walletType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, walletType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeSelectedImplCopyWith<_$TypeSelectedImpl> get copyWith =>
      __$$TypeSelectedImplCopyWithImpl<_$TypeSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return typeSelected(eventType, source, walletType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return typeSelected?.call(eventType, source, walletType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (typeSelected != null) {
      return typeSelected(eventType, source, walletType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return typeSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return typeSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (typeSelected != null) {
      return typeSelected(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeSelectedImplToJson(
      this,
    );
  }
}

abstract class TypeSelected implements AmplitudeEvent {
  const factory TypeSelected({final String eventType, required final String source, required final String walletType}) =
      _$TypeSelectedImpl;

  factory TypeSelected.fromJson(Map<String, dynamic> json) = _$TypeSelectedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get walletType;
  @override
  @JsonKey(ignore: true)
  _$$TypeSelectedImplCopyWith<_$TypeSelectedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveToWalletClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$SaveToWalletClickedImplCopyWith(
          _$SaveToWalletClickedImpl value, $Res Function(_$SaveToWalletClickedImpl) then) =
      __$$SaveToWalletClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String walletType, String walletAddress});
}

/// @nodoc
class __$$SaveToWalletClickedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$SaveToWalletClickedImpl>
    implements _$$SaveToWalletClickedImplCopyWith<$Res> {
  __$$SaveToWalletClickedImplCopyWithImpl(
      _$SaveToWalletClickedImpl _value, $Res Function(_$SaveToWalletClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? walletType = null,
    Object? walletAddress = null,
  }) {
    return _then(_$SaveToWalletClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaveToWalletClickedImpl with DiagnosticableTreeMixin implements SaveToWalletClicked {
  const _$SaveToWalletClickedImpl(
      {this.eventType = 'SAVE_TO_WALLET_CLICKED',
      required this.source,
      required this.walletType,
      required this.walletAddress,
      final String? $type})
      : $type = $type ?? 'saveToWalletClicked';

  factory _$SaveToWalletClickedImpl.fromJson(Map<String, dynamic> json) => _$$SaveToWalletClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String walletType;
  @override
  final String walletAddress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.saveToWalletClicked(eventType: $eventType, source: $source, walletType: $walletType, walletAddress: $walletAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.saveToWalletClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveToWalletClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, walletType, walletAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveToWalletClickedImplCopyWith<_$SaveToWalletClickedImpl> get copyWith =>
      __$$SaveToWalletClickedImplCopyWithImpl<_$SaveToWalletClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return saveToWalletClicked(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return saveToWalletClicked?.call(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (saveToWalletClicked != null) {
      return saveToWalletClicked(eventType, source, walletType, walletAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return saveToWalletClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return saveToWalletClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (saveToWalletClicked != null) {
      return saveToWalletClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveToWalletClickedImplToJson(
      this,
    );
  }
}

abstract class SaveToWalletClicked implements AmplitudeEvent {
  const factory SaveToWalletClicked(
      {final String eventType,
      required final String source,
      required final String walletType,
      required final String walletAddress}) = _$SaveToWalletClickedImpl;

  factory SaveToWalletClicked.fromJson(Map<String, dynamic> json) = _$SaveToWalletClickedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get walletType;
  String get walletAddress;
  @override
  @JsonKey(ignore: true)
  _$$SaveToWalletClickedImplCopyWith<_$SaveToWalletClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AlreadySavedGotItClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$AlreadySavedGotItClickedImplCopyWith(
          _$AlreadySavedGotItClickedImpl value, $Res Function(_$AlreadySavedGotItClickedImpl) then) =
      __$$AlreadySavedGotItClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletType, String walletAddress});
}

/// @nodoc
class __$$AlreadySavedGotItClickedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$AlreadySavedGotItClickedImpl>
    implements _$$AlreadySavedGotItClickedImplCopyWith<$Res> {
  __$$AlreadySavedGotItClickedImplCopyWithImpl(
      _$AlreadySavedGotItClickedImpl _value, $Res Function(_$AlreadySavedGotItClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletType = null,
    Object? walletAddress = null,
  }) {
    return _then(_$AlreadySavedGotItClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlreadySavedGotItClickedImpl with DiagnosticableTreeMixin implements AlreadySavedGotItClicked {
  const _$AlreadySavedGotItClickedImpl(
      {this.eventType = 'ALREADY_SAVED_GOT_IT_CLICKED',
      required this.walletType,
      required this.walletAddress,
      final String? $type})
      : $type = $type ?? 'alreadySavedGotItClicked';

  factory _$AlreadySavedGotItClickedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlreadySavedGotItClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletType;
  @override
  final String walletAddress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.alreadySavedGotItClicked(eventType: $eventType, walletType: $walletType, walletAddress: $walletAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.alreadySavedGotItClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlreadySavedGotItClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletType, walletAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlreadySavedGotItClickedImplCopyWith<_$AlreadySavedGotItClickedImpl> get copyWith =>
      __$$AlreadySavedGotItClickedImplCopyWithImpl<_$AlreadySavedGotItClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return alreadySavedGotItClicked(eventType, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return alreadySavedGotItClicked?.call(eventType, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (alreadySavedGotItClicked != null) {
      return alreadySavedGotItClicked(eventType, walletType, walletAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return alreadySavedGotItClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return alreadySavedGotItClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (alreadySavedGotItClicked != null) {
      return alreadySavedGotItClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AlreadySavedGotItClickedImplToJson(
      this,
    );
  }
}

abstract class AlreadySavedGotItClicked implements AmplitudeEvent {
  const factory AlreadySavedGotItClicked(
      {final String eventType,
      required final String walletType,
      required final String walletAddress}) = _$AlreadySavedGotItClickedImpl;

  factory AlreadySavedGotItClicked.fromJson(Map<String, dynamic> json) = _$AlreadySavedGotItClickedImpl.fromJson;

  @override
  String get eventType;
  String get walletType;
  String get walletAddress;
  @override
  @JsonKey(ignore: true)
  _$$AlreadySavedGotItClickedImplCopyWith<_$AlreadySavedGotItClickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActivatedCheckboxClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$ActivatedCheckboxClickedImplCopyWith(
          _$ActivatedCheckboxClickedImpl value, $Res Function(_$ActivatedCheckboxClickedImpl) then) =
      __$$ActivatedCheckboxClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String walletType, String walletAddress});
}

/// @nodoc
class __$$ActivatedCheckboxClickedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$ActivatedCheckboxClickedImpl>
    implements _$$ActivatedCheckboxClickedImplCopyWith<$Res> {
  __$$ActivatedCheckboxClickedImplCopyWithImpl(
      _$ActivatedCheckboxClickedImpl _value, $Res Function(_$ActivatedCheckboxClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? walletType = null,
    Object? walletAddress = null,
  }) {
    return _then(_$ActivatedCheckboxClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivatedCheckboxClickedImpl with DiagnosticableTreeMixin implements ActivatedCheckboxClicked {
  const _$ActivatedCheckboxClickedImpl(
      {this.eventType = 'ACTIVATED_CHECKBOX_CLICKED',
      required this.source,
      required this.walletType,
      required this.walletAddress,
      final String? $type})
      : $type = $type ?? 'activatedCheckboxClicked';

  factory _$ActivatedCheckboxClickedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivatedCheckboxClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String walletType;
  @override
  final String walletAddress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.activatedCheckboxClicked(eventType: $eventType, source: $source, walletType: $walletType, walletAddress: $walletAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.activatedCheckboxClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivatedCheckboxClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, walletType, walletAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivatedCheckboxClickedImplCopyWith<_$ActivatedCheckboxClickedImpl> get copyWith =>
      __$$ActivatedCheckboxClickedImplCopyWithImpl<_$ActivatedCheckboxClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return activatedCheckboxClicked(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return activatedCheckboxClicked?.call(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (activatedCheckboxClicked != null) {
      return activatedCheckboxClicked(eventType, source, walletType, walletAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return activatedCheckboxClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return activatedCheckboxClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (activatedCheckboxClicked != null) {
      return activatedCheckboxClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivatedCheckboxClickedImplToJson(
      this,
    );
  }
}

abstract class ActivatedCheckboxClicked implements AmplitudeEvent {
  const factory ActivatedCheckboxClicked(
      {final String eventType,
      required final String source,
      required final String walletType,
      required final String walletAddress}) = _$ActivatedCheckboxClickedImpl;

  factory ActivatedCheckboxClicked.fromJson(Map<String, dynamic> json) = _$ActivatedCheckboxClickedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get walletType;
  String get walletAddress;
  @override
  @JsonKey(ignore: true)
  _$$ActivatedCheckboxClickedImplCopyWith<_$ActivatedCheckboxClickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GotItClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$GotItClickedImplCopyWith(_$GotItClickedImpl value, $Res Function(_$GotItClickedImpl) then) =
      __$$GotItClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String walletType, String walletAddress});
}

/// @nodoc
class __$$GotItClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$GotItClickedImpl>
    implements _$$GotItClickedImplCopyWith<$Res> {
  __$$GotItClickedImplCopyWithImpl(_$GotItClickedImpl _value, $Res Function(_$GotItClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? walletType = null,
    Object? walletAddress = null,
  }) {
    return _then(_$GotItClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GotItClickedImpl with DiagnosticableTreeMixin implements GotItClicked {
  const _$GotItClickedImpl(
      {this.eventType = 'GOT_IT_CLICKED',
      required this.source,
      required this.walletType,
      required this.walletAddress,
      final String? $type})
      : $type = $type ?? 'gotItClicked';

  factory _$GotItClickedImpl.fromJson(Map<String, dynamic> json) => _$$GotItClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String walletType;
  @override
  final String walletAddress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.gotItClicked(eventType: $eventType, source: $source, walletType: $walletType, walletAddress: $walletAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.gotItClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GotItClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, walletType, walletAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GotItClickedImplCopyWith<_$GotItClickedImpl> get copyWith =>
      __$$GotItClickedImplCopyWithImpl<_$GotItClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return gotItClicked(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return gotItClicked?.call(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (gotItClicked != null) {
      return gotItClicked(eventType, source, walletType, walletAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return gotItClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return gotItClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (gotItClicked != null) {
      return gotItClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GotItClickedImplToJson(
      this,
    );
  }
}

abstract class GotItClicked implements AmplitudeEvent {
  const factory GotItClicked(
      {final String eventType,
      required final String source,
      required final String walletType,
      required final String walletAddress}) = _$GotItClickedImpl;

  factory GotItClicked.fromJson(Map<String, dynamic> json) = _$GotItClickedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get walletType;
  String get walletAddress;
  @override
  @JsonKey(ignore: true)
  _$$GotItClickedImplCopyWith<_$GotItClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FakeWalletImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$FakeWalletImplCopyWith(_$FakeWalletImpl value, $Res Function(_$FakeWalletImpl) then) =
      __$$FakeWalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String walletType, String walletAddress});
}

/// @nodoc
class __$$FakeWalletImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$FakeWalletImpl>
    implements _$$FakeWalletImplCopyWith<$Res> {
  __$$FakeWalletImplCopyWithImpl(_$FakeWalletImpl _value, $Res Function(_$FakeWalletImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? walletType = null,
    Object? walletAddress = null,
  }) {
    return _then(_$FakeWalletImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FakeWalletImpl with DiagnosticableTreeMixin implements FakeWallet {
  const _$FakeWalletImpl(
      {this.eventType = 'FAKE_WALLET',
      required this.source,
      required this.walletType,
      required this.walletAddress,
      final String? $type})
      : $type = $type ?? 'fakeWallet';

  factory _$FakeWalletImpl.fromJson(Map<String, dynamic> json) => _$$FakeWalletImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String walletType;
  @override
  final String walletAddress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.fakeWallet(eventType: $eventType, source: $source, walletType: $walletType, walletAddress: $walletAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.fakeWallet'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FakeWalletImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, walletType, walletAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FakeWalletImplCopyWith<_$FakeWalletImpl> get copyWith =>
      __$$FakeWalletImplCopyWithImpl<_$FakeWalletImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return fakeWallet(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return fakeWallet?.call(eventType, source, walletType, walletAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (fakeWallet != null) {
      return fakeWallet(eventType, source, walletType, walletAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return fakeWallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return fakeWallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (fakeWallet != null) {
      return fakeWallet(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FakeWalletImplToJson(
      this,
    );
  }
}

abstract class FakeWallet implements AmplitudeEvent {
  const factory FakeWallet(
      {final String eventType,
      required final String source,
      required final String walletType,
      required final String walletAddress}) = _$FakeWalletImpl;

  factory FakeWallet.fromJson(Map<String, dynamic> json) = _$FakeWalletImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get walletType;
  String get walletAddress;
  @override
  @JsonKey(ignore: true)
  _$$FakeWalletImplCopyWith<_$FakeWalletImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WarningCheckboxClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$WarningCheckboxClickedImplCopyWith(
          _$WarningCheckboxClickedImpl value, $Res Function(_$WarningCheckboxClickedImpl) then) =
      __$$WarningCheckboxClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$WarningCheckboxClickedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$WarningCheckboxClickedImpl>
    implements _$$WarningCheckboxClickedImplCopyWith<$Res> {
  __$$WarningCheckboxClickedImplCopyWithImpl(
      _$WarningCheckboxClickedImpl _value, $Res Function(_$WarningCheckboxClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$WarningCheckboxClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WarningCheckboxClickedImpl with DiagnosticableTreeMixin implements WarningCheckboxClicked {
  const _$WarningCheckboxClickedImpl({this.eventType = 'WARNING_CHECKBOX_CLICKED', final String? $type})
      : $type = $type ?? 'warningCheckboxClicked';

  factory _$WarningCheckboxClickedImpl.fromJson(Map<String, dynamic> json) =>
      _$$WarningCheckboxClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.warningCheckboxClicked(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.warningCheckboxClicked'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarningCheckboxClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WarningCheckboxClickedImplCopyWith<_$WarningCheckboxClickedImpl> get copyWith =>
      __$$WarningCheckboxClickedImplCopyWithImpl<_$WarningCheckboxClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return warningCheckboxClicked(eventType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return warningCheckboxClicked?.call(eventType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (warningCheckboxClicked != null) {
      return warningCheckboxClicked(eventType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return warningCheckboxClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return warningCheckboxClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (warningCheckboxClicked != null) {
      return warningCheckboxClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WarningCheckboxClickedImplToJson(
      this,
    );
  }
}

abstract class WarningCheckboxClicked implements AmplitudeEvent {
  const factory WarningCheckboxClicked({final String eventType}) = _$WarningCheckboxClickedImpl;

  factory WarningCheckboxClicked.fromJson(Map<String, dynamic> json) = _$WarningCheckboxClickedImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$WarningCheckboxClickedImplCopyWith<_$WarningCheckboxClickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppLockEnabledImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$AppLockEnabledImplCopyWith(_$AppLockEnabledImpl value, $Res Function(_$AppLockEnabledImpl) then) =
      __$$AppLockEnabledImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$AppLockEnabledImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$AppLockEnabledImpl>
    implements _$$AppLockEnabledImplCopyWith<$Res> {
  __$$AppLockEnabledImplCopyWithImpl(_$AppLockEnabledImpl _value, $Res Function(_$AppLockEnabledImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$AppLockEnabledImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppLockEnabledImpl with DiagnosticableTreeMixin implements AppLockEnabled {
  const _$AppLockEnabledImpl({this.eventType = 'APP_LOCK_ENABLED', final String? $type})
      : $type = $type ?? 'appLockEnabled';

  factory _$AppLockEnabledImpl.fromJson(Map<String, dynamic> json) => _$$AppLockEnabledImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.appLockEnabled(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.appLockEnabled'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLockEnabledImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLockEnabledImplCopyWith<_$AppLockEnabledImpl> get copyWith =>
      __$$AppLockEnabledImplCopyWithImpl<_$AppLockEnabledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return appLockEnabled(eventType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return appLockEnabled?.call(eventType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (appLockEnabled != null) {
      return appLockEnabled(eventType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return appLockEnabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return appLockEnabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (appLockEnabled != null) {
      return appLockEnabled(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AppLockEnabledImplToJson(
      this,
    );
  }
}

abstract class AppLockEnabled implements AmplitudeEvent {
  const factory AppLockEnabled({final String eventType}) = _$AppLockEnabledImpl;

  factory AppLockEnabled.fromJson(Map<String, dynamic> json) = _$AppLockEnabledImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$AppLockEnabledImplCopyWith<_$AppLockEnabledImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotNowLockClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$NotNowLockClickedImplCopyWith(_$NotNowLockClickedImpl value, $Res Function(_$NotNowLockClickedImpl) then) =
      __$$NotNowLockClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$NotNowLockClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$NotNowLockClickedImpl>
    implements _$$NotNowLockClickedImplCopyWith<$Res> {
  __$$NotNowLockClickedImplCopyWithImpl(_$NotNowLockClickedImpl _value, $Res Function(_$NotNowLockClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$NotNowLockClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotNowLockClickedImpl with DiagnosticableTreeMixin implements NotNowLockClicked {
  const _$NotNowLockClickedImpl({this.eventType = 'NOT_NOW_LOCK_CLICKED', final String? $type})
      : $type = $type ?? 'notNowLockClicked';

  factory _$NotNowLockClickedImpl.fromJson(Map<String, dynamic> json) => _$$NotNowLockClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.notNowLockClicked(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.notNowLockClicked'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotNowLockClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotNowLockClickedImplCopyWith<_$NotNowLockClickedImpl> get copyWith =>
      __$$NotNowLockClickedImplCopyWithImpl<_$NotNowLockClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return notNowLockClicked(eventType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return notNowLockClicked?.call(eventType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (notNowLockClicked != null) {
      return notNowLockClicked(eventType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return notNowLockClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return notNowLockClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (notNowLockClicked != null) {
      return notNowLockClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotNowLockClickedImplToJson(
      this,
    );
  }
}

abstract class NotNowLockClicked implements AmplitudeEvent {
  const factory NotNowLockClicked({final String eventType}) = _$NotNowLockClickedImpl;

  factory NotNowLockClicked.fromJson(Map<String, dynamic> json) = _$NotNowLockClickedImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$NotNowLockClickedImplCopyWith<_$NotNowLockClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletTabClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$WalletTabClickedImplCopyWith(_$WalletTabClickedImpl value, $Res Function(_$WalletTabClickedImpl) then) =
      __$$WalletTabClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$WalletTabClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$WalletTabClickedImpl>
    implements _$$WalletTabClickedImplCopyWith<$Res> {
  __$$WalletTabClickedImplCopyWithImpl(_$WalletTabClickedImpl _value, $Res Function(_$WalletTabClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$WalletTabClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTabClickedImpl with DiagnosticableTreeMixin implements WalletTabClicked {
  const _$WalletTabClickedImpl({this.eventType = 'WALLET_TAB_CLICKED', final String? $type})
      : $type = $type ?? 'walletTabClicked';

  factory _$WalletTabClickedImpl.fromJson(Map<String, dynamic> json) => _$$WalletTabClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.walletTabClicked(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.walletTabClicked'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTabClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTabClickedImplCopyWith<_$WalletTabClickedImpl> get copyWith =>
      __$$WalletTabClickedImplCopyWithImpl<_$WalletTabClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return walletTabClicked(eventType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return walletTabClicked?.call(eventType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (walletTabClicked != null) {
      return walletTabClicked(eventType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return walletTabClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return walletTabClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (walletTabClicked != null) {
      return walletTabClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTabClickedImplToJson(
      this,
    );
  }
}

abstract class WalletTabClicked implements AmplitudeEvent {
  const factory WalletTabClicked({final String eventType}) = _$WalletTabClickedImpl;

  factory WalletTabClicked.fromJson(Map<String, dynamic> json) = _$WalletTabClickedImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$WalletTabClickedImplCopyWith<_$WalletTabClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsTabClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$SettingsTabClickedImplCopyWith(
          _$SettingsTabClickedImpl value, $Res Function(_$SettingsTabClickedImpl) then) =
      __$$SettingsTabClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$SettingsTabClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$SettingsTabClickedImpl>
    implements _$$SettingsTabClickedImplCopyWith<$Res> {
  __$$SettingsTabClickedImplCopyWithImpl(_$SettingsTabClickedImpl _value, $Res Function(_$SettingsTabClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$SettingsTabClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsTabClickedImpl with DiagnosticableTreeMixin implements SettingsTabClicked {
  const _$SettingsTabClickedImpl({this.eventType = 'SETTINGS_TAB_CLICKED', final String? $type})
      : $type = $type ?? 'settingsTabClicked';

  factory _$SettingsTabClickedImpl.fromJson(Map<String, dynamic> json) => _$$SettingsTabClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.settingsTabClicked(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.settingsTabClicked'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsTabClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsTabClickedImplCopyWith<_$SettingsTabClickedImpl> get copyWith =>
      __$$SettingsTabClickedImplCopyWithImpl<_$SettingsTabClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return settingsTabClicked(eventType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return settingsTabClicked?.call(eventType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (settingsTabClicked != null) {
      return settingsTabClicked(eventType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return settingsTabClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return settingsTabClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (settingsTabClicked != null) {
      return settingsTabClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsTabClickedImplToJson(
      this,
    );
  }
}

abstract class SettingsTabClicked implements AmplitudeEvent {
  const factory SettingsTabClicked({final String eventType}) = _$SettingsTabClickedImpl;

  factory SettingsTabClicked.fromJson(Map<String, dynamic> json) = _$SettingsTabClickedImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$SettingsTabClickedImplCopyWith<_$SettingsTabClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsButtonClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$TransactionsButtonClickedImplCopyWith(
          _$TransactionsButtonClickedImpl value, $Res Function(_$TransactionsButtonClickedImpl) then) =
      __$$TransactionsButtonClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletType, String walletAddress, bool activated});
}

/// @nodoc
class __$$TransactionsButtonClickedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$TransactionsButtonClickedImpl>
    implements _$$TransactionsButtonClickedImplCopyWith<$Res> {
  __$$TransactionsButtonClickedImplCopyWithImpl(
      _$TransactionsButtonClickedImpl _value, $Res Function(_$TransactionsButtonClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletType = null,
    Object? walletAddress = null,
    Object? activated = null,
  }) {
    return _then(_$TransactionsButtonClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionsButtonClickedImpl with DiagnosticableTreeMixin implements TransactionsButtonClicked {
  const _$TransactionsButtonClickedImpl(
      {this.eventType = 'TRANSACTIONS_BUTTON_CLICKED',
      required this.walletType,
      required this.walletAddress,
      required this.activated,
      final String? $type})
      : $type = $type ?? 'transactionsButtonClicked';

  factory _$TransactionsButtonClickedImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionsButtonClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletType;
  @override
  final String walletAddress;
  @override
  final bool activated;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.transactionsButtonClicked(eventType: $eventType, walletType: $walletType, walletAddress: $walletAddress, activated: $activated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.transactionsButtonClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('activated', activated));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsButtonClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.activated, activated) || other.activated == activated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletType, walletAddress, activated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsButtonClickedImplCopyWith<_$TransactionsButtonClickedImpl> get copyWith =>
      __$$TransactionsButtonClickedImplCopyWithImpl<_$TransactionsButtonClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return transactionsButtonClicked(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return transactionsButtonClicked?.call(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (transactionsButtonClicked != null) {
      return transactionsButtonClicked(eventType, walletType, walletAddress, activated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return transactionsButtonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return transactionsButtonClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (transactionsButtonClicked != null) {
      return transactionsButtonClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionsButtonClickedImplToJson(
      this,
    );
  }
}

abstract class TransactionsButtonClicked implements AmplitudeEvent {
  const factory TransactionsButtonClicked(
      {final String eventType,
      required final String walletType,
      required final String walletAddress,
      required final bool activated}) = _$TransactionsButtonClickedImpl;

  factory TransactionsButtonClicked.fromJson(Map<String, dynamic> json) = _$TransactionsButtonClickedImpl.fromJson;

  @override
  String get eventType;
  String get walletType;
  String get walletAddress;
  bool get activated;
  @override
  @JsonKey(ignore: true)
  _$$TransactionsButtonClickedImplCopyWith<_$TransactionsButtonClickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddNewClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$AddNewClickedImplCopyWith(_$AddNewClickedImpl value, $Res Function(_$AddNewClickedImpl) then) =
      __$$AddNewClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String tab});
}

/// @nodoc
class __$$AddNewClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$AddNewClickedImpl>
    implements _$$AddNewClickedImplCopyWith<$Res> {
  __$$AddNewClickedImplCopyWithImpl(_$AddNewClickedImpl _value, $Res Function(_$AddNewClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? tab = null,
  }) {
    return _then(_$AddNewClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddNewClickedImpl with DiagnosticableTreeMixin implements AddNewClicked {
  const _$AddNewClickedImpl({this.eventType = 'ADD_NEW_CLICKED', required this.tab, final String? $type})
      : $type = $type ?? 'addNewClicked';

  factory _$AddNewClickedImpl.fromJson(Map<String, dynamic> json) => _$$AddNewClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String tab;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.addNewClicked(eventType: $eventType, tab: $tab)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.addNewClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('tab', tab));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddNewClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, tab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddNewClickedImplCopyWith<_$AddNewClickedImpl> get copyWith =>
      __$$AddNewClickedImplCopyWithImpl<_$AddNewClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return addNewClicked(eventType, tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return addNewClicked?.call(eventType, tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (addNewClicked != null) {
      return addNewClicked(eventType, tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return addNewClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return addNewClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (addNewClicked != null) {
      return addNewClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AddNewClickedImplToJson(
      this,
    );
  }
}

abstract class AddNewClicked implements AmplitudeEvent {
  const factory AddNewClicked({final String eventType, required final String tab}) = _$AddNewClickedImpl;

  factory AddNewClicked.fromJson(Map<String, dynamic> json) = _$AddNewClickedImpl.fromJson;

  @override
  String get eventType;
  String get tab;
  @override
  @JsonKey(ignore: true)
  _$$AddNewClickedImplCopyWith<_$AddNewClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddNewPlusClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$AddNewPlusClickedImplCopyWith(_$AddNewPlusClickedImpl value, $Res Function(_$AddNewPlusClickedImpl) then) =
      __$$AddNewPlusClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source});
}

/// @nodoc
class __$$AddNewPlusClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$AddNewPlusClickedImpl>
    implements _$$AddNewPlusClickedImplCopyWith<$Res> {
  __$$AddNewPlusClickedImplCopyWithImpl(_$AddNewPlusClickedImpl _value, $Res Function(_$AddNewPlusClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
  }) {
    return _then(_$AddNewPlusClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddNewPlusClickedImpl with DiagnosticableTreeMixin implements AddNewPlusClicked {
  const _$AddNewPlusClickedImpl({this.eventType = 'ADD_NEW_PLUS_CLICKED', required this.source, final String? $type})
      : $type = $type ?? 'addNewPlusClicked';

  factory _$AddNewPlusClickedImpl.fromJson(Map<String, dynamic> json) => _$$AddNewPlusClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.addNewPlusClicked(eventType: $eventType, source: $source)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.addNewPlusClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddNewPlusClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddNewPlusClickedImplCopyWith<_$AddNewPlusClickedImpl> get copyWith =>
      __$$AddNewPlusClickedImplCopyWithImpl<_$AddNewPlusClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return addNewPlusClicked(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return addNewPlusClicked?.call(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (addNewPlusClicked != null) {
      return addNewPlusClicked(eventType, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return addNewPlusClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return addNewPlusClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (addNewPlusClicked != null) {
      return addNewPlusClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AddNewPlusClickedImplToJson(
      this,
    );
  }
}

abstract class AddNewPlusClicked implements AmplitudeEvent {
  const factory AddNewPlusClicked({final String eventType, required final String source}) = _$AddNewPlusClickedImpl;

  factory AddNewPlusClicked.fromJson(Map<String, dynamic> json) = _$AddNewPlusClickedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$AddNewPlusClickedImplCopyWith<_$AddNewPlusClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletSettingsClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$WalletSettingsClickedImplCopyWith(
          _$WalletSettingsClickedImpl value, $Res Function(_$WalletSettingsClickedImpl) then) =
      __$$WalletSettingsClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletAddress, String walletType});
}

/// @nodoc
class __$$WalletSettingsClickedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$WalletSettingsClickedImpl>
    implements _$$WalletSettingsClickedImplCopyWith<$Res> {
  __$$WalletSettingsClickedImplCopyWithImpl(
      _$WalletSettingsClickedImpl _value, $Res Function(_$WalletSettingsClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletAddress = null,
    Object? walletType = null,
  }) {
    return _then(_$WalletSettingsClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletSettingsClickedImpl with DiagnosticableTreeMixin implements WalletSettingsClicked {
  const _$WalletSettingsClickedImpl(
      {this.eventType = 'WALLET_SETTINGS_CLICKED',
      required this.walletAddress,
      required this.walletType,
      final String? $type})
      : $type = $type ?? 'walletSettingsClicked';

  factory _$WalletSettingsClickedImpl.fromJson(Map<String, dynamic> json) => _$$WalletSettingsClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletAddress;
  @override
  final String walletType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.walletSettingsClicked(eventType: $eventType, walletAddress: $walletAddress, walletType: $walletType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.walletSettingsClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('walletType', walletType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletSettingsClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.walletType, walletType) || other.walletType == walletType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletAddress, walletType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletSettingsClickedImplCopyWith<_$WalletSettingsClickedImpl> get copyWith =>
      __$$WalletSettingsClickedImplCopyWithImpl<_$WalletSettingsClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return walletSettingsClicked(eventType, walletAddress, walletType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return walletSettingsClicked?.call(eventType, walletAddress, walletType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (walletSettingsClicked != null) {
      return walletSettingsClicked(eventType, walletAddress, walletType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return walletSettingsClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return walletSettingsClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (walletSettingsClicked != null) {
      return walletSettingsClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletSettingsClickedImplToJson(
      this,
    );
  }
}

abstract class WalletSettingsClicked implements AmplitudeEvent {
  const factory WalletSettingsClicked(
      {final String eventType,
      required final String walletAddress,
      required final String walletType}) = _$WalletSettingsClickedImpl;

  factory WalletSettingsClicked.fromJson(Map<String, dynamic> json) = _$WalletSettingsClickedImpl.fromJson;

  @override
  String get eventType;
  String get walletAddress;
  String get walletType;
  @override
  @JsonKey(ignore: true)
  _$$WalletSettingsClickedImplCopyWith<_$WalletSettingsClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TopUpButtonClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$TopUpButtonClickedImplCopyWith(
          _$TopUpButtonClickedImpl value, $Res Function(_$TopUpButtonClickedImpl) then) =
      __$$TopUpButtonClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletType, String walletAddress, bool activated});
}

/// @nodoc
class __$$TopUpButtonClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$TopUpButtonClickedImpl>
    implements _$$TopUpButtonClickedImplCopyWith<$Res> {
  __$$TopUpButtonClickedImplCopyWithImpl(_$TopUpButtonClickedImpl _value, $Res Function(_$TopUpButtonClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletType = null,
    Object? walletAddress = null,
    Object? activated = null,
  }) {
    return _then(_$TopUpButtonClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopUpButtonClickedImpl with DiagnosticableTreeMixin implements TopUpButtonClicked {
  const _$TopUpButtonClickedImpl(
      {this.eventType = 'TOP_UP_BUTTON_CLICKED',
      required this.walletType,
      required this.walletAddress,
      required this.activated,
      final String? $type})
      : $type = $type ?? 'topUpButtonCLicked';

  factory _$TopUpButtonClickedImpl.fromJson(Map<String, dynamic> json) => _$$TopUpButtonClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletType;
  @override
  final String walletAddress;
  @override
  final bool activated;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.topUpButtonCLicked(eventType: $eventType, walletType: $walletType, walletAddress: $walletAddress, activated: $activated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.topUpButtonCLicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('activated', activated));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopUpButtonClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.activated, activated) || other.activated == activated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletType, walletAddress, activated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopUpButtonClickedImplCopyWith<_$TopUpButtonClickedImpl> get copyWith =>
      __$$TopUpButtonClickedImplCopyWithImpl<_$TopUpButtonClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return topUpButtonCLicked(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return topUpButtonCLicked?.call(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (topUpButtonCLicked != null) {
      return topUpButtonCLicked(eventType, walletType, walletAddress, activated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return topUpButtonCLicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return topUpButtonCLicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (topUpButtonCLicked != null) {
      return topUpButtonCLicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TopUpButtonClickedImplToJson(
      this,
    );
  }
}

abstract class TopUpButtonClicked implements AmplitudeEvent {
  const factory TopUpButtonClicked(
      {final String eventType,
      required final String walletType,
      required final String walletAddress,
      required final bool activated}) = _$TopUpButtonClickedImpl;

  factory TopUpButtonClicked.fromJson(Map<String, dynamic> json) = _$TopUpButtonClickedImpl.fromJson;

  @override
  String get eventType;
  String get walletType;
  String get walletAddress;
  bool get activated;
  @override
  @JsonKey(ignore: true)
  _$$TopUpButtonClickedImplCopyWith<_$TopUpButtonClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$ReceiveClickedImplCopyWith(_$ReceiveClickedImpl value, $Res Function(_$ReceiveClickedImpl) then) =
      __$$ReceiveClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletType, String walletAddress, bool activated});
}

/// @nodoc
class __$$ReceiveClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$ReceiveClickedImpl>
    implements _$$ReceiveClickedImplCopyWith<$Res> {
  __$$ReceiveClickedImplCopyWithImpl(_$ReceiveClickedImpl _value, $Res Function(_$ReceiveClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletType = null,
    Object? walletAddress = null,
    Object? activated = null,
  }) {
    return _then(_$ReceiveClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiveClickedImpl with DiagnosticableTreeMixin implements ReceiveClicked {
  const _$ReceiveClickedImpl(
      {this.eventType = 'RECEIVE_CLICKED',
      required this.walletType,
      required this.walletAddress,
      required this.activated,
      final String? $type})
      : $type = $type ?? 'receiveClicked';

  factory _$ReceiveClickedImpl.fromJson(Map<String, dynamic> json) => _$$ReceiveClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletType;
  @override
  final String walletAddress;
  @override
  final bool activated;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.receiveClicked(eventType: $eventType, walletType: $walletType, walletAddress: $walletAddress, activated: $activated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.receiveClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('activated', activated));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.activated, activated) || other.activated == activated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletType, walletAddress, activated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveClickedImplCopyWith<_$ReceiveClickedImpl> get copyWith =>
      __$$ReceiveClickedImplCopyWithImpl<_$ReceiveClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return receiveClicked(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return receiveClicked?.call(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (receiveClicked != null) {
      return receiveClicked(eventType, walletType, walletAddress, activated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return receiveClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return receiveClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (receiveClicked != null) {
      return receiveClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiveClickedImplToJson(
      this,
    );
  }
}

abstract class ReceiveClicked implements AmplitudeEvent {
  const factory ReceiveClicked(
      {final String eventType,
      required final String walletType,
      required final String walletAddress,
      required final bool activated}) = _$ReceiveClickedImpl;

  factory ReceiveClicked.fromJson(Map<String, dynamic> json) = _$ReceiveClickedImpl.fromJson;

  @override
  String get eventType;
  String get walletType;
  String get walletAddress;
  bool get activated;
  @override
  @JsonKey(ignore: true)
  _$$ReceiveClickedImplCopyWith<_$ReceiveClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$SendClickedImplCopyWith(_$SendClickedImpl value, $Res Function(_$SendClickedImpl) then) =
      __$$SendClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletType, String walletAddress, bool activated});
}

/// @nodoc
class __$$SendClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$SendClickedImpl>
    implements _$$SendClickedImplCopyWith<$Res> {
  __$$SendClickedImplCopyWithImpl(_$SendClickedImpl _value, $Res Function(_$SendClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletType = null,
    Object? walletAddress = null,
    Object? activated = null,
  }) {
    return _then(_$SendClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendClickedImpl with DiagnosticableTreeMixin implements SendClicked {
  const _$SendClickedImpl(
      {this.eventType = 'SEND_CLICKED',
      required this.walletType,
      required this.walletAddress,
      required this.activated,
      final String? $type})
      : $type = $type ?? 'sendClicked';

  factory _$SendClickedImpl.fromJson(Map<String, dynamic> json) => _$$SendClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletType;
  @override
  final String walletAddress;
  @override
  final bool activated;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.sendClicked(eventType: $eventType, walletType: $walletType, walletAddress: $walletAddress, activated: $activated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.sendClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('activated', activated));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.activated, activated) || other.activated == activated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletType, walletAddress, activated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendClickedImplCopyWith<_$SendClickedImpl> get copyWith =>
      __$$SendClickedImplCopyWithImpl<_$SendClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return sendClicked(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return sendClicked?.call(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (sendClicked != null) {
      return sendClicked(eventType, walletType, walletAddress, activated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return sendClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return sendClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (sendClicked != null) {
      return sendClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SendClickedImplToJson(
      this,
    );
  }
}

abstract class SendClicked implements AmplitudeEvent {
  const factory SendClicked(
      {final String eventType,
      required final String walletType,
      required final String walletAddress,
      required final bool activated}) = _$SendClickedImpl;

  factory SendClicked.fromJson(Map<String, dynamic> json) = _$SendClickedImpl.fromJson;

  @override
  String get eventType;
  String get walletType;
  String get walletAddress;
  bool get activated;
  @override
  @JsonKey(ignore: true)
  _$$SendClickedImplCopyWith<_$SendClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BuyWithCardClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$BuyWithCardClickedImplCopyWith(
          _$BuyWithCardClickedImpl value, $Res Function(_$BuyWithCardClickedImpl) then) =
      __$$BuyWithCardClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletType, String walletAddress, bool activated});
}

/// @nodoc
class __$$BuyWithCardClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$BuyWithCardClickedImpl>
    implements _$$BuyWithCardClickedImplCopyWith<$Res> {
  __$$BuyWithCardClickedImplCopyWithImpl(_$BuyWithCardClickedImpl _value, $Res Function(_$BuyWithCardClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletType = null,
    Object? walletAddress = null,
    Object? activated = null,
  }) {
    return _then(_$BuyWithCardClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuyWithCardClickedImpl with DiagnosticableTreeMixin implements BuyWithCardClicked {
  const _$BuyWithCardClickedImpl(
      {this.eventType = 'BUY_WITH_CARD_CLICKED',
      required this.walletType,
      required this.walletAddress,
      required this.activated,
      final String? $type})
      : $type = $type ?? 'buyWithCardClicked';

  factory _$BuyWithCardClickedImpl.fromJson(Map<String, dynamic> json) => _$$BuyWithCardClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletType;
  @override
  final String walletAddress;
  @override
  final bool activated;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.buyWithCardClicked(eventType: $eventType, walletType: $walletType, walletAddress: $walletAddress, activated: $activated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.buyWithCardClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('activated', activated));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyWithCardClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.activated, activated) || other.activated == activated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletType, walletAddress, activated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyWithCardClickedImplCopyWith<_$BuyWithCardClickedImpl> get copyWith =>
      __$$BuyWithCardClickedImplCopyWithImpl<_$BuyWithCardClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return buyWithCardClicked(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return buyWithCardClicked?.call(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (buyWithCardClicked != null) {
      return buyWithCardClicked(eventType, walletType, walletAddress, activated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return buyWithCardClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return buyWithCardClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (buyWithCardClicked != null) {
      return buyWithCardClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyWithCardClickedImplToJson(
      this,
    );
  }
}

abstract class BuyWithCardClicked implements AmplitudeEvent {
  const factory BuyWithCardClicked(
      {final String eventType,
      required final String walletType,
      required final String walletAddress,
      required final bool activated}) = _$BuyWithCardClickedImpl;

  factory BuyWithCardClicked.fromJson(Map<String, dynamic> json) = _$BuyWithCardClickedImpl.fromJson;

  @override
  String get eventType;
  String get walletType;
  String get walletAddress;
  bool get activated;
  @override
  @JsonKey(ignore: true)
  _$$BuyWithCardClickedImplCopyWith<_$BuyWithCardClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$HistoryClickedImplCopyWith(_$HistoryClickedImpl value, $Res Function(_$HistoryClickedImpl) then) =
      __$$HistoryClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletType, String walletAddress, bool activated});
}

/// @nodoc
class __$$HistoryClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$HistoryClickedImpl>
    implements _$$HistoryClickedImplCopyWith<$Res> {
  __$$HistoryClickedImplCopyWithImpl(_$HistoryClickedImpl _value, $Res Function(_$HistoryClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletType = null,
    Object? walletAddress = null,
    Object? activated = null,
  }) {
    return _then(_$HistoryClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryClickedImpl with DiagnosticableTreeMixin implements HistoryClicked {
  const _$HistoryClickedImpl(
      {this.eventType = 'HISTORY_CLICKED',
      required this.walletType,
      required this.walletAddress,
      required this.activated,
      final String? $type})
      : $type = $type ?? 'historyClicked';

  factory _$HistoryClickedImpl.fromJson(Map<String, dynamic> json) => _$$HistoryClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletType;
  @override
  final String walletAddress;
  @override
  final bool activated;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.historyClicked(eventType: $eventType, walletType: $walletType, walletAddress: $walletAddress, activated: $activated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.historyClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('activated', activated));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.activated, activated) || other.activated == activated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletType, walletAddress, activated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryClickedImplCopyWith<_$HistoryClickedImpl> get copyWith =>
      __$$HistoryClickedImplCopyWithImpl<_$HistoryClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return historyClicked(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return historyClicked?.call(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (historyClicked != null) {
      return historyClicked(eventType, walletType, walletAddress, activated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return historyClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return historyClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (historyClicked != null) {
      return historyClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryClickedImplToJson(
      this,
    );
  }
}

abstract class HistoryClicked implements AmplitudeEvent {
  const factory HistoryClicked(
      {final String eventType,
      required final String walletType,
      required final String walletAddress,
      required final bool activated}) = _$HistoryClickedImpl;

  factory HistoryClicked.fromJson(Map<String, dynamic> json) = _$HistoryClickedImpl.fromJson;

  @override
  String get eventType;
  String get walletType;
  String get walletAddress;
  bool get activated;
  @override
  @JsonKey(ignore: true)
  _$$HistoryClickedImplCopyWith<_$HistoryClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddressCopiedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$AddressCopiedImplCopyWith(_$AddressCopiedImpl value, $Res Function(_$AddressCopiedImpl) then) =
      __$$AddressCopiedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source, String walletType, String walletAddress, bool activated});
}

/// @nodoc
class __$$AddressCopiedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$AddressCopiedImpl>
    implements _$$AddressCopiedImplCopyWith<$Res> {
  __$$AddressCopiedImplCopyWithImpl(_$AddressCopiedImpl _value, $Res Function(_$AddressCopiedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
    Object? walletType = null,
    Object? walletAddress = null,
    Object? activated = null,
  }) {
    return _then(_$AddressCopiedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressCopiedImpl with DiagnosticableTreeMixin implements AddressCopied {
  const _$AddressCopiedImpl(
      {this.eventType = 'ADDRESS_COPIED',
      required this.source,
      required this.walletType,
      required this.walletAddress,
      required this.activated,
      final String? $type})
      : $type = $type ?? 'addressCopied';

  factory _$AddressCopiedImpl.fromJson(Map<String, dynamic> json) => _$$AddressCopiedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;
  @override
  final String walletType;
  @override
  final String walletAddress;
  @override
  final bool activated;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.addressCopied(eventType: $eventType, source: $source, walletType: $walletType, walletAddress: $walletAddress, activated: $activated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.addressCopied'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('activated', activated));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressCopiedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.activated, activated) || other.activated == activated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source, walletType, walletAddress, activated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressCopiedImplCopyWith<_$AddressCopiedImpl> get copyWith =>
      __$$AddressCopiedImplCopyWithImpl<_$AddressCopiedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return addressCopied(eventType, source, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return addressCopied?.call(eventType, source, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (addressCopied != null) {
      return addressCopied(eventType, source, walletType, walletAddress, activated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return addressCopied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return addressCopied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (addressCopied != null) {
      return addressCopied(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressCopiedImplToJson(
      this,
    );
  }
}

abstract class AddressCopied implements AmplitudeEvent {
  const factory AddressCopied(
      {final String eventType,
      required final String source,
      required final String walletType,
      required final String walletAddress,
      required final bool activated}) = _$AddressCopiedImpl;

  factory AddressCopied.fromJson(Map<String, dynamic> json) = _$AddressCopiedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  String get walletType;
  String get walletAddress;
  bool get activated;
  @override
  @JsonKey(ignore: true)
  _$$AddressCopiedImplCopyWith<_$AddressCopiedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShareAddressClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$ShareAddressClickedImplCopyWith(
          _$ShareAddressClickedImpl value, $Res Function(_$ShareAddressClickedImpl) then) =
      __$$ShareAddressClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletType, String walletAddress, bool activated});
}

/// @nodoc
class __$$ShareAddressClickedImplCopyWithImpl<$Res>
    extends _$AmplitudeEventCopyWithImpl<$Res, _$ShareAddressClickedImpl>
    implements _$$ShareAddressClickedImplCopyWith<$Res> {
  __$$ShareAddressClickedImplCopyWithImpl(
      _$ShareAddressClickedImpl _value, $Res Function(_$ShareAddressClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletType = null,
    Object? walletAddress = null,
    Object? activated = null,
  }) {
    return _then(_$ShareAddressClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShareAddressClickedImpl with DiagnosticableTreeMixin implements ShareAddressClicked {
  const _$ShareAddressClickedImpl(
      {this.eventType = 'SHARE_ADDRESS_CLICKED',
      required this.walletType,
      required this.walletAddress,
      required this.activated,
      final String? $type})
      : $type = $type ?? 'shareAddressClicked';

  factory _$ShareAddressClickedImpl.fromJson(Map<String, dynamic> json) => _$$ShareAddressClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletType;
  @override
  final String walletAddress;
  @override
  final bool activated;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.shareAddressClicked(eventType: $eventType, walletType: $walletType, walletAddress: $walletAddress, activated: $activated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.shareAddressClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('activated', activated));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareAddressClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletType, walletType) || other.walletType == walletType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.activated, activated) || other.activated == activated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletType, walletAddress, activated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareAddressClickedImplCopyWith<_$ShareAddressClickedImpl> get copyWith =>
      __$$ShareAddressClickedImplCopyWithImpl<_$ShareAddressClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return shareAddressClicked(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return shareAddressClicked?.call(eventType, walletType, walletAddress, activated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (shareAddressClicked != null) {
      return shareAddressClicked(eventType, walletType, walletAddress, activated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return shareAddressClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return shareAddressClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (shareAddressClicked != null) {
      return shareAddressClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ShareAddressClickedImplToJson(
      this,
    );
  }
}

abstract class ShareAddressClicked implements AmplitudeEvent {
  const factory ShareAddressClicked(
      {final String eventType,
      required final String walletType,
      required final String walletAddress,
      required final bool activated}) = _$ShareAddressClickedImpl;

  factory ShareAddressClicked.fromJson(Map<String, dynamic> json) = _$ShareAddressClickedImpl.fromJson;

  @override
  String get eventType;
  String get walletType;
  String get walletAddress;
  bool get activated;
  @override
  @JsonKey(ignore: true)
  _$$ShareAddressClickedImplCopyWith<_$ShareAddressClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GotItSendClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$GotItSendClickedImplCopyWith(_$GotItSendClickedImpl value, $Res Function(_$GotItSendClickedImpl) then) =
      __$$GotItSendClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$GotItSendClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$GotItSendClickedImpl>
    implements _$$GotItSendClickedImplCopyWith<$Res> {
  __$$GotItSendClickedImplCopyWithImpl(_$GotItSendClickedImpl _value, $Res Function(_$GotItSendClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$GotItSendClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GotItSendClickedImpl with DiagnosticableTreeMixin implements GotItSendClicked {
  const _$GotItSendClickedImpl({this.eventType = 'GOT_IT_SEND_CLICKED', final String? $type})
      : $type = $type ?? 'gotItSendClicked';

  factory _$GotItSendClickedImpl.fromJson(Map<String, dynamic> json) => _$$GotItSendClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.gotItSendClicked(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.gotItSendClicked'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GotItSendClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GotItSendClickedImplCopyWith<_$GotItSendClickedImpl> get copyWith =>
      __$$GotItSendClickedImplCopyWithImpl<_$GotItSendClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return gotItSendClicked(eventType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return gotItSendClicked?.call(eventType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (gotItSendClicked != null) {
      return gotItSendClicked(eventType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return gotItSendClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return gotItSendClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (gotItSendClicked != null) {
      return gotItSendClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GotItSendClickedImplToJson(
      this,
    );
  }
}

abstract class GotItSendClicked implements AmplitudeEvent {
  const factory GotItSendClicked({final String eventType}) = _$GotItSendClickedImpl;

  factory GotItSendClicked.fromJson(Map<String, dynamic> json) = _$GotItSendClickedImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$GotItSendClickedImplCopyWith<_$GotItSendClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendAnywayClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$SendAnywayClickedImplCopyWith(_$SendAnywayClickedImpl value, $Res Function(_$SendAnywayClickedImpl) then) =
      __$$SendAnywayClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$SendAnywayClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$SendAnywayClickedImpl>
    implements _$$SendAnywayClickedImplCopyWith<$Res> {
  __$$SendAnywayClickedImplCopyWithImpl(_$SendAnywayClickedImpl _value, $Res Function(_$SendAnywayClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$SendAnywayClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendAnywayClickedImpl with DiagnosticableTreeMixin implements SendAnywayClicked {
  const _$SendAnywayClickedImpl({this.eventType = 'SEND_ANYWAY_CLICKED', final String? $type})
      : $type = $type ?? 'sendAnywayClicked';

  factory _$SendAnywayClickedImpl.fromJson(Map<String, dynamic> json) => _$$SendAnywayClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.sendAnywayClicked(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.sendAnywayClicked'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendAnywayClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendAnywayClickedImplCopyWith<_$SendAnywayClickedImpl> get copyWith =>
      __$$SendAnywayClickedImplCopyWithImpl<_$SendAnywayClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return sendAnywayClicked(eventType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return sendAnywayClicked?.call(eventType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (sendAnywayClicked != null) {
      return sendAnywayClicked(eventType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return sendAnywayClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return sendAnywayClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (sendAnywayClicked != null) {
      return sendAnywayClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SendAnywayClickedImplToJson(
      this,
    );
  }
}

abstract class SendAnywayClicked implements AmplitudeEvent {
  const factory SendAnywayClicked({final String eventType}) = _$SendAnywayClickedImpl;

  factory SendAnywayClicked.fromJson(Map<String, dynamic> json) = _$SendAnywayClickedImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$SendAnywayClickedImplCopyWith<_$SendAnywayClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BackButtonClickedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$BackButtonClickedImplCopyWith(_$BackButtonClickedImpl value, $Res Function(_$BackButtonClickedImpl) then) =
      __$$BackButtonClickedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String source});
}

/// @nodoc
class __$$BackButtonClickedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$BackButtonClickedImpl>
    implements _$$BackButtonClickedImplCopyWith<$Res> {
  __$$BackButtonClickedImplCopyWithImpl(_$BackButtonClickedImpl _value, $Res Function(_$BackButtonClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? source = null,
  }) {
    return _then(_$BackButtonClickedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackButtonClickedImpl with DiagnosticableTreeMixin implements BackButtonClicked {
  const _$BackButtonClickedImpl({this.eventType = 'BACK_BUTTON_CLICKED', required this.source, final String? $type})
      : $type = $type ?? 'backButtonClicked';

  factory _$BackButtonClickedImpl.fromJson(Map<String, dynamic> json) => _$$BackButtonClickedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String source;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.backButtonClicked(eventType: $eventType, source: $source)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.backButtonClicked'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('source', source));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackButtonClickedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackButtonClickedImplCopyWith<_$BackButtonClickedImpl> get copyWith =>
      __$$BackButtonClickedImplCopyWithImpl<_$BackButtonClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return backButtonClicked(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return backButtonClicked?.call(eventType, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (backButtonClicked != null) {
      return backButtonClicked(eventType, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return backButtonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return backButtonClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (backButtonClicked != null) {
      return backButtonClicked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BackButtonClickedImplToJson(
      this,
    );
  }
}

abstract class BackButtonClicked implements AmplitudeEvent {
  const factory BackButtonClicked({final String eventType, required final String source}) = _$BackButtonClickedImpl;

  factory BackButtonClicked.fromJson(Map<String, dynamic> json) = _$BackButtonClickedImpl.fromJson;

  @override
  String get eventType;
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$BackButtonClickedImplCopyWith<_$BackButtonClickedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Secret1ValidatedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$Secret1ValidatedImplCopyWith(_$Secret1ValidatedImpl value, $Res Function(_$Secret1ValidatedImpl) then) =
      __$$Secret1ValidatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletAddress, String walletType});
}

/// @nodoc
class __$$Secret1ValidatedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$Secret1ValidatedImpl>
    implements _$$Secret1ValidatedImplCopyWith<$Res> {
  __$$Secret1ValidatedImplCopyWithImpl(_$Secret1ValidatedImpl _value, $Res Function(_$Secret1ValidatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletAddress = null,
    Object? walletType = null,
  }) {
    return _then(_$Secret1ValidatedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Secret1ValidatedImpl with DiagnosticableTreeMixin implements Secret1Validated {
  const _$Secret1ValidatedImpl(
      {this.eventType = 'SECRET_1_VALIDATED',
      required this.walletAddress,
      required this.walletType,
      final String? $type})
      : $type = $type ?? 'secret1Validated';

  factory _$Secret1ValidatedImpl.fromJson(Map<String, dynamic> json) => _$$Secret1ValidatedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletAddress;
  @override
  final String walletType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.secret1Validated(eventType: $eventType, walletAddress: $walletAddress, walletType: $walletType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.secret1Validated'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('walletType', walletType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Secret1ValidatedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.walletType, walletType) || other.walletType == walletType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletAddress, walletType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Secret1ValidatedImplCopyWith<_$Secret1ValidatedImpl> get copyWith =>
      __$$Secret1ValidatedImplCopyWithImpl<_$Secret1ValidatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return secret1Validated(eventType, walletAddress, walletType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return secret1Validated?.call(eventType, walletAddress, walletType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (secret1Validated != null) {
      return secret1Validated(eventType, walletAddress, walletType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return secret1Validated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return secret1Validated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (secret1Validated != null) {
      return secret1Validated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$Secret1ValidatedImplToJson(
      this,
    );
  }
}

abstract class Secret1Validated implements AmplitudeEvent {
  const factory Secret1Validated(
      {final String eventType,
      required final String walletAddress,
      required final String walletType}) = _$Secret1ValidatedImpl;

  factory Secret1Validated.fromJson(Map<String, dynamic> json) = _$Secret1ValidatedImpl.fromJson;

  @override
  String get eventType;
  String get walletAddress;
  String get walletType;
  @override
  @JsonKey(ignore: true)
  _$$Secret1ValidatedImplCopyWith<_$Secret1ValidatedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Secret2ValidatedImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$Secret2ValidatedImplCopyWith(_$Secret2ValidatedImpl value, $Res Function(_$Secret2ValidatedImpl) then) =
      __$$Secret2ValidatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, String walletAddress, String walletType});
}

/// @nodoc
class __$$Secret2ValidatedImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$Secret2ValidatedImpl>
    implements _$$Secret2ValidatedImplCopyWith<$Res> {
  __$$Secret2ValidatedImplCopyWithImpl(_$Secret2ValidatedImpl _value, $Res Function(_$Secret2ValidatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? walletAddress = null,
    Object? walletType = null,
  }) {
    return _then(_$Secret2ValidatedImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Secret2ValidatedImpl with DiagnosticableTreeMixin implements Secret2Validated {
  const _$Secret2ValidatedImpl(
      {this.eventType = 'SECRET_2_VALIDATED',
      required this.walletAddress,
      required this.walletType,
      final String? $type})
      : $type = $type ?? 'secret2Validated';

  factory _$Secret2ValidatedImpl.fromJson(Map<String, dynamic> json) => _$$Secret2ValidatedImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final String walletAddress;
  @override
  final String walletType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.secret2Validated(eventType: $eventType, walletAddress: $walletAddress, walletType: $walletType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.secret2Validated'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('walletType', walletType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Secret2ValidatedImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress) &&
            (identical(other.walletType, walletType) || other.walletType == walletType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, walletAddress, walletType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Secret2ValidatedImplCopyWith<_$Secret2ValidatedImpl> get copyWith =>
      __$$Secret2ValidatedImplCopyWithImpl<_$Secret2ValidatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) connectWalletClicked,
    required TResult Function(String eventType, String source) connectManuallyClicked,
    required TResult Function(String eventType, String source) connectWithQrClicked,
    required TResult Function(String eventType, String walletType, String source) qrButtonClicked,
    required TResult Function(String eventType, String source, String walletAddress) qrScanned,
    required TResult Function(String eventType, String source) buyNewCardClicked,
    required TResult Function(String eventType, String source, String connectOption) connectOptionSelected,
    required TResult Function(String eventType, String source, String walletAddress) nfcTapped,
    required TResult Function(String eventType, String source) nfcClosed,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) addressFilled,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) deepLinkClicked,
    required TResult Function(String eventType, String source, String walletType) typeSelected,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        saveToWalletClicked,
    required TResult Function(String eventType, String walletType, String walletAddress) alreadySavedGotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress)
        activatedCheckboxClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) gotItClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress) fakeWallet,
    required TResult Function(String eventType) warningCheckboxClicked,
    required TResult Function(String eventType) appLockEnabled,
    required TResult Function(String eventType) notNowLockClicked,
    required TResult Function(String eventType) walletTabClicked,
    required TResult Function(String eventType) settingsTabClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        transactionsButtonClicked,
    required TResult Function(String eventType, String tab) addNewClicked,
    required TResult Function(String eventType, String source) addNewPlusClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) walletSettingsClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        topUpButtonCLicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) receiveClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) sendClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        buyWithCardClicked,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated) historyClicked,
    required TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)
        addressCopied,
    required TResult Function(String eventType, String walletType, String walletAddress, bool activated)
        shareAddressClicked,
    required TResult Function(String eventType) gotItSendClicked,
    required TResult Function(String eventType) sendAnywayClicked,
    required TResult Function(String eventType, String source) backButtonClicked,
    required TResult Function(String eventType, String walletAddress, String walletType) secret1Validated,
    required TResult Function(String eventType, String walletAddress, String walletType) secret2Validated,
  }) {
    return secret2Validated(eventType, walletAddress, walletType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? connectWalletClicked,
    TResult? Function(String eventType, String source)? connectManuallyClicked,
    TResult? Function(String eventType, String source)? connectWithQrClicked,
    TResult? Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult? Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult? Function(String eventType, String source)? buyNewCardClicked,
    TResult? Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult? Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult? Function(String eventType, String source)? nfcClosed,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult? Function(String eventType, String source, String walletType)? typeSelected,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult? Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult? Function(String eventType)? warningCheckboxClicked,
    TResult? Function(String eventType)? appLockEnabled,
    TResult? Function(String eventType)? notNowLockClicked,
    TResult? Function(String eventType)? walletTabClicked,
    TResult? Function(String eventType)? settingsTabClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult? Function(String eventType, String tab)? addNewClicked,
    TResult? Function(String eventType, String source)? addNewPlusClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult? Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult? Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult? Function(String eventType)? gotItSendClicked,
    TResult? Function(String eventType)? sendAnywayClicked,
    TResult? Function(String eventType, String source)? backButtonClicked,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult? Function(String eventType, String walletAddress, String walletType)? secret2Validated,
  }) {
    return secret2Validated?.call(eventType, walletAddress, walletType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? connectWalletClicked,
    TResult Function(String eventType, String source)? connectManuallyClicked,
    TResult Function(String eventType, String source)? connectWithQrClicked,
    TResult Function(String eventType, String walletType, String source)? qrButtonClicked,
    TResult Function(String eventType, String source, String walletAddress)? qrScanned,
    TResult Function(String eventType, String source)? buyNewCardClicked,
    TResult Function(String eventType, String source, String connectOption)? connectOptionSelected,
    TResult Function(String eventType, String source, String walletAddress)? nfcTapped,
    TResult Function(String eventType, String source)? nfcClosed,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? addressFilled,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? deepLinkClicked,
    TResult Function(String eventType, String source, String walletType)? typeSelected,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? saveToWalletClicked,
    TResult Function(String eventType, String walletType, String walletAddress)? alreadySavedGotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)?
        activatedCheckboxClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? gotItClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress)? fakeWallet,
    TResult Function(String eventType)? warningCheckboxClicked,
    TResult Function(String eventType)? appLockEnabled,
    TResult Function(String eventType)? notNowLockClicked,
    TResult Function(String eventType)? walletTabClicked,
    TResult Function(String eventType)? settingsTabClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)?
        transactionsButtonClicked,
    TResult Function(String eventType, String tab)? addNewClicked,
    TResult Function(String eventType, String source)? addNewPlusClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? walletSettingsClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? topUpButtonCLicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? receiveClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? sendClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? buyWithCardClicked,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? historyClicked,
    TResult Function(String eventType, String source, String walletType, String walletAddress, bool activated)?
        addressCopied,
    TResult Function(String eventType, String walletType, String walletAddress, bool activated)? shareAddressClicked,
    TResult Function(String eventType)? gotItSendClicked,
    TResult Function(String eventType)? sendAnywayClicked,
    TResult Function(String eventType, String source)? backButtonClicked,
    TResult Function(String eventType, String walletAddress, String walletType)? secret1Validated,
    TResult Function(String eventType, String walletAddress, String walletType)? secret2Validated,
    required TResult orElse(),
  }) {
    if (secret2Validated != null) {
      return secret2Validated(eventType, walletAddress, walletType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletClicked value) connectWalletClicked,
    required TResult Function(ConnectManuallyClicked value) connectManuallyClicked,
    required TResult Function(ConnectWitchQrClicked value) connectWithQrClicked,
    required TResult Function(QrButtonClicked value) qrButtonClicked,
    required TResult Function(QrScanned value) qrScanned,
    required TResult Function(BuyNewCardClicked value) buyNewCardClicked,
    required TResult Function(ConnectOptionSelected value) connectOptionSelected,
    required TResult Function(NfcTapped value) nfcTapped,
    required TResult Function(NfcClosed value) nfcClosed,
    required TResult Function(AddressFilled value) addressFilled,
    required TResult Function(DeeplinkClicked value) deepLinkClicked,
    required TResult Function(TypeSelected value) typeSelected,
    required TResult Function(SaveToWalletClicked value) saveToWalletClicked,
    required TResult Function(AlreadySavedGotItClicked value) alreadySavedGotItClicked,
    required TResult Function(ActivatedCheckboxClicked value) activatedCheckboxClicked,
    required TResult Function(GotItClicked value) gotItClicked,
    required TResult Function(FakeWallet value) fakeWallet,
    required TResult Function(WarningCheckboxClicked value) warningCheckboxClicked,
    required TResult Function(AppLockEnabled value) appLockEnabled,
    required TResult Function(NotNowLockClicked value) notNowLockClicked,
    required TResult Function(WalletTabClicked value) walletTabClicked,
    required TResult Function(SettingsTabClicked value) settingsTabClicked,
    required TResult Function(TransactionsButtonClicked value) transactionsButtonClicked,
    required TResult Function(AddNewClicked value) addNewClicked,
    required TResult Function(AddNewPlusClicked value) addNewPlusClicked,
    required TResult Function(WalletSettingsClicked value) walletSettingsClicked,
    required TResult Function(TopUpButtonClicked value) topUpButtonCLicked,
    required TResult Function(ReceiveClicked value) receiveClicked,
    required TResult Function(SendClicked value) sendClicked,
    required TResult Function(BuyWithCardClicked value) buyWithCardClicked,
    required TResult Function(HistoryClicked value) historyClicked,
    required TResult Function(AddressCopied value) addressCopied,
    required TResult Function(ShareAddressClicked value) shareAddressClicked,
    required TResult Function(GotItSendClicked value) gotItSendClicked,
    required TResult Function(SendAnywayClicked value) sendAnywayClicked,
    required TResult Function(BackButtonClicked value) backButtonClicked,
    required TResult Function(Secret1Validated value) secret1Validated,
    required TResult Function(Secret2Validated value) secret2Validated,
  }) {
    return secret2Validated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult? Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult? Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult? Function(QrButtonClicked value)? qrButtonClicked,
    TResult? Function(QrScanned value)? qrScanned,
    TResult? Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult? Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult? Function(NfcTapped value)? nfcTapped,
    TResult? Function(NfcClosed value)? nfcClosed,
    TResult? Function(AddressFilled value)? addressFilled,
    TResult? Function(DeeplinkClicked value)? deepLinkClicked,
    TResult? Function(TypeSelected value)? typeSelected,
    TResult? Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult? Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult? Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult? Function(GotItClicked value)? gotItClicked,
    TResult? Function(FakeWallet value)? fakeWallet,
    TResult? Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult? Function(AppLockEnabled value)? appLockEnabled,
    TResult? Function(NotNowLockClicked value)? notNowLockClicked,
    TResult? Function(WalletTabClicked value)? walletTabClicked,
    TResult? Function(SettingsTabClicked value)? settingsTabClicked,
    TResult? Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult? Function(AddNewClicked value)? addNewClicked,
    TResult? Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult? Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult? Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult? Function(ReceiveClicked value)? receiveClicked,
    TResult? Function(SendClicked value)? sendClicked,
    TResult? Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult? Function(HistoryClicked value)? historyClicked,
    TResult? Function(AddressCopied value)? addressCopied,
    TResult? Function(ShareAddressClicked value)? shareAddressClicked,
    TResult? Function(GotItSendClicked value)? gotItSendClicked,
    TResult? Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult? Function(BackButtonClicked value)? backButtonClicked,
    TResult? Function(Secret1Validated value)? secret1Validated,
    TResult? Function(Secret2Validated value)? secret2Validated,
  }) {
    return secret2Validated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletClicked value)? connectWalletClicked,
    TResult Function(ConnectManuallyClicked value)? connectManuallyClicked,
    TResult Function(ConnectWitchQrClicked value)? connectWithQrClicked,
    TResult Function(QrButtonClicked value)? qrButtonClicked,
    TResult Function(QrScanned value)? qrScanned,
    TResult Function(BuyNewCardClicked value)? buyNewCardClicked,
    TResult Function(ConnectOptionSelected value)? connectOptionSelected,
    TResult Function(NfcTapped value)? nfcTapped,
    TResult Function(NfcClosed value)? nfcClosed,
    TResult Function(AddressFilled value)? addressFilled,
    TResult Function(DeeplinkClicked value)? deepLinkClicked,
    TResult Function(TypeSelected value)? typeSelected,
    TResult Function(SaveToWalletClicked value)? saveToWalletClicked,
    TResult Function(AlreadySavedGotItClicked value)? alreadySavedGotItClicked,
    TResult Function(ActivatedCheckboxClicked value)? activatedCheckboxClicked,
    TResult Function(GotItClicked value)? gotItClicked,
    TResult Function(FakeWallet value)? fakeWallet,
    TResult Function(WarningCheckboxClicked value)? warningCheckboxClicked,
    TResult Function(AppLockEnabled value)? appLockEnabled,
    TResult Function(NotNowLockClicked value)? notNowLockClicked,
    TResult Function(WalletTabClicked value)? walletTabClicked,
    TResult Function(SettingsTabClicked value)? settingsTabClicked,
    TResult Function(TransactionsButtonClicked value)? transactionsButtonClicked,
    TResult Function(AddNewClicked value)? addNewClicked,
    TResult Function(AddNewPlusClicked value)? addNewPlusClicked,
    TResult Function(WalletSettingsClicked value)? walletSettingsClicked,
    TResult Function(TopUpButtonClicked value)? topUpButtonCLicked,
    TResult Function(ReceiveClicked value)? receiveClicked,
    TResult Function(SendClicked value)? sendClicked,
    TResult Function(BuyWithCardClicked value)? buyWithCardClicked,
    TResult Function(HistoryClicked value)? historyClicked,
    TResult Function(AddressCopied value)? addressCopied,
    TResult Function(ShareAddressClicked value)? shareAddressClicked,
    TResult Function(GotItSendClicked value)? gotItSendClicked,
    TResult Function(SendAnywayClicked value)? sendAnywayClicked,
    TResult Function(BackButtonClicked value)? backButtonClicked,
    TResult Function(Secret1Validated value)? secret1Validated,
    TResult Function(Secret2Validated value)? secret2Validated,
    required TResult orElse(),
  }) {
    if (secret2Validated != null) {
      return secret2Validated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$Secret2ValidatedImplToJson(
      this,
    );
  }
}

abstract class Secret2Validated implements AmplitudeEvent {
  const factory Secret2Validated(
      {final String eventType,
      required final String walletAddress,
      required final String walletType}) = _$Secret2ValidatedImpl;

  factory Secret2Validated.fromJson(Map<String, dynamic> json) = _$Secret2ValidatedImpl.fromJson;

  @override
  String get eventType;
  String get walletAddress;
  String get walletType;
  @override
  @JsonKey(ignore: true)
  _$$Secret2ValidatedImplCopyWith<_$Secret2ValidatedImpl> get copyWith => throw _privateConstructorUsedError;
}

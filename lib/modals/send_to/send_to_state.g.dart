// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_to_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendToState on SendToStateBase, Store {
  Computed<bool>? _$isValidReceiverAddressComputed;

  @override
  bool get isValidReceiverAddress => (_$isValidReceiverAddressComputed ??=
          Computed<bool>(() => super.isValidReceiverAddress,
              name: 'SendToStateBase.isValidReceiverAddress'))
      .value;
  Computed<String>? _$formattedAddressComputed;

  @override
  String get formattedAddress => (_$formattedAddressComputed ??=
          Computed<String>(() => super.formattedAddress,
              name: 'SendToStateBase.formattedAddress'))
      .value;
  Computed<String>? _$formattedSelectedCardAddressComputed;

  @override
  String get formattedSelectedCardAddress =>
      (_$formattedSelectedCardAddressComputed ??= Computed<String>(
              () => super.formattedSelectedCardAddress,
              name: 'SendToStateBase.formattedSelectedCardAddress'))
          .value;
  Computed<String>? _$formattedSelectedBarAddressComputed;

  @override
  String get formattedSelectedBarAddress =>
      (_$formattedSelectedBarAddressComputed ??= Computed<String>(
              () => super.formattedSelectedBarAddress,
              name: 'SendToStateBase.formattedSelectedBarAddress'))
          .value;
  Computed<CoinResultModel?>? _$btcComputed;

  @override
  CoinResultModel? get btc =>
      (_$btcComputed ??= Computed<CoinResultModel?>(() => super.btc,
              name: 'SendToStateBase.btc'))
          .value;
  Computed<bool>? _$isConvertedAmountVisibleComputed;

  @override
  bool get isConvertedAmountVisible => (_$isConvertedAmountVisibleComputed ??=
          Computed<bool>(() => super.isConvertedAmountVisible,
              name: 'SendToStateBase.isConvertedAmountVisible'))
      .value;
  Computed<bool>? _$hasCardsComputed;

  @override
  bool get hasCards =>
      (_$hasCardsComputed ??= Computed<bool>(() => super.hasCards,
              name: 'SendToStateBase.hasCards'))
          .value;
  Computed<bool>? _$hasMoreThanOneCardsComputed;

  @override
  bool get hasMoreThanOneCards => (_$hasMoreThanOneCardsComputed ??=
          Computed<bool>(() => super.hasMoreThanOneCards,
              name: 'SendToStateBase.hasMoreThanOneCards'))
      .value;
  Computed<bool>? _$hasMoreThanOneWalletsComputed;

  @override
  bool get hasMoreThanOneWallets => (_$hasMoreThanOneWalletsComputed ??=
          Computed<bool>(() => super.hasMoreThanOneWallets,
              name: 'SendToStateBase.hasMoreThanOneWallets'))
      .value;
  Computed<CardModel>? _$selectedCardComputed;

  @override
  CardModel get selectedCard =>
      (_$selectedCardComputed ??= Computed<CardModel>(() => super.selectedCard,
              name: 'SendToStateBase.selectedCard'))
          .value;
  Computed<BarModel>? _$selectedBarComputed;

  @override
  BarModel get selectedBar =>
      (_$selectedBarComputed ??= Computed<BarModel>(() => super.selectedBar,
              name: 'SendToStateBase.selectedBar'))
          .value;
  Computed<bool>? _$hasPerformedActionComputed;

  @override
  bool get hasPerformedAction => (_$hasPerformedActionComputed ??=
          Computed<bool>(() => super.hasPerformedAction,
              name: 'SendToStateBase.hasPerformedAction'))
      .value;
  Computed<num>? _$totalAmountComputed;

  @override
  num get totalAmount =>
      (_$totalAmountComputed ??= Computed<num>(() => super.totalAmount,
              name: 'SendToStateBase.totalAmount'))
          .value;
  Computed<num>? _$spendableBalanceComputed;

  @override
  num get spendableBalance => (_$spendableBalanceComputed ??= Computed<num>(
          () => super.spendableBalance,
          name: 'SendToStateBase.spendableBalance'))
      .value;
  Computed<String>? _$receiverWalletAddressComputed;

  @override
  String get receiverWalletAddress => (_$receiverWalletAddressComputed ??=
          Computed<String>(() => super.receiverWalletAddress,
              name: 'SendToStateBase.receiverWalletAddress'))
      .value;
  Computed<String>? _$selectedCardAddressComputed;

  @override
  String get selectedCardAddress => (_$selectedCardAddressComputed ??=
          Computed<String>(() => super.selectedCardAddress,
              name: 'SendToStateBase.selectedCardAddress'))
      .value;
  Computed<String>? _$selectedBarAddressComputed;

  @override
  String get selectedBarAddress => (_$selectedBarAddressComputed ??=
          Computed<String>(() => super.selectedBarAddress,
              name: 'SendToStateBase.selectedBarAddress'))
      .value;
  Computed<num>? _$networkFeeComputed;

  @override
  num get networkFee =>
      (_$networkFeeComputed ??= Computed<num>(() => super.networkFee,
              name: 'SendToStateBase.networkFee'))
          .value;
  Computed<num>? _$sendAmountInUsdComputed;

  @override
  num get sendAmountInUsd =>
      (_$sendAmountInUsdComputed ??= Computed<num>(() => super.sendAmountInUsd,
              name: 'SendToStateBase.sendAmountInUsd'))
          .value;
  Computed<num>? _$networkFeeInBtcComputed;

  @override
  num get networkFeeInBtc =>
      (_$networkFeeInBtcComputed ??= Computed<num>(() => super.networkFeeInBtc,
              name: 'SendToStateBase.networkFeeInBtc'))
          .value;
  Computed<bool>? _$isCoverFeeComputed;

  @override
  bool get isCoverFee =>
      (_$isCoverFeeComputed ??= Computed<bool>(() => super.isCoverFee,
              name: 'SendToStateBase.isCoverFee'))
          .value;
  Computed<bool>? _$isInputtedAmountBiggerTotalComputed;

  @override
  bool get isInputtedAmountBiggerTotal =>
      (_$isInputtedAmountBiggerTotalComputed ??= Computed<bool>(
              () => super.isInputtedAmountBiggerTotal,
              name: 'SendToStateBase.isInputtedAmountBiggerTotal'))
          .value;
  Computed<HistoryPageStore>? _$historyPageStoreComputed;

  @override
  HistoryPageStore get historyPageStore => (_$historyPageStoreComputed ??=
          Computed<HistoryPageStore>(() => super.historyPageStore,
              name: 'SendToStateBase.historyPageStore'))
      .value;
  Computed<AccelerometerStore>? _$accelerometerStoreComputed;

  @override
  AccelerometerStore get accelerometerStore => (_$accelerometerStoreComputed ??=
          Computed<AccelerometerStore>(() => super.accelerometerStore,
              name: 'SendToStateBase.accelerometerStore'))
      .value;
  Computed<num>? _$balanceAfterComputed;

  @override
  num get balanceAfter =>
      (_$balanceAfterComputed ??= Computed<num>(() => super.balanceAfter,
              name: 'SendToStateBase.balanceAfter'))
          .value;
  Computed<num>? _$maxTotalComputed;

  @override
  num get maxTotal => (_$maxTotalComputed ??=
          Computed<num>(() => super.maxTotal, name: 'SendToStateBase.maxTotal'))
      .value;
  Computed<num?>? _$btcPriceComputed;

  @override
  num? get btcPrice =>
      (_$btcPriceComputed ??= Computed<num?>(() => super.btcPrice,
              name: 'SendToStateBase.btcPrice'))
          .value;

  late final _$_selectedIndexAtom =
      Atom(name: 'SendToStateBase._selectedIndex', context: context);

  int get selectedIndex {
    _$_selectedIndexAtom.reportRead();
    return super._selectedIndex;
  }

  @override
  int get _selectedIndex => selectedIndex;

  @override
  set _selectedIndex(int value) {
    _$_selectedIndexAtom.reportWrite(value, super._selectedIndex, () {
      super._selectedIndex = value;
    });
  }

  late final _$_outputAddressAtom =
      Atom(name: 'SendToStateBase._outputAddress', context: context);

  String get outputAddress {
    _$_outputAddressAtom.reportRead();
    return super._outputAddress;
  }

  @override
  String get _outputAddress => outputAddress;

  @override
  set _outputAddress(String value) {
    _$_outputAddressAtom.reportWrite(value, super._outputAddress, () {
      super._outputAddress = value;
    });
  }

  late final _$_amountAtom =
      Atom(name: 'SendToStateBase._amount', context: context);

  num get amount {
    _$_amountAtom.reportRead();
    return super._amount;
  }

  @override
  num get _amount => amount;

  @override
  set _amount(num value) {
    _$_amountAtom.reportWrite(value, super._amount, () {
      super._amount = value;
    });
  }

  late final _$_isUseMaxClickedAtom =
      Atom(name: 'SendToStateBase._isUseMaxClicked', context: context);

  bool get isUseMaxClicked {
    _$_isUseMaxClickedAtom.reportRead();
    return super._isUseMaxClicked;
  }

  @override
  bool get _isUseMaxClicked => isUseMaxClicked;

  @override
  set _isUseMaxClicked(bool value) {
    _$_isUseMaxClickedAtom.reportWrite(value, super._isUseMaxClicked, () {
      super._isUseMaxClicked = value;
    });
  }

  late final _$_currencyAtom =
      Atom(name: 'SendToStateBase._currency', context: context);

  Currency get currency {
    _$_currencyAtom.reportRead();
    return super._currency;
  }

  @override
  Currency get _currency => currency;

  @override
  set _currency(Currency value) {
    _$_currencyAtom.reportWrite(value, super._currency, () {
      super._currency = value;
    });
  }

  late final _$shouldValidateReceiverAddressAtom = Atom(
      name: 'SendToStateBase.shouldValidateReceiverAddress', context: context);

  @override
  bool get shouldValidateReceiverAddress {
    _$shouldValidateReceiverAddressAtom.reportRead();
    return super.shouldValidateReceiverAddress;
  }

  @override
  set shouldValidateReceiverAddress(bool value) {
    _$shouldValidateReceiverAddressAtom
        .reportWrite(value, super.shouldValidateReceiverAddress, () {
      super.shouldValidateReceiverAddress = value;
    });
  }

  late final _$nextButtonStatusAtom =
      Atom(name: 'SendToStateBase.nextButtonStatus', context: context);

  @override
  bool get nextButtonStatus {
    _$nextButtonStatusAtom.reportRead();
    return super.nextButtonStatus;
  }

  @override
  set nextButtonStatus(bool value) {
    _$nextButtonStatusAtom.reportWrite(value, super.nextButtonStatus, () {
      super.nextButtonStatus = value;
    });
  }

  late final _$onToggleCurrencyAsyncAction =
      AsyncAction('SendToStateBase.onToggleCurrency', context: context);

  @override
  Future<void> onToggleCurrency() {
    return _$onToggleCurrencyAsyncAction.run(() => super.onToggleCurrency());
  }

  late final _$SendToStateBaseActionController =
      ActionController(name: 'SendToStateBase', context: context);

  @override
  void onAddressChanges(String val) {
    final _$actionInfo = _$SendToStateBaseActionController.startAction(
        name: 'SendToStateBase.onAddressChanges');
    try {
      return super.onAddressChanges(val);
    } finally {
      _$SendToStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateReceiverAddress() {
    final _$actionInfo = _$SendToStateBaseActionController.startAction(
        name: 'SendToStateBase.validateReceiverAddress');
    try {
      return super.validateReceiverAddress();
    } finally {
      _$SendToStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedIndex(int a) {
    final _$actionInfo = _$SendToStateBaseActionController.startAction(
        name: 'SendToStateBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(a);
    } finally {
      _$SendToStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOutputAddress(String a) {
    final _$actionInfo = _$SendToStateBaseActionController.startAction(
        name: 'SendToStateBase.setOutputAddress');
    try {
      return super.setOutputAddress(a);
    } finally {
      _$SendToStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAmount(String a) {
    final _$actionInfo = _$SendToStateBaseActionController.startAction(
        name: 'SendToStateBase.setAmount');
    try {
      return super.setAmount(a);
    } finally {
      _$SendToStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideMaxValue() {
    final _$actionInfo = _$SendToStateBaseActionController.startAction(
        name: 'SendToStateBase.hideMaxValue');
    try {
      return super.hideMaxValue();
    } finally {
      _$SendToStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num onUseMax() {
    final _$actionInfo = _$SendToStateBaseActionController.startAction(
        name: 'SendToStateBase.onUseMax');
    try {
      return super.onUseMax();
    } finally {
      _$SendToStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shouldValidateReceiverAddress: ${shouldValidateReceiverAddress},
nextButtonStatus: ${nextButtonStatus},
isValidReceiverAddress: ${isValidReceiverAddress},
formattedAddress: ${formattedAddress},
formattedSelectedCardAddress: ${formattedSelectedCardAddress},
formattedSelectedBarAddress: ${formattedSelectedBarAddress},
btc: ${btc},
isConvertedAmountVisible: ${isConvertedAmountVisible},
hasCards: ${hasCards},
hasMoreThanOneCards: ${hasMoreThanOneCards},
hasMoreThanOneWallets: ${hasMoreThanOneWallets},
selectedCard: ${selectedCard},
selectedBar: ${selectedBar},
hasPerformedAction: ${hasPerformedAction},
totalAmount: ${totalAmount},
spendableBalance: ${spendableBalance},
receiverWalletAddress: ${receiverWalletAddress},
selectedCardAddress: ${selectedCardAddress},
selectedBarAddress: ${selectedBarAddress},
networkFee: ${networkFee},
sendAmountInUsd: ${sendAmountInUsd},
networkFeeInBtc: ${networkFeeInBtc},
isCoverFee: ${isCoverFee},
isInputtedAmountBiggerTotal: ${isInputtedAmountBiggerTotal},
historyPageStore: ${historyPageStore},
accelerometerStore: ${accelerometerStore},
balanceAfter: ${balanceAfter},
maxTotal: ${maxTotal},
btcPrice: ${btcPrice}
    ''';
  }
}

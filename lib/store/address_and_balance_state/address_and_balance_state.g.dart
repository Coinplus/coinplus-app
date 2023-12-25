// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_and_balance_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressState on _AddressState, Store {
  late final _$btcAddressControllerAtom = Atom(name: '_AddressState.btcAddressController', context: context);

  @override
  TextEditingController get btcAddressController {
    _$btcAddressControllerAtom.reportRead();
    return super.btcAddressController;
  }

  @override
  set btcAddressController(TextEditingController value) {
    _$btcAddressControllerAtom.reportWrite(value, super.btcAddressController, () {
      super.btcAddressController = value;
    });
  }

  late final _$isAddressVisibleAtom = Atom(name: '_AddressState.isAddressVisible', context: context);

  @override
  bool get isAddressVisible {
    _$isAddressVisibleAtom.reportRead();
    return super.isAddressVisible;
  }

  @override
  set isAddressVisible(bool value) {
    _$isAddressVisibleAtom.reportWrite(value, super.isAddressVisible, () {
      super.isAddressVisible = value;
    });
  }

  late final _$setBTCAddressAsyncAction = AsyncAction('_AddressState.setBTCAddress', context: context);

  @override
  Future<void> setBTCAddress(String address) {
    return _$setBTCAddressAsyncAction.run(() => super.setBTCAddress(address));
  }

  late final _$_AddressStateActionController = ActionController(name: '_AddressState', context: context);

  @override
  void addressVisibility() {
    final _$actionInfo = _$_AddressStateActionController.startAction(name: '_AddressState.addressVisibility');
    try {
      return super.addressVisibility();
    } finally {
      _$_AddressStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
btcAddressController: ${btcAddressController},
isAddressVisible: ${isAddressVisible}
    ''';
  }
}

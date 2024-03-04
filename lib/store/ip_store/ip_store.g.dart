// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IpStore on _IpStore, Store {
  Computed<bool>? _$rampCountryStatusComputed;

  @override
  bool get rampCountryStatus => (_$rampCountryStatusComputed ??=
          Computed<bool>(() => super.rampCountryStatus, name: '_IpStore.rampCountryStatus'))
      .value;
  Computed<bool>? _$rampRegionStatusComputed;

  @override
  bool get rampRegionStatus =>
      (_$rampRegionStatusComputed ??= Computed<bool>(() => super.rampRegionStatus, name: '_IpStore.rampRegionStatus'))
          .value;

  late final _$myIpAddressAtom = Atom(name: '_IpStore.myIpAddress', context: context);

  @override
  String get myIpAddress {
    _$myIpAddressAtom.reportRead();
    return super.myIpAddress;
  }

  @override
  set myIpAddress(String value) {
    _$myIpAddressAtom.reportWrite(value, super.myIpAddress, () {
      super.myIpAddress = value;
    });
  }

  late final _$countryStatusAtom = Atom(name: '_IpStore.countryStatus', context: context);

  @override
  bool get countryStatus {
    _$countryStatusAtom.reportRead();
    return super.countryStatus;
  }

  @override
  set countryStatus(bool value) {
    _$countryStatusAtom.reportWrite(value, super.countryStatus, () {
      super.countryStatus = value;
    });
  }

  late final _$regionStatusAtom = Atom(name: '_IpStore.regionStatus', context: context);

  @override
  bool get regionStatus {
    _$regionStatusAtom.reportRead();
    return super.regionStatus;
  }

  @override
  set regionStatus(bool value) {
    _$regionStatusAtom.reportWrite(value, super.regionStatus, () {
      super.regionStatus = value;
    });
  }

  late final _$getIpAsyncAction = AsyncAction('_IpStore.getIp', context: context);

  @override
  Future<void> getIp() {
    return _$getIpAsyncAction.run(() => super.getIp());
  }

  late final _$saveCountryStatusAsyncAction = AsyncAction('_IpStore.saveCountryStatus', context: context);

  @override
  Future<void> saveCountryStatus({required bool value}) {
    return _$saveCountryStatusAsyncAction.run(() => super.saveCountryStatus(value: value));
  }

  late final _$getCountryStatusAsyncAction = AsyncAction('_IpStore.getCountryStatus', context: context);

  @override
  Future<bool> getCountryStatus() {
    return _$getCountryStatusAsyncAction.run(() => super.getCountryStatus());
  }

  late final _$saveRegionStatusAsyncAction = AsyncAction('_IpStore.saveRegionStatus', context: context);

  @override
  Future<void> saveRegionStatus({required bool value}) {
    return _$saveRegionStatusAsyncAction.run(() => super.saveRegionStatus(value: value));
  }

  late final _$getRegionStatusAsyncAction = AsyncAction('_IpStore.getRegionStatus', context: context);

  @override
  Future<bool> getRegionStatus() {
    return _$getRegionStatusAsyncAction.run(() => super.getRegionStatus());
  }

  late final _$updateStatusAsyncAction = AsyncAction('_IpStore.updateStatus', context: context);

  @override
  Future<void> updateStatus() {
    return _$updateStatusAsyncAction.run(() => super.updateStatus());
  }

  @override
  String toString() {
    return '''
myIpAddress: ${myIpAddress},
countryStatus: ${countryStatus},
regionStatus: ${regionStatus},
rampCountryStatus: ${rampCountryStatus},
rampRegionStatus: ${rampRegionStatus}
    ''';
  }
}

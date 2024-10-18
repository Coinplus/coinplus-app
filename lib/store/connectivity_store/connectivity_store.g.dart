// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectivityStore on _ConnectivityStore, Store {
  late final _$connectionStatusAtom = Atom(name: '_ConnectivityStore.connectionStatus', context: context);

  @override
  ConnectivityResult get connectionStatus {
    _$connectionStatusAtom.reportRead();
    return super.connectionStatus;
  }

  @override
  set connectionStatus(ConnectivityResult value) {
    _$connectionStatusAtom.reportWrite(value, super.connectionStatus, () {
      super.connectionStatus = value;
    });
  }

  late final _$initConnectivityAsyncAction = AsyncAction('_ConnectivityStore.initConnectivity', context: context);

  @override
  Future<void> initConnectivity() {
    return _$initConnectivityAsyncAction.run(() => super.initConnectivity());
  }

  late final _$updateConnectionStatusAsyncAction =
      AsyncAction('_ConnectivityStore.updateConnectionStatus', context: context);

  @override
  Future<void> updateConnectionStatus(ConnectivityResult result) {
    return _$updateConnectionStatusAsyncAction.run(() => super.updateConnectionStatus(result));
  }

  @override
  String toString() {
    return '''
connectionStatus: ${connectionStatus}
    ''';
  }
}

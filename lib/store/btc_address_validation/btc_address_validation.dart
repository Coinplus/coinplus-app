
import 'package:mobx/mobx.dart';

part 'btc_address_validation.g.dart';

class BitcoinStore = _BitcoinStore with _$BitcoinStore;

abstract class _BitcoinStore with Store {
  @observable
  String bitcoinAddress = '';

  @computed
  bool get isValidBitcoinAddress {
    final regExp = RegExp(r'^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$');
    return regExp.hasMatch(bitcoinAddress);
  }
}

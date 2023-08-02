import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/card_model/card_model.dart';

part 'balance_store.g.dart';

class BalanceStore = _BalanceStore with _$BalanceStore;

abstract class _BalanceStore with Store {
  @observable
  String address = '';

  @computed
  String get btcAddress => address;

  @action
  Future<String> getStringFromLocalStorage(String key) async {
    final prefs = await SharedPreferences.getInstance();
    address = prefs.getString(key) ?? '';
    return prefs.getString(key) ?? '';
  }

  @action
  Future<CardModel> fetchCardInfo() async {
    await getStringFromLocalStorage('address');
    final response = await http.get(
      Uri.parse(
        'https://api.blockcypher.com/v1/btc/main/addrs/$btcAddress/balance',
      ),
    );
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      final cardInfo = CardModel.fromJson(data);
      return cardInfo;
    } else {
      throw Exception('Failed to fetch card info');
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/bar_model/bar_model.dart';
import '../models/card_model/card_model.dart';
import '../models/eth_card_model/eth_card_model.dart';

class Preferences {
  Preferences._();

  static const cards = 'cards';
  static const ethCards = 'ethCards';
  static const bars = 'bars';
  static const hasShownWallet = 'bools';
  static const isActivatedBool = 'isActivatedBool';
  static const switchKey = 'switchKey';
}

class StorageUtils {
  StorageUtils._();

  static Future<SharedPreferences> get sharedInstance =>
      SharedPreferences.getInstance();

  static Future<List<CardModel>> getCards() async {
    final cardsJson =
        await _read<List>(Preferences.cards) ?? <Map<String, dynamic>>[];

    final cards = <CardModel>[];
    for (final element in cardsJson) {
      cards.add(
        CardModel.fromJson(element),
      );
    }

    return cards;
  }

  static Future<List<EthCardModel>> getEthCards() async {
    final cardsJson =
        await _read<List>(Preferences.ethCards) ?? <Map<String, dynamic>>[];

    final cards = <EthCardModel>[];
    for (final element in cardsJson) {
      cards.add(
        EthCardModel.fromJson(element),
      );
    }

    return cards;
  }

  static Future<List<BarModel>> getBars() async {
    final barJson =
        await _read<List>(Preferences.bars) ?? <Map<String, dynamic>>[];

    final bars = <BarModel>[];
    for (final element in barJson) {
      bars.add(
        BarModel.fromJson(element),
      );
    }

    return bars;
  }

  static Future<void> replaceCard(String address, CardModel newCard) async {
    final cards = await getCards();

    final cardIndex = cards.indexWhere((card) => card.address == address);
    if (cardIndex != -1) {
      cards[cardIndex] = newCard;
      await _save(Preferences.cards, cards.toSet().toList());
    }
  }

  static Future<void> replaceEthCard(
    String address,
    EthCardModel newCard,
  ) async {
    final cards = await getEthCards();

    final cardIndex = cards.indexWhere((card) => card.address == address);
    if (cardIndex != -1) {
      cards[cardIndex] = newCard;
      await _save(Preferences.ethCards, cards.toSet().toList());
    }
  }

  static Future<void> replaceBar(String address, BarModel newBar) async {
    final bars = await getBars();

    final barIndex = bars.indexWhere((bar) => bar.address == address);
    if (barIndex != -1) {
      bars[barIndex] = newBar;
      await _save(Preferences.bars, bars.toSet().toList());
    }
  }

  static Future<void> saveUpdatedCards(List<CardModel> updatedCards) async {
    final serializedCards = updatedCards.map((card) => card.toJson()).toList();
    await _save(Preferences.cards, serializedCards);
  }

  static Future<void> saveUpdatedBars(List<BarModel> updatedCards) async {
    final serializedCards = updatedCards.map((card) => card.toJson()).toList();
    await _save(Preferences.bars, serializedCards);
  }

  static Future<void> addCard(CardModel card) async {
    final cards = await getCards();
    cards.add(card);
    await _save(Preferences.cards, cards.toSet().toList());
  }

  static Future<void> addEthCard(EthCardModel card) async {
    final cards = await getEthCards();
    cards.add(card);
    await _save(Preferences.ethCards, cards.toSet().toList());
  }

  static Future<void> addBar(BarModel bar) async {
    final bars = await getBars();
    bars.add(bar);
    await _save(Preferences.bars, bars.toSet().toList());
  }

  static Future<void> removeCard(String address) async {
    final cards = await getCards();
    cards.removeWhere((card) => card.address == address);
    await _save(Preferences.cards, cards.toSet().toList());
  }

  static Future<void> removeEthCard(String address) async {
    final cards = await getEthCards();
    cards.removeWhere((card) => card.address == address);
    await _save(Preferences.ethCards, cards.toSet().toList());
  }

  static Future<void> removeBar(String address) async {
    final bars = await getBars();
    bars.removeWhere((bar) => bar.address == address);
    await _save(Preferences.bars, bars.toSet().toList());
  }

  static Future<bool> getBool() async {
    final prefs = await sharedInstance;
    return prefs.getBool(Preferences.hasShownWallet) ?? false;
  }

  static Future<void> setBool({required bool value}) async {
    final prefs = await sharedInstance;
    await prefs.setBool(Preferences.hasShownWallet, value);
  }

  Future<void> saveSwitchValue({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Preferences.switchKey, value);
  }

  Future<bool?> readSwitchValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Preferences.switchKey);
  }

  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    final prefs = await sharedInstance;
    await prefs.setString(key, value);
  }

  static Future<String?> getString({required String key}) async {
    final prefs = await sharedInstance;
    return prefs.getString(key);
  }

  static Future<void> setInt({required String key, required int value}) async {
    final prefs = await sharedInstance;
    await prefs.setInt(key, value);
  }

  static Future<int?> getInt({required String key}) async {
    final prefs = await sharedInstance;
    return prefs.getInt(key);
  }

  /// Private helper functions
  static Future<T?> _read<T>(String key) async {
    final prefs = await sharedInstance;
    final value = prefs.getString(key);
    return value == null ? null : json.decode(value) as T;
  }

  static Future<void> _save(String key, Object value) async {
    final prefs = await sharedInstance;
    await prefs.setString(key, json.encode(value));
  }

  static Future<void> saveWifSecurely(String wif) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'wif_key', value: wif);
  }

  static Future<String?> getWifSecurely() async {
    const storage = FlutterSecureStorage();
    return storage.read(key: 'wif_key');
  }

  static Future<void> removeAddressFromMap(String addressToRemove) async {
    final prefs = await SharedPreferences.getInstance();
    final map = prefs.getString('lastRefreshedMap');

    if (map != null) {
      final decodedMap = json.decode(map);
      final lastRefreshedMap = Map<String, String>.from(decodedMap);

      if (lastRefreshedMap.containsKey(addressToRemove)) {
        lastRefreshedMap.remove(addressToRemove);
        final updatedMap = json.encode(lastRefreshedMap);
        await prefs.setString('lastRefreshedMap', updatedMap);
      }
    }
  }

  static Future<void> clear() async {
    final prefs = await sharedInstance;
    await prefs.reload();
    await Future.wait([
      prefs.remove('cards'),
      prefs.remove('ethCards'),
      prefs.remove('bars'),
      prefs.remove('bools'),
      prefs.remove('lastRefreshedMap'),
      prefs.remove('isActivatedBool'),
      prefs.remove('switchKey'),
      prefs.remove('show_modal'),
      prefs.remove('package_info'),
      prefs.remove('walletOpenedFirstTime'),
      prefs.remove('favoriteCoins'),
    ]);
  }
}

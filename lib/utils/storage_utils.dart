import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/bar_model/bar_model.dart';
import '../models/card_model/card_model.dart';

class Preferences {
  Preferences._();

  static const cards = 'cards';
  static const bars = 'bars';
  static const bools = 'bools';
}

class StorageUtils {
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

  static Future<List<BarModel>> getBars() async {
    final barsJson =
        await _read<List>(Preferences.bars) ?? <Map<String, dynamic>>[];

    final bars = <BarModel>[];
    for (final element in barsJson) {
      bars.add(
        BarModel.fromJson(element),
      );
    }

    return bars;
  }

  static Future<void> addCard(CardModel card) async {
    final cards = await getCards();
    cards.add(card);
    await _save(Preferences.cards, cards.toSet().toList());
  }

  static Future<void> addBar(BarModel bar) async {
    final bars = await getBars();
    bars.add(bar);
    await _save(Preferences.bars, bars.toSet().toList());
  }

  static Future<void> removeCard(String address) async {
    final cards = (await _read<List<CardModel>>(Preferences.cards) ??
        <CardModel>[])
      ..removeWhere((e) => e.address == address);
    await _save(Preferences.cards, cards.toList());
  }

  static Future<void> removeBar(String address) async {
    final cards = (await _read<List<BarModel>>(Preferences.cards) ??
        <BarModel>[])
      ..removeWhere((e) => e.address == address);
    await _save(Preferences.bars, cards.toList());
  }

  static Future<bool> getBool() async {
    final prefs = await sharedInstance;
    return prefs.getBool(Preferences.bools) ?? false;
  }

  static Future<void> setBool({required bool value}) async {
    final prefs = await sharedInstance;
    await prefs.setBool(Preferences.bools, value);
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

  static Future<void> _remove(String key) async {
    final prefs = await sharedInstance;
    await prefs.remove(key);
  }

  static Future<void> clear() async {
    final prefs = await sharedInstance;
    await prefs.clear();
  }

  // ignore: avoid_positional_boolean_parameters
  static Future<void> _setBool(String key, bool value) async {
    final prefs = await sharedInstance;

    await prefs.setBool(key, value);
  }

  static Future<bool> _getBool(String key) async {
    final prefs = await sharedInstance;
    return prefs.getBool(key) ?? false;
  }

  static Future<void> _setString(String key, String value) async {
    final prefs = await sharedInstance;
    await prefs.setString(key, value);
  }

  static Future<String?> _getString(String key) async {
    final prefs = await sharedInstance;
    return prefs.getString(key);
  }
}

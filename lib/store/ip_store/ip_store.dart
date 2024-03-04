import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/ramp_countries.dart';
import '../../http/interceptors/api_keys.dart';

part 'ip_store.g.dart';

class IpStore = _IpStore with _$IpStore;

abstract class _IpStore with Store {
  _IpStore() {
    getIp();
  }

  @observable
  String myIpAddress = '';

  @observable
  bool countryStatus = false;

  @observable
  bool regionStatus = false;

  final Dio _dio = Dio()..interceptors.add(LogInterceptor(responseBody: true));

  @action
  Future<void> getIp() async {
    try {
      final responseIp = await _dio.get('https://api.ipify.org/');
      if (responseIp.statusCode == 200) {
        final responseDataIp = responseIp.data;
        myIpAddress = responseDataIp.toString();

        final responseLocation = await _dio.get('http://ip-api.com/json/$myIpAddress');
        if (responseLocation.statusCode == 200) {
          final Map<String, dynamic> responseDataLocation = responseLocation.data;
          final currentCountry = responseDataLocation['country'];

          countryStatus = rampRegions.contains(currentCountry);

          final currentRegionName = responseDataLocation['regionName'];
          regionStatus = rampUsUnavailableStates.contains(currentRegionName);

          await saveCountryStatus(value: countryStatus);
          await saveRegionStatus(value: regionStatus);
        } else {
          log('Failed to get location. Status code: ${responseLocation.statusCode}');
        }
      } else {
        log('Failed to get IP address. Status code: ${responseIp.statusCode}');
      }
    } catch (error) {
      log('Error during HTTP request: $error');
    }
  }

  Future<void> patchTransactions({required String address}) async {
    final headers = {
      'x-api-key': coinStatsApiKey,
      'Content-Type': 'application/json',
    };

    try {
      await _dio.patch(
        'https://openapiv1.coinstats.app/wallet/transactions?address=$address&connectionId=bitcoin',
        options: Options(headers: headers),
      );
    } catch (e) {
      log('Error: $e');
    }
  }

  @action
  Future<void> saveCountryStatus({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('countryStatus', value);
  }

  @action
  Future<bool> getCountryStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('countryStatus') ?? false;
  }

  @action
  Future<void> saveRegionStatus({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('regionStatus', value);
  }

  @action
  Future<bool> getRegionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('regionStatus') ?? false;
  }

  @action
  Future<void> updateStatus() async {
    countryStatus = await getCountryStatus();
    regionStatus = await getRegionStatus();
  }

  @computed
  bool get rampCountryStatus => countryStatus;

  @computed
  bool get rampRegionStatus => regionStatus;
}

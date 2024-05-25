//import 'dart:developer';

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../constants/flavor_type.dart';
import '../http/dio.dart';
import '../http/interceptors/api_interceptor.dart';
import '../http/interceptors/coin_stats_auth_interceptor.dart';
import '../http/interceptors/mempool_interceptor.dart';
import '../http/interceptors/utxo_interceptor.dart';
import '../store/store.dart';
import 'flavor_service.dart';

void registerGetIt(Flavor flavorMode) {
  utxoDio.interceptors.addAll(
    <Interceptor>[
      UTXOInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (res) {
          log(res.toString(), name: 'BE');
        },
      ),
    ],
  );
  broadcastDio.interceptors.addAll(
    <Interceptor>[
      BlockStreamInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (res) {
          log(res.toString(), name: 'BE');
        },
      ),
    ],
  );
  coinStatsDio.interceptors.addAll(
    <Interceptor>[
      CoinStatsAuthInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (res) {
          log(res.toString(), name: 'BE');
        },
      ),
    ],
  );
  mempoolDio.interceptors.addAll(
    <Interceptor>[
      MempoolInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (res) {
          log(res.toString(), name: 'BE');
        },
      ),
    ],
  );
  GetIt.I.registerLazySingleton<FlavorService>(
    () => FlavorService(
      flavor: flavorMode,
    ),
  );
  registerStoreGetIt();
}

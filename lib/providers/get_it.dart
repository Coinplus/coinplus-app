import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../constants/flavor_type.dart';
import '../http/dio.dart';
import '../http/interceptors/api_interceptor.dart';
import '../store/store.dart';
import 'flavor_service.dart';

void registerGetIt(Flavor flavorMode) {
  dio.interceptors.addAll(
    <Interceptor>[
      ApiInterceptor(),
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

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../constants/flavor_type.dart';
import '../http/dio.dart';
import '../http/interceptors/api_interceptor.dart';
import '../http/interceptors/auth_interceptor.dart';
import '../http/repositories/auth_repository.dart';
import '../store/store.dart';
import 'flavor_service.dart';

void registerGetIt(Flavor flavorMode) {
  dio.interceptors.addAll(
    <Interceptor>[
      ApiInterceptor(),
      AuthInterceptor(),
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

  // Repositories
  GetIt.I.registerSingleton(AuthRepository());

  registerStoreGetIt();
}

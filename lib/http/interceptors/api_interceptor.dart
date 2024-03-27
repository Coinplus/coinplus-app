import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../providers/flavor_service.dart';
import 'api_keys.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options
      ..baseUrl = GetIt.I<FlavorService>().config.apiUrl
      ..headers = {'X-API-KEY': coinStatsApiKey};

    if (options.path.contains('/coins')) {
      options.baseUrl = GetIt.I<FlavorService>().config.coinsUrl;
    }

    if (options.method == 'PATCH') {
      options.baseUrl = GetIt.I<FlavorService>().config.coinsUrl;
    }

    if (options.path.contains('/markets')) {
      options.baseUrl = GetIt.I<FlavorService>().config.coinsUrl;
    }

    if (options.path.contains('/wallet')) {
      options.baseUrl = GetIt.I<FlavorService>().config.coinsUrl;
    }
    if (options.path.contains('/wallet/status')) {
      options.baseUrl = GetIt.I<FlavorService>().config.coinsUrl;
    }
    if (options.data is Map) {
      (options.data as Map<dynamic, dynamic>).removeWhere((k, v) => v == null);
    }

    return handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    log('Api error : $err');
    return handler.next(err);
  }
}

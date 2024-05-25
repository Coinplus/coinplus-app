import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../providers/flavor_service.dart';

class BlockStreamInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options
      ..baseUrl = GetIt.I<FlavorService>().config.apiUrl
      ..headers = {
        'Content-Type': 'text/plain',
      };

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

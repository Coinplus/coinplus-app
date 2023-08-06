import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../providers/flavor_service.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = GetIt.I<FlavorService>().config.apiUrl;
    if (options.path.contains('/coins/markets')) {
      options.baseUrl = GetIt.I<FlavorService>().config.coinsUrl;
    }
    if (options.data is Map) {
      /// remove nulls from request body [options.data]
      (options.data as Map<dynamic, dynamic>).removeWhere((k, v) => v == null);
    }
    return handler.next(options);
  }
}

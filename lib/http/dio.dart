import 'package:dio/dio.dart';

final options = BaseOptions(
  connectTimeout: const Duration(milliseconds: 240000),
  receiveTimeout: const Duration(milliseconds: 240000),
);

final mempoolDio = Dio(options)..transformer = BackgroundTransformer();
final utxoDio = Dio(options)..transformer = BackgroundTransformer();
final coinStatsDio = Dio(options)..transformer = BackgroundTransformer();

CancelToken cancelToken = CancelToken();

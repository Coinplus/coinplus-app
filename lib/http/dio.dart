import 'package:dio/dio.dart';

final options = BaseOptions(
  connectTimeout: const Duration(milliseconds: 240000),
  receiveTimeout: const Duration(milliseconds: 240000),
);

final dio = Dio(options)..transformer = BackgroundTransformer();

CancelToken cancelToken = CancelToken();

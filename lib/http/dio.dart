import 'package:dio/dio.dart';

import 'dio_flutter_transformer.dart';

final options = BaseOptions(
  connectTimeout: const Duration(milliseconds: 240000),
  receiveTimeout: const Duration(milliseconds: 240000),
);

final dio = Dio(options)..transformer = FlutterTransformer();

CancelToken cancelToken = CancelToken();

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/tx_fee/tx_fee_dto.dart';
import '../dio.dart';

part 'mempool_repo.g.dart';

class _Paths {
  static const fee = '/api/v1/fees/recommended';
}

final mempoolRepo = MempoolClient(mempoolDio);

@RestApi()
abstract class MempoolClient {
  factory MempoolClient(Dio dio, {String baseUrl}) = _MempoolClient;

  @GET(_Paths.fee)
  Future<TxFeeDto> getFees();
}

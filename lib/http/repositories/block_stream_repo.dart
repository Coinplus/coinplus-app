import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/map_result/map_result_dto.dart';
import '../dio.dart';

part 'block_stream_repo.g.dart';

class _Paths {
  static const balance = '/balance?active=|{addresses}';
}

final balanceRepo = BalanceClient(utxoDio);

@RestApi()
abstract class BalanceClient {
  factory BalanceClient(Dio dio, {String baseUrl}) = _BalanceClient;

  @GET(_Paths.balance)
  Future<MapResult> getCards({
    @Path() required String addresses,
  });

  @GET(_Paths.balance)
  Future<MapResult> getBars({
    @Path() required String addresses,
  });
}

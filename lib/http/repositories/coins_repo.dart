import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/card_model/card_model.dart';

part 'coins_repo.g.dart';

class _Paths {
  static const balance = '/{coinName}/main/addrs/{address}/balance';
}

@RestApi()
abstract class CoinsClient {
  factory CoinsClient(Dio dio, {String baseUrl}) = _CoinsClient;

  @GET(_Paths.balance)
  Future<CardModel> getCard({
    @Path() required String coinName,
    @Path() required String address,
  });
}

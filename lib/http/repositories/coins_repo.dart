import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/bar_model/bar_model.dart';
import '../../models/card_model/card_model.dart';
import '../../models/coin_dto/coin_dto.dart';

part 'coins_repo.g.dart';

class _Paths {
  static const balance = '/{coinName}/main/addrs/{address}/balance';
  static const coins = '/coins?skip=0&limit=1&currency=USD';
}

@RestApi()
abstract class CoinsClient {
  factory CoinsClient(Dio dio, {String baseUrl}) = _CoinsClient;

  @GET(_Paths.balance)
  Future<CardModel> getCard({
    @Path() required String coinName,
    @Path() required String address,
  });
  @GET(_Paths.balance)
  Future<BarModel> getBar({
    @Path() required String coinName,
    @Path() required String address,
  });

  @GET(_Paths.coins)
  Future<CoinDto> getCoins();
}

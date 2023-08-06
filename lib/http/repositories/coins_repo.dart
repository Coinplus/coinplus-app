import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/card_model/card_model.dart';
import '../../models/coin_dto/coin_dto.dart';

part 'coins_repo.g.dart';

class _Paths {
  static const balance = '/{coinName}/main/addrs/{address}/balance';
  static const coins =
      '/coins/markets?vs_currency=usd&ids=bitcoin&order=market_cap_desc&per_page=250&page=1&sparkline=false&price_change_percentage=24h&locale=en&precision=18';
}

@RestApi()
abstract class CoinsClient {
  factory CoinsClient(Dio dio, {String baseUrl}) = _CoinsClient;

  @GET(_Paths.balance)
  Future<CardModel> getCard({
    @Path() required String coinName,
    @Path() required String address,
  });

  @GET(_Paths.coins)
  Future<List<CoinDto>> getCoins();
}

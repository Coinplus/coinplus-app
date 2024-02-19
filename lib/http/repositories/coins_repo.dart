import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/bar_model/bar_model.dart';
import '../../models/card_model/card_model.dart';
import '../../models/coins_dto/coin_model.dart';
import '../../models/history_model/transaction_model.dart';
import '../../models/market_cap_dto/market_cap_dto.dart';

part 'coins_repo.g.dart';

class _Paths {
  static const balance = '/api/address/{address}';
  static const allCoins = '/coins';
  static const marketCap = '/markets';
  static const transactions = '/wallet/transactions?address={address}&connectionId=bitcoin';
}

@RestApi()
abstract class CoinsClient {
  factory CoinsClient(Dio dio, {String baseUrl}) = _CoinsClient;

  @GET(_Paths.balance)
  Future<CardModel> getCard({
    @Path() required String address,
  });

  @GET(_Paths.balance)
  Future<BarModel> getBar({
    @Path() required String address,
  });

  @GET(_Paths.allCoins)
  Future<CoinModel> getAllCoins({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET(_Paths.marketCap)
  Future<MarketCapDto> getMarketCap();

  @GET(_Paths.transactions)
  Future<TransactionModel> getTransactions({
    @Path() required String address,
  });
}

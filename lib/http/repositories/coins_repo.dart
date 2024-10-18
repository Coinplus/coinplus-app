import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/coins_dto/coin_model.dart';
import '../../models/history_model/transaction_model.dart';
import '../../models/market_cap_dto/market_cap_dto.dart';
import '../../models/patch_transactions_model/patch_transactions_model.dart';
import '../../models/wallet_status_model/wallet_status_model.dart';
import '../dio.dart';

part 'coins_repo.g.dart';

class _Paths {
  static const allCoins = '/coins';
  static const marketCap = '/markets';
  static const transactions = '/wallet/transactions?page={page}&limit=20&address={address}&connectionId=bitcoin';
  static const walletStatus = '/wallet/status?address={address}&connectionId=bitcoin';
  static const patchTransactions = '/wallet/transactions?address={address}&connectionId=bitcoin';
}

final coinStatsRepo = CoinsClient(coinStatsDio);

@RestApi()
abstract class CoinsClient {
  factory CoinsClient(Dio dio, {String baseUrl}) = _CoinsClient;

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
    @Path() required int page,
  });

  @GET(_Paths.walletStatus)
  Future<WalletStatusModel> getWalletStatus({
    @Path() required String address,
  });

  @PATCH(_Paths.patchTransactions)
  Future<PatchTransactionsModel> patchTransactions({
    @Path() required String address,
  });
}

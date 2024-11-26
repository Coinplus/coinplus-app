import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../../http/interceptors/api_keys.dart';
import '../abstract_card/abstract_card.dart';

part 'eth_card_model.freezed.dart';
part 'eth_card_model.g.dart';

@freezed
class EthCardModel with _$EthCardModel {
  @Implements<AbstractCard>()
  const factory EthCardModel({
    required String address,
    @JsonKey(name: 'amount') num? finalBalance,
    @JsonKey(name: 'rank') int? totalReceived,
    @Default(CardColor.ORANGE) CardColor color,
    @Default(CardType.CARD) CardType type,
    @Default('Coinplus Ethereum Card') String name,
    @Default(WalletType.COINPLUS_WALLET) WalletType label,
    @Default('ETH') String blockchain,
    @Default(false) bool isBackup,
    @Default(false) bool hasBackedUp,
    @JsonKey(fromJson: timeFromJson) @Default('') String createdAt,
  }) = _EthCardModel;

  factory EthCardModel.fromJson(Map<String, dynamic> json) => _$EthCardModelFromJson(json);
}

String timeFromJson(String a) {
  return a.isNotEmpty ? a : DateFormat('dd/MM/yyyy').format(DateTime.now());
}

class CoinStatsRepo {
  final Dio dio = Dio();

  Future<List<dynamic>?> getWalletData({required String address}) async {
    try {
      final url = 'https://openapiv1.coinstats.app/wallet/balance?address=$address&connectionId=ethereum';

      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'X-API-KEY': coinStatsApiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {}
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return null;
  }
}

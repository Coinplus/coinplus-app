import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/utxo_model/utxo_model.dart';
import '../dio.dart';

part 'utxo_repo.g.dart';

class _Paths {
  static const utxo = '/unspent?active={address}&limit=1000&confirmations=1';
}

final utxoRepo = UtxoClient(utxoDio);

@RestApi()
abstract class UtxoClient {
  factory UtxoClient(Dio dio, {String baseUrl}) = _UtxoClient;

  @GET(_Paths.utxo)
  Future<Status> getUtxoList({
    @Path() required String address,
  });
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../dio.dart';

part 'broadcast_repo.g.dart';

class _Paths {
  static const txHex = '/api/tx';
}

final broadcastRepo = BroadcastClient(broadcastDio);

@RestApi()
abstract class BroadcastClient {
  factory BroadcastClient(Dio dio, {String baseUrl}) = _BroadcastClient;

  @POST(_Paths.txHex)
  Future<String> broadcastTransaction({
    @Body() required String hex,
  });
}

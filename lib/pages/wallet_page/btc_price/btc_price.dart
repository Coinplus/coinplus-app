import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/data_model/data_model.dart';

Future<DataModel> getCryptoPrice() async {
  final url = Uri.parse(
    'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd',
  );
  final response = await http.get(url);
  final databody = json.decode(response.body);
  final dataModel = DataModel.fromJson(databody);
  return dataModel;
}

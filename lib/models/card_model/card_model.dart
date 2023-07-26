import 'dart:convert';

import 'package:http/http.dart' as http;

class CardModel {
  String address;
  int? totalReceived;
  int? totalSent;
  int? balance;

  CardModel({
    required this.address,
    required this.totalReceived,
    required this.totalSent,
    required this.balance,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      address: json['address'],
      totalReceived: json['total_received'],
      totalSent: json['total_sent'],
      balance: json['balance'],
    );
  }
}

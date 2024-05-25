import 'package:json_annotation/json_annotation.dart';

part 'wallet_status_model.g.dart';

@JsonSerializable()
class WalletStatusModel {
  @JsonKey(name: 'status')
  final String status;

  WalletStatusModel({
    required this.status,
  });

  factory WalletStatusModel.fromJson(Map<String, dynamic> json) =>
      _$WalletStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletStatusModelToJson(this);
}

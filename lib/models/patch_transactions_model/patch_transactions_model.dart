import 'package:json_annotation/json_annotation.dart';

part 'patch_transactions_model.g.dart';

@JsonSerializable()
class PatchTransactionsModel {
  @JsonKey(name: 'status')
  final String status;

  PatchTransactionsModel({
    required this.status,
  });

  factory PatchTransactionsModel.fromJson(Map<String, dynamic> json) => _$PatchTransactionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatchTransactionsModelToJson(this);
}

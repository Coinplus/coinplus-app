import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amplitude_user_property_model.freezed.dart';

part 'amplitude_user_property_model.g.dart';

@freezed
abstract class IdentifyModel with _$IdentifyModel {
  const factory IdentifyModel.cardTap({
    @Default('true') String cardTap,
    required String walletAddress,
  }) = CardTap;

  const factory IdentifyModel.barTap({
    @Default('true') String barTap,
    required String walletAddress,
  }) = BarTap;

  const factory IdentifyModel.cardManual({
    @Default('true') String cardManual,
    required String walletAddress,
  }) = CardManual;

  const factory IdentifyModel.barManual({
    @Default('true') String barManual,
    required String walletAddress,
  }) = BarManual;

  const factory IdentifyModel.tracker({
    @Default('true') String tracker,
    required String walletAddress,
  }) = Tracker;

  const factory IdentifyModel.cardHolder({
    @Default('ACTIVATED_CARD') String cardHolder,
  }) = CardHolder;

  const factory IdentifyModel.barHolder({
    @Default('ACTIVATED_BAR') String barHolder,
  }) = BarHolder;

  const factory IdentifyModel.fraudActivity({
    @Default('true') String fraudActivity,
  }) = FraudActivity;

  const factory IdentifyModel.activationFailed({
    @Default('true') String activationFailed,
  }) = ActivationFailed;

  const factory IdentifyModel.notificationsOn({
    @Default('true') String notificationOn,
  }) = NotificationsOn;

  factory IdentifyModel.fromJson(Map<String, dynamic> json) => _$IdentifyModelFromJson(json);
}

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amplitude_user_property_model.freezed.dart';

part 'amplitude_user_property_model.g.dart';

@freezed
abstract class IdentifyModel with _$IdentifyModel {
  const factory IdentifyModel.cardTap({
    @Default('true') String cardTap,
  }) = CardTap;

  const factory IdentifyModel.barTap({
    @Default('true') String barTap,
  }) = BarTap;

  const factory IdentifyModel.cardManual({
    @Default('true') String cardManual,
  }) = CardManual;

  const factory IdentifyModel.barManual({
    @Default('true') String barManual,
  }) = BarManual;

  const factory IdentifyModel.tracker({
    @Default('true') String tracker,
  }) = Tracker;

  const factory IdentifyModel.cardHolder({
    @Default('true') String cardHolder,
  }) = CardHolder;

  const factory IdentifyModel.barHolder({
    @Default('true') String barHolder,
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

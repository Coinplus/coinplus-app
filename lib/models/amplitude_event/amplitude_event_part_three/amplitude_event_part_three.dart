import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amplitude_event_part_three.freezed.dart';

part 'amplitude_event_part_three.g.dart';

@freezed
class AmplitudeEventPartThree with _$AmplitudeEventPartThree {
  const factory AmplitudeEventPartThree.addBackup({
    @Default('ADD_BACKUP') String eventType,
    required String walletAddress,
    required bool activated,
  }) = AddBackup;

  const factory AmplitudeEventPartThree.backedUp({
    @Default('BACKED_UP') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = BackedUp;

  const factory AmplitudeEventPartThree.gotItBackup({
    @Default('GOT_IT_BACKUP') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = GotItBackup;

  const factory AmplitudeEventPartThree.removeBackup({
    @Default('REMOVE_BACKUP') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = RemoveBackup;

  const factory AmplitudeEventPartThree.removeBackupConfirm({
    @Default('REMOVE_BACKUP_CONFIRM') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = RemoveBackupConfirm;

  const factory AmplitudeEventPartThree.copyBackupAddress({
    @Default('COPY_BACKUP_ADDRESS') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = CopyBackupAddress;

  const factory AmplitudeEventPartThree.primaryCard({
    @Default('PRIMARY_CARD') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = PrimaryCard;

  const factory AmplitudeEventPartThree.lostMyCard({
    @Default('LOST_MY_CARD') String eventType,
    required String walletAddress,
    required bool activated,
  }) = LostMyCard;

  const factory AmplitudeEventPartThree.cardFound({
    @Default('CARD_FOUND') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = CardFound;

  const factory AmplitudeEventPartThree.foundCardTapped({
    @Default('FOUND_CARD_TAPPED') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = FoundCardTapped;

  const factory AmplitudeEventPartThree.activateCard({
    @Default('ACTIVATE_CARD') String eventType,
    required String walletAddress,
  }) = ActivatedCard;

  const factory AmplitudeEventPartThree.startTransfer({
    @Default('START_TRANSFER') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = StartTransfer;

  const factory AmplitudeEventPartThree.noFundsTransfer({
    @Default('NO_FUNDS_TRANSFER') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = NoFundsTransfer;

  const factory AmplitudeEventPartThree.noEnoughFundsTransfer({
    @Default('NO_ENOUGH_FUNDS_TRANSFER') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = NoEnoughFundsTransfer;

  const factory AmplitudeEventPartThree.getBackup({
    @Default('GET_BACKUP') String eventType,
    required String walletAddress,
  }) = GetBackup;

  const factory AmplitudeEventPartThree.backupCard({
    @Default('BACKUP_CARD') String eventType,
    required String walletAddress,
  }) = BackupCard;

  const factory AmplitudeEventPartThree.backupNextClicked({
    @Default('BACKUP_NEXT_CLICKED') String eventType,
    required String walletAddress,
  }) = BackupNextClicked;

  const factory AmplitudeEventPartThree.backupActivationNextClicked({
    @Default('BACKUP_ACTIVATION_NEXT_CLICKED') String eventType,
    required String walletAddress,
  }) = BackupActivationNextClicked;

  const factory AmplitudeEventPartThree.backupTapped({
    @Default('BACKUP_TAPPED') String eventType,
    required String walletAddress,
    required String backupAddress,
  }) = BackupTapped;

  const factory AmplitudeEventPartThree.backupDone({
    @Default('BACKUP_DONE') String eventType,
    required String walletAddress,
  }) = BackupDone;

  const factory AmplitudeEventPartThree.closeBackup({
    @Default('CLOSE_BACKUP') String eventType,
    required String walletAddress,
  }) = CloseBackup;

  const factory AmplitudeEventPartThree.dontHaveBackup({
    @Default('DONT_HAVE_BACKUP') String eventType,
    required String walletAddress,
  }) = DontHaveBackup;

  factory AmplitudeEventPartThree.fromJson(Map<String, dynamic> json) => _$AmplitudeEventPartThreeFromJson(json);
}

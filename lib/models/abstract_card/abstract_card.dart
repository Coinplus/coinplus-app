import '../../constants/card_color.dart';
import '../../constants/card_type.dart';

abstract class AbstractCard {
  String get address;

  CardColor get color;

  CardType get type;

  WalletType get label;

  String get name;

  String get blockchain;

  bool get isBackup;

  bool get hasBackedUp;

  String get createdAt;

  num? get finalBalance;

  int? get totalReceived;
}

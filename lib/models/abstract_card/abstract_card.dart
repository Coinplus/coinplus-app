import '../../constants/card_color.dart';
import '../../constants/card_type.dart';

abstract class AbstractCard {
  String get address;

  CardColor get color;

  CardType get type;

  WalletType get label;

  String get name;

  String get blockchain;

  String get createdAt;

  int? get finalBalance;

  int? get totalReceived;
}

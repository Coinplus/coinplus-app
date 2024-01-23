import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../chain_stats/chain_stats.dart';
import '../mempool_stats/mempool_stats.dart';

abstract class AbstractCard {
  String get address;

  CardColor get color;

  CardType get type;

  WalletType get label;

  String get name;

  String get blockchain;

  String get createdAt;

  int? get totalReceived;

  int? get totalSent;

  int? get balance;

  ChainStats? get data;

  MempoolStats? get mempoolStats;
}

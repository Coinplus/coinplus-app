import '../gen/assets.gen.dart';

enum CardColor {
  ORANGE,
  WHITE,
  BLACK,
  BACKUP,
  TRACKER,
  SILVER,
  GOLD,
  ETHEREUM,
}

const cardColors = [
  CardColor.ORANGE,
  CardColor.WHITE,
  CardColor.BLACK,
  CardColor.BACKUP,
  CardColor.TRACKER,
  CardColor.ETHEREUM,
];
const barColors = [CardColor.SILVER, CardColor.GOLD];

extension CardColorHelper on CardColor {
  AssetGenImage get image => switch (this) {
        CardColor.ORANGE => Assets.images.card.orangeCardFront,
        CardColor.WHITE => Assets.images.card.whiteCardFront,
        CardColor.BLACK => Assets.images.card.brownCardFront,
        CardColor.BACKUP => Assets.images.card.backupCardFront,
        CardColor.TRACKER => Assets.images.card.orangeCardFront,
        CardColor.ETHEREUM => Assets.images.card.orangeCardFront,
        CardColor.SILVER => Assets.images.bar.barFill,
        CardColor.GOLD => Assets.images.bar.barFill,
      };
}

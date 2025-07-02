import '../gen/assets.gen.dart';

enum CardColor {
  ORANGE,
  WHITE,
  BLACK,
  LEGACY,
  BACKUP,
  TRACKER,
  SILVER,
  GOLD,
  ETHEREUM,
  GATE_BLACK,
}

const cardColors = [
  CardColor.ORANGE,
  CardColor.WHITE,
  CardColor.BLACK,
  CardColor.LEGACY,
  CardColor.BACKUP,
  CardColor.TRACKER,
  CardColor.ETHEREUM,
  CardColor.GATE_BLACK,
];
const barColors = [CardColor.SILVER, CardColor.GOLD];

extension CardColorHelper on CardColor {
  AssetGenImage get image => switch (this) {
        CardColor.ORANGE => Assets.images.card.orangeCardFront,
        CardColor.WHITE => Assets.images.card.whiteCardFront,
        CardColor.BLACK => Assets.images.card.brownCardFront,
        CardColor.LEGACY => Assets.images.card.legacyFront,
        CardColor.BACKUP => Assets.images.card.backupCardFront,
        CardColor.TRACKER => Assets.images.card.orangeCardFront,
        CardColor.ETHEREUM => Assets.images.card.orangeCardFront,
        CardColor.GATE_BLACK => Assets.images.card.gateFront,
        CardColor.SILVER => Assets.images.bar.barFill,
        CardColor.GOLD => Assets.images.bar.barFill,
      };
}

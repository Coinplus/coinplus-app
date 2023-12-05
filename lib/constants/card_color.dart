import '../gen/assets.gen.dart';

enum CardColor {
  ORANGE,
  WHITE,
  BLACK,
  TRACKER,
  SILVER,
  GOLD,
}

const cardColors = [
  CardColor.ORANGE,
  CardColor.WHITE,
  CardColor.BLACK,
  CardColor.TRACKER,
];
const CardColors = [CardColor.SILVER, CardColor.GOLD];

extension CardColorHelper on CardColor {
  AssetGenImage get image => switch (this) {
        CardColor.ORANGE => Assets.images.card.orangeCardFront,
        CardColor.WHITE => Assets.images.card.whiteCardFront,
        CardColor.BLACK => Assets.images.card.brownCardFront,
        CardColor.TRACKER => Assets.images.card.trackerColorCard,
        CardColor.SILVER => Assets.images.bar.barFill,
        CardColor.GOLD => Assets.images.bar.barFill,
      };
}

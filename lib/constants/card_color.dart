import '../gen/assets.gen.dart';

enum CardColor {
  ORANGE,
  WHITE,
  BROWN,
  SILVER,
  GOLD,
}

const cardColors = [CardColor.ORANGE, CardColor.WHITE, CardColor.BROWN];
const CardColors = [CardColor.SILVER, CardColor.GOLD];

extension CardColorHelper on CardColor {
  AssetGenImage get image => switch (this) {
        CardColor.ORANGE => Assets.images.card.orangeCardFront,
        CardColor.WHITE => Assets.images.card.whiteCardFront,
        CardColor.BROWN => Assets.images.card.brownCardFront,
        CardColor.SILVER => Assets.images.bar.barEmpty,
        CardColor.GOLD => Assets.images.bar.barEmpty,
      };
}

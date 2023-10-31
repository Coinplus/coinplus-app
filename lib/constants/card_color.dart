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
        CardColor.ORANGE => Assets.images.orangeCardFront,
        CardColor.WHITE => Assets.images.whiteCardFront,
        CardColor.BROWN => Assets.images.brownCardFront,
        CardColor.SILVER => Assets.images.barEmpty,
        CardColor.GOLD => Assets.images.barEmpty,
      };
}

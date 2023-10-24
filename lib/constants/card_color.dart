import '../gen/assets.gen.dart';

enum CardColor {
  ORANGE,
  WHITE,
  BROWN,
}

extension CardColorHelper on CardColor {
  AssetGenImage get image => switch (this) {
        CardColor.ORANGE => Assets.images.orangeCardFront,
        CardColor.WHITE => Assets.images.whiteCardFront,
        CardColor.BROWN => Assets.images.brownCardFront,
      };
}

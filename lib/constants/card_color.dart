import '../gen/assets.gen.dart';

enum CardColor {
  ORANGE,
  WHITE,
  BROWN,
}

extension CardColorHelper on CardColor {
  AssetGenImage get image => switch (this) {
        CardColor.ORANGE => Assets.images.orangeWithoutShadow,
        CardColor.WHITE => Assets.images.whiteWithoutShadow,
        CardColor.BROWN => Assets.images.brownWithoutShadow,
      };
}

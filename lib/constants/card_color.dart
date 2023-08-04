import '../gen/assets.gen.dart';

enum CardColor {
  ORANGE,
  WHITE,
  BROWN,
}

extension CardColorHelper on CardColor {
  AssetGenImage get image => switch (this) {
        CardColor.ORANGE => Assets.images.orangeCard,
        CardColor.WHITE => Assets.images.whiteCard,
        CardColor.BROWN => Assets.images.brownCard,
      };
}

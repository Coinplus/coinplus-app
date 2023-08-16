import '../gen/assets.gen.dart';

enum BarColor {
  SILVER,
}

extension CardColorHelper on BarColor {
  AssetGenImage get image => switch (this) {
        BarColor.SILVER => Assets.images.barWithAddress,
      };
}

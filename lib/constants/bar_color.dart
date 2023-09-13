import '../gen/assets.gen.dart';

enum BarColor {
  SILVER,
  GOLD,
}

extension CardColorHelper on BarColor {
  AssetGenImage get image => switch (this) {
        BarColor.SILVER => Assets.images.barEmpty,
        BarColor.GOLD => Assets.images.barEmpty,
      };
}

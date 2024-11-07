import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

DecorationImage getFrontImageForCardColor(String? colorNum) {
  switch (colorNum) {
    case '0' || 'ORANGE':
      return DecorationImage(
        image: Assets.images.card.orangeCardFront.image().image,
      );
    case '1' || 'WHITE':
      return DecorationImage(
        image: Assets.images.card.whiteCardFront.image().image,
      );
    case '2' || 'BLACK':
      return DecorationImage(
        image: Assets.images.card.brownCardFront.image().image,
      );
    default:
      return DecorationImage(
        image: Assets.images.card.orangeCardFront.image().image,
      );
  }
}

DecorationImage getFilledBackImageForCardColor(String? colorNum) {
  switch (colorNum) {
    case '0' || 'ORANGE':
      return DecorationImage(
        image: Assets.images.card.filledBack.image().image,
      );
    case '1' || 'WHITE':
      return DecorationImage(
        image: Assets.images.card.filledBackWhite.image().image,
      );
    case '2' || 'BLACK':
      return DecorationImage(
        image: Assets.images.card.filledBackBrown.image().image,
      );
    default:
      return DecorationImage(
        image: Assets.images.card.filledBack.image().image,
      );
  }
}

DecorationImage getBackImageForCardColor(String? colorNum) {
  switch (colorNum) {
    case '0' || 'ORANGE':
      return DecorationImage(
        image: Assets.images.card.back.image().image,
      );
    case '1' || 'WHITE':
      return DecorationImage(
        image: Assets.images.card.cardBackWhite.image().image,
      );
    case '2' || 'BLACK':
      return DecorationImage(
        image: Assets.images.card.cardBackBlack.image().image,
      );
    default:
      return DecorationImage(image: Assets.images.card.back.image().image);
  }
}

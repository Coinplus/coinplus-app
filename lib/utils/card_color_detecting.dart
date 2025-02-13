import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

DecorationImage getFrontImageForCardColor(String? colorNum, {bool isMifare = false}) {
  if (isMifare) {
    return DecorationImage(
      image: Assets.images.card.legacyFront.image().image,
    );
  }
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
    case '3' || 'BACKUP':
      return DecorationImage(
        image: Assets.images.card.backupCardFront.image().image,
      );
    case 'OLD CARD':
      return DecorationImage(
        image: Assets.images.card.legacyFront.image().image,
      );
    default:
      return DecorationImage(
        image: Assets.images.card.orangeCardFront.image().image,
      );
  }
}

DecorationImage getFilledBackImageForCardColor(String? colorNum, {bool isMifare = false}) {
  if (isMifare) {
    return DecorationImage(
      image: Assets.images.card.filledBackLegacy.image().image,
    );
  }
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
    case 'OLD CARD':
      return DecorationImage(
        image: Assets.images.card.filledBackLegacy.image().image,
      );
    default:
      return DecorationImage(
        image: Assets.images.card.filledBack.image().image,
      );
  }
}

DecorationImage getBackImageForCardColor(String? colorNum, {bool isMifare = false}) {
  if (isMifare) {
    return DecorationImage(
      image: Assets.images.card.cardBackLegacy.image().image,
    );
  }

  switch (colorNum) {
    case '0':
    case 'ORANGE':
      return DecorationImage(
        image: Assets.images.card.back.image().image,
      );
    case '1':
    case 'WHITE':
      return DecorationImage(
        image: Assets.images.card.cardBackWhite.image().image,
      );
    case '2':
    case 'BLACK':
      return DecorationImage(
        image: Assets.images.card.cardBackBlack.image().image,
      );
    case 'OLD CARD':
      return DecorationImage(
        image: Assets.images.card.cardBackLegacy.image().image,
      );
    default:
      return DecorationImage(
        image: Assets.images.card.back.image().image,
      );
  }
}

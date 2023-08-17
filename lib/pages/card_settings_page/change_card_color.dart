import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../store/card_color_state/card_color_state.dart';

class ImageRadioRow extends StatefulWidget {
  const ImageRadioRow({super.key});

  @override
  _ImageRadioRowState createState() => _ImageRadioRowState();
}

class _ImageRadioRowState extends State<ImageRadioRow> {
  final _cardColorState = CardColorState();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _cardColorState.changeIndex(0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: _cardColorState.currentIndex == 0
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                    ),
                    child: Assets.images.orangeCard.image(
                      height: 120,
                    ),
                  ),
                  Radio(
                    activeColor: AppColors.secondaryButtons,
                    value: 0,
                    groupValue: _cardColorState.currentIndex,
                    onChanged: (index) {
                      _cardColorState.changeIndex(index!);
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _cardColorState.changeIndex(1),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: _cardColorState.currentIndex == 1
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                    ),
                    child: Assets.images.whiteCard.image(
                      height: 120,
                    ),
                  ),
                  Radio(
                    activeColor: AppColors.secondaryButtons,
                    value: 1,
                    groupValue: _cardColorState.currentIndex,
                    onChanged: (index) {
                      _cardColorState.changeIndex(index!);
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _cardColorState.changeIndex(2),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: _cardColorState.currentIndex == 2
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                    ),
                    child: Assets.images.brownCard.image(
                      height: 120,
                    ),
                  ),
                  Radio(
                    activeColor: AppColors.secondaryButtons,
                    value: 2,
                    groupValue: _cardColorState.currentIndex,
                    onChanged: (index) {
                      _cardColorState.changeIndex(index!);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

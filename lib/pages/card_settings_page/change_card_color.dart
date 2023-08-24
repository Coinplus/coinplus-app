import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../models/card_model/card_model.dart';
import '../../store/card_color_state/card_color_state.dart';

class ChangeImageColor extends StatefulWidget {
  const ChangeImageColor({super.key, this.card});
  final CardModel? card;

  @override
  _ChangeImageColorState createState() => _ChangeImageColorState();
}

class _ChangeImageColorState extends State<ChangeImageColor> {
  final _cardColorState = CardColorState();
@override
void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScaleTap(
              enableFeedback: false,
              onPressed: () => {
                HapticFeedback.selectionClick(),
                _cardColorState.changeIndex(0),
              },
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
                    child: Assets.images.cardColorOrange.image(
                      height: 130,
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
            ScaleTap(
              enableFeedback: false,
              onPressed: () => {
                HapticFeedback.selectionClick(),
                _cardColorState.changeIndex(1),
              },
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
                    child: Assets.images.cardColorWhite.image(
                      height: 130,
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
            ScaleTap(
              enableFeedback: false,
              onPressed: () => {
                HapticFeedback.selectionClick(),
                _cardColorState.changeIndex(2),
              },
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
                    child: Assets.images.cardColorBrown.image(
                      height: 130,
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

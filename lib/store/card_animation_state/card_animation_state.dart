import 'package:mobx/mobx.dart';

part 'card_animation_state.g.dart';

class CardAnimationState = _CardAnimationState with _$CardAnimationState;

abstract class _CardAnimationState with Store {
  @readonly
  bool _showFirstWidget = true;

  @action
  void startLoading() {
    _showFirstWidget = !_showFirstWidget;
  }
}

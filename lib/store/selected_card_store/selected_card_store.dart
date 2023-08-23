import 'package:mobx/mobx.dart';

import '../../models/card_model/card_model.dart';

part 'selected_card_store.g.dart';

class SelectedCardStore = _SelectedCardStore with _$SelectedCardStore;

abstract class _SelectedCardStore with Store {
  @observable
  CardModel? _selectedCard;

  @computed
  CardModel? get selectedCard => _selectedCard;

  @action
  void setSelectedCard(CardModel card) {
    _selectedCard = card;
  }
}
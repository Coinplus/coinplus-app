// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_animation_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardAnimationState on _CardAnimationState, Store {
  late final _$_showFirstWidgetAtom =
      Atom(name: '_CardAnimationState._showFirstWidget', context: context);

  bool get showFirstWidget {
    _$_showFirstWidgetAtom.reportRead();
    return super._showFirstWidget;
  }

  @override
  bool get _showFirstWidget => showFirstWidget;

  @override
  set _showFirstWidget(bool value) {
    _$_showFirstWidgetAtom.reportWrite(value, super._showFirstWidget, () {
      super._showFirstWidget = value;
    });
  }

  late final _$_CardAnimationStateActionController =
      ActionController(name: '_CardAnimationState', context: context);

  @override
  void startLoading() {
    final _$actionInfo = _$_CardAnimationStateActionController.startAction(
        name: '_CardAnimationState.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_CardAnimationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

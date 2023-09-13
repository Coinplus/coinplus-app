part of 'create_pin_bloc.dart';

@immutable
abstract class CreatePINEvent {
  final int? pinNum;

  const CreatePINEvent({this.pinNum});
}

class CreatePINAddEvent extends CreatePINEvent {
  const CreatePINAddEvent({required int pinNum}) : super(pinNum: pinNum);
}

class CreatePINEraseEvent extends CreatePINEvent {
  const CreatePINEraseEvent() : super();
}

class CreateNullPINEvent extends CreatePINEvent {
  const CreateNullPINEvent() : super();
}

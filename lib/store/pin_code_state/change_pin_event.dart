part of 'change_pin_bloc.dart';

@immutable
abstract class ChangePinEvent {
  final int? pinNum;

  const ChangePinEvent({this.pinNum});
}

class ChangePINAddEvent extends ChangePinEvent {
  const ChangePINAddEvent({required int pinNum}) : super(pinNum: pinNum);
}

class ChangePINEraseEvent extends ChangePinEvent {
  const ChangePINEraseEvent() : super();
}

class ChangeNullPINEvent extends ChangePinEvent {
  const ChangeNullPINEvent() : super();
}

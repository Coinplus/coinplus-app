part of 'authentication_pin_bloc.dart';

@immutable
abstract class AuthenticationPinEvent {
  final int? pinNum;

  const AuthenticationPinEvent({this.pinNum});
}

class AuthenticationPinAddEvent extends AuthenticationPinEvent {
  const AuthenticationPinAddEvent({required int pinNum})
      : super(pinNum: pinNum);
}

class AuthenticationPinEraseEvent extends AuthenticationPinEvent {
  const AuthenticationPinEraseEvent() : super();
}

class AuthenticationNullPINEvent extends AuthenticationPinEvent {
  const AuthenticationNullPINEvent() : super();
}

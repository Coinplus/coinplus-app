part of 'authentication_pin_bloc.dart';

enum AuthenticationPINStatus { enterPIN, equals, unequals }

@immutable
class AuthenticationPinState {
  final AuthenticationPINStatus pinStatus;
  final String pin;

  const AuthenticationPinState({required this.pinStatus, this.pin = ''});

  AuthenticationPinState copyWith({
    AuthenticationPINStatus? pinStatus,
    String? pin,
  }) {
    return AuthenticationPinState(
      pinStatus: pinStatus ?? this.pinStatus,
      pin: pin ?? this.pin,
    );
  }

  int getCountsOfPIN() {
    return pin.length;
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../pages/custom_pin_code/data/pin_repository.dart';

part 'authentication_pin_event.dart';

part 'authentication_pin_state.dart';

class AuthenticationPinBloc
    extends Bloc<AuthenticationPinEvent, AuthenticationPinState> {
  final PINRepository pinRepository;

  AuthenticationPinBloc({required this.pinRepository})
      : super(
          const AuthenticationPinState(
            pinStatus: AuthenticationPINStatus.enterPIN,
          ),
        ) {
    on<AuthenticationPinAddEvent>((event, emit) async {
      final pin = '${state.pin}${event.pinNum}';
      if (pin.length < 6) {
        emit(
          AuthenticationPinState(
            pin: pin,
            pinStatus: AuthenticationPINStatus.enterPIN,
          ),
        );
      } else if (await pinRepository.pinEquals(pin)) {
        emit(
          AuthenticationPinState(
            pin: pin,
            pinStatus: AuthenticationPINStatus.equals,
          ),
        );
      } else {
        emit(
          AuthenticationPinState(
            pin: pin,
            pinStatus: AuthenticationPINStatus.unequals,
          ),
        );
        await Future.delayed(
          const Duration(milliseconds: 100),
          () => emit(
            const AuthenticationPinState(
              pinStatus: AuthenticationPINStatus.enterPIN,
            ),
          ),
        );
      }
    });

    on<AuthenticationPinEraseEvent>((event, emit) {
      if (state.pin.isNotEmpty) {
        final pin = state.pin.substring(0, state.pin.length - 1);
        emit(
          AuthenticationPinState(
            pin: pin,
            pinStatus: AuthenticationPINStatus.enterPIN,
          ),
        );
      }
    });

    on<AuthenticationNullPINEvent>((event, emit) {
      emit(
        const AuthenticationPinState(
          pinStatus: AuthenticationPINStatus.enterPIN,
        ),
      );
    });
  }
}

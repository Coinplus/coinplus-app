import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../pages/custom_pin_code/data/pin_repository.dart';

part 'change_pin_event.dart';

part 'change_pin_state.dart';

class ChangePinBloc extends Bloc<ChangePinEvent, ChangePinState> {
  final PINRepository pinRepository;

  ChangePinBloc({required this.pinRepository})
      : super(
          const ChangePinState(pinStatus: ChangePINStatus.enterCurrentPIN),
        ) {
    on<ChangePINAddEvent>((event, emit) {
      if (state.currentPIN.length < 4) {
        final currentPIN = '${state.currentPIN}${event.pinNum}';
        if (currentPIN.length < 4) {
          emit(
            ChangePinState(
              currentPIN: currentPIN,
              pinStatus: ChangePINStatus.enterCurrentPIN,
            ),
          );
        } else {
          emit(
            ChangePinState(
              currentPIN: currentPIN,
              pinStatus: ChangePINStatus.enterNewPIN,
            ),
          );
        }
      } else if (state.newPIN.isEmpty) {
        final newPIN = '${state.newPIN}${event.pinNum}';
        if (newPIN.length < 4) {
          emit(
            state.copyWith(
              newPIN: newPIN,
              pinStatus: ChangePINStatus.enterNewPIN,
            ),
          );
        } else {
          emit(
            state.copyWith(
              newPIN: newPIN,
              pinStatus: ChangePINStatus.confirmNewPIN,
            ),
          );
        }
      } else if (state.confirmNewPIN.isEmpty) {
        final newPIN = '${state.newPIN}${event.pinNum}';
        final confirmNewPIN = '${state.confirmNewPIN}${event.pinNum}';
        final currentPIN = '${state.currentPIN}${event.pinNum}';

        if (confirmNewPIN.length < 4) {
          emit(
            state.copyWith(
              confirmNewPIN: confirmNewPIN,
              pinStatus: ChangePINStatus.confirmNewPIN,
            ),
          );
        } else if (confirmNewPIN == state.newPIN) {
          pinRepository.changePin(currentPIN, newPIN);
          emit(
            state.copyWith(
              confirmNewPIN: confirmNewPIN,
              pinStatus: ChangePINStatus.pinChangedSuccessfully,
            ),
          );
        } else {
          emit(
            state.copyWith(
              confirmNewPIN: confirmNewPIN,
              pinStatus: ChangePINStatus.unequals,
            ),
          );
        }
      }
    });
    on<ChangePINEraseEvent>((event, emit) {
      if (state.currentPIN.isEmpty) {
        emit(const ChangePinState(pinStatus: ChangePINStatus.enterCurrentPIN));
      } else if (state.currentPIN.length < 4) {
        final currentPIN =
            state.currentPIN.substring(0, state.currentPIN.length - 1);
        emit(
          ChangePinState(
            currentPIN: currentPIN,
            pinStatus: ChangePINStatus.enterCurrentPIN,
          ),
        );
      } else if (state.newPIN.isEmpty) {
        emit(state.copyWith(pinStatus: ChangePINStatus.enterNewPIN));
      } else if (state.newPIN.length < 4) {
        final newPIN = state.newPIN.substring(0, state.newPIN.length - 1);
        emit(
          state.copyWith(
            newPIN: newPIN,
            pinStatus: ChangePINStatus.enterNewPIN,
          ),
        );
      } else if (state.confirmNewPIN.isEmpty) {
        emit(state.copyWith(pinStatus: ChangePINStatus.confirmNewPIN));
      } else {
        final confirmNewPIN =
            state.confirmNewPIN.substring(0, state.confirmNewPIN.length - 1);
        emit(
          state.copyWith(
            confirmNewPIN: confirmNewPIN,
            pinStatus: ChangePINStatus.confirmNewPIN,
          ),
        );
      }
    });
    on<ChangeNullPINEvent>((event, emit) {
      emit(const ChangePinState(pinStatus: ChangePINStatus.enterCurrentPIN));
    });
  }

  @override
  Future<void> close() {
    pinRepository.close();
    return super.close();
  }
}

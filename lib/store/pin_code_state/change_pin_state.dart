part of 'change_pin_bloc.dart';

enum ChangePINStatus {
  enterCurrentPIN,
  enterNewPIN,
  confirmNewPIN,
  unequals,
  equals,
  pinChangedSuccessfully
}

@immutable
class ChangePinState {
  final ChangePINStatus pinStatus;
  final String currentPIN;
  final String newPIN;
  final String confirmNewPIN;

  const ChangePinState({
    this.currentPIN = '',
    this.newPIN = '',
    this.confirmNewPIN = '',
    required this.pinStatus,
  });

  int getCountsOfPIN() {
    if (pinStatus == ChangePINStatus.enterCurrentPIN) {
      return currentPIN.length;
    } else if (pinStatus == ChangePINStatus.enterNewPIN) {
      return newPIN.length;
    } else {
      return confirmNewPIN.length;
    }
  }

  ChangePinState copyWith({
    ChangePINStatus? pinStatus,
    String? currentPIN,
    String? newPIN,
    String? confirmNewPIN,
  }) {
    return ChangePinState(
      pinStatus: pinStatus ?? this.pinStatus,
      currentPIN: currentPIN ?? this.currentPIN,
      newPIN: newPIN ?? this.newPIN,
      confirmNewPIN: confirmNewPIN ?? this.confirmNewPIN,
    );
  }
}

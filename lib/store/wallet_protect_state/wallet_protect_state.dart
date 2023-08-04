import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';

part 'wallet_protect_state.g.dart';

class WalletProtectState = _WalletProtectState with _$WalletProtectState;

abstract class _WalletProtectState with Store {
  final _auth = LocalAuthentication();
  @observable
  bool isToggleSwitched = false;
  @action
  Future<void> onToggleSwitch() async {
    try {
      final didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate',
      );
      isToggleSwitched = !isToggleSwitched;
      if (!didAuthenticate) {
        return;
      }
    } catch (_) {}
  }

  void initState() {
    _auth.getAvailableBiometrics();
  }
}

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
    isToggleSwitched = !isToggleSwitched;
    // try {
    //   final didAuthenticate = await _auth.authenticate(
    //     localizedReason: 'Please authenticate',
    //   );
    //   isToggleSwitched = didAuthenticate;
    //   if (!didAuthenticate) {
    //     return;
    //   }
    // } catch (_) {}
  }

  @action
  Future<bool> isBiometricAvailable() async {
    try {
      return await _auth.isDeviceSupported();
    } catch (e) {
      return false;
    }
  }

  @action
  Future<void> authenticateWithBiometrics() async {
    try {
      if (await isBiometricAvailable()) {
        final isAuthorized = await _auth.authenticate(
          localizedReason: 'Authenticate using Face ID',
        );

        if (isAuthorized) {
        } else {}
      } else {}
    } catch (_) {
      return;
    }
  }

  void initState() {
    _auth.getAvailableBiometrics();
  }
}

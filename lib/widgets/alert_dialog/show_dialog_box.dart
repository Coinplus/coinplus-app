import 'package:flutter/widgets.dart';

import '../../constants/durations.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';

/// Shows dialog with sliding and scaling animation, slides from top when
/// opened, and slides to bottom when closed.
Future<T?> showDialogBox<T>(
  BuildContext context,
  WalletProtectState walletProtectState,
  Widget dialogBox, {
  bool? isDismissible,
}) async {
  // Decides if dialog should slide from top(true) or bottom(false).
  var isNew = true;
  Future.delayed(
    slowAnimationDuration,
    () => isNew = false,
  );
  return showGeneralDialog<T?>(
    context: context,
    transitionDuration: animationDuration,
    barrierDismissible: isDismissible!,
    barrierLabel: '',
    pageBuilder: (context, animation, secondaryAnimation) {
      walletProtectState.updateModalStatus(isOpened: true);
      return dialogBox;
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween(
          begin: Offset(0, isNew ? -1 : 1),
          end: Offset.zero,
        ).animate(animation),
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        ),
      );
    },
  );
}

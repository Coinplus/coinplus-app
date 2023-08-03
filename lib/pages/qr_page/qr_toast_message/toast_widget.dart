import 'package:toast/toast.dart';

void showToast(String msg, {int? duration, int? gravity, bool? rootNavigator}) {
  Toast.show(msg, duration: duration, gravity: gravity, rootNavigator: rootNavigator);
}


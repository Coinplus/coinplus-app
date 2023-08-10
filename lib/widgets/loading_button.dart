import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../extensions/extensions.dart';
import '../extensions/elevated_button_extensions.dart';

class LoadingButton extends HookWidget {
  const LoadingButton({
    required this.child,
    super.key,
    this.onPressed,
    this.onLongPress,
    this.isLoading = false,
    this.isDisabled = false,
    this.isExpanded = true,
    this.style,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final bool isLoading;
  final bool isDisabled;
  final bool isExpanded;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    Widget child;
    child =
        isLoading ? const CupertinoActivityIndicator(radius: 8) : this.child;

    return RepaintBoundary(
      child: SizedBox(
        width: isExpanded ? double.infinity : null,
        child: ScaleTap(
          onPressed: isDisabled || isLoading ? null : onPressed,
          onLongPress: onLongPress,
          child: ElevatedButton(

            onPressed: isDisabled || isLoading ? null : onPressed,
            onLongPress: onLongPress,
            style: style ?? context.theme.buttonStyle(),
            child: child,
          ),
        ),
      ),
    );
  }
}

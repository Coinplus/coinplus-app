import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../store/pin_code_state/authentication_pin_bloc.dart';
import '../data/pin_repository.dart';
import 'widget/button_of_numpad.dart';
import 'widget/pin_sphere.dart';

@RoutePage()
class PinPage extends StatefulWidget {
  static const String setupPIN = 'Setup PIN';
  static const String authenticationSuccess = 'Authentication success';
  static const String authenticationFailed = 'Authentication failed';

  const PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        lazy: false,
        create: (_) =>
            AuthenticationPinBloc(pinRepository: HivePINRepository()),
        child: BlocListener<AuthenticationPinBloc, AuthenticationPinState>(
          listener: (context, state) {
            if (state.pinStatus == AuthenticationPINStatus.equals) {
              HapticFeedback.lightImpact();
              router.pushAndPopAll(const Dashboard());
            } else if (state.pinStatus == AuthenticationPINStatus.unequals) {
              HapticFeedback.vibrate();
            }
          },
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              Expanded(flex: 2, child: _MainPart()),
              Flexible(flex: 6, child: _NumPad()),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainPart extends StatelessWidget {
  static const String enterYourPIN = 'Enter your passcode';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationPinBloc, AuthenticationPinState>(
      buildWhen: (previous, current) => previous.pin != current.pin,
      builder: (context, state) {
        return Column(
          children: [
            const Text(
              enterYourPIN,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontFamily: FontFamily.redHatMedium,
              ),
            ),
            const Gap(90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => PinSphere(input: index < state.getCountsOfPIN()),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _NumPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                Expanded(
                  child: ButtonOfNumPad(
                    num: '1',
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      BlocProvider.of<AuthenticationPinBloc>(context).add(
                        const AuthenticationPinAddEvent(pinNum: 1),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '2',
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      BlocProvider.of<AuthenticationPinBloc>(context).add(
                        const AuthenticationPinAddEvent(pinNum: 2),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '3',
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      BlocProvider.of<AuthenticationPinBloc>(context).add(
                        const AuthenticationPinAddEvent(pinNum: 3),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Flexible(
            child: Row(
              children: [
                Expanded(
                  child: ButtonOfNumPad(
                    num: '4',
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      BlocProvider.of<AuthenticationPinBloc>(context).add(
                        const AuthenticationPinAddEvent(pinNum: 4),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '5',
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      BlocProvider.of<AuthenticationPinBloc>(context).add(
                        const AuthenticationPinAddEvent(pinNum: 5),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '6',
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      BlocProvider.of<AuthenticationPinBloc>(context).add(
                        const AuthenticationPinAddEvent(pinNum: 6),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Flexible(
            child: Row(
              children: [
                Expanded(
                  child: ButtonOfNumPad(
                    num: '7',
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      BlocProvider.of<AuthenticationPinBloc>(context).add(
                        const AuthenticationPinAddEvent(pinNum: 7),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '8',
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      BlocProvider.of<AuthenticationPinBloc>(context).add(
                        const AuthenticationPinAddEvent(pinNum: 8),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '9',
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      BlocProvider.of<AuthenticationPinBloc>(context).add(
                        const AuthenticationPinAddEvent(pinNum: 9),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Flexible(
            child: Row(
              children: [
                Expanded(
                  child: ScaleTap(
                    onPressed: () {},
                    child: Assets.icons.faceIDSuccess.image(
                      height: 25,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '0',
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      BlocProvider.of<AuthenticationPinBloc>(context).add(
                        const AuthenticationPinAddEvent(pinNum: 0),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.backspace),
                    onPressed: () {
                      SystemSound.play(SystemSoundType.alert);
                      BlocProvider.of<AuthenticationPinBloc>(context)
                          .add(const AuthenticationPinEraseEvent());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

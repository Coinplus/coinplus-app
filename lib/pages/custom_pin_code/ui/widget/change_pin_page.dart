import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../gen/colors.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../providers/screen_service.dart';
import '../../../../store/pin_code_state/change_pin_bloc.dart';
import '../../data/pin_repository.dart';
import 'button_of_numpad.dart';
import 'pin_sphere.dart';



@RoutePage()
class ChangePinPage extends StatelessWidget {
  static const String changePIN = 'Change PIN';
  static const String currentPINLabel = 'Enter current PIN:';
  static const String newPINLabel = 'Enter new PIN:';
  static const String confirmNewPINLabel = 'Confirm new PIN:';
  static const String pinChangedSuccessfully = 'PIN changed successfully';
  static const String ok = 'OK';

  const ChangePinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: router.pop,
        ),
        title: const Text(
          changePIN,
          style: TextStyle(
            color: Colors.black,
            fontFamily: FontFamily.redHatMedium,
            fontSize: 17,
          ),
        ),
      ),
      body: BlocProvider(
        lazy: false,
        create: (_) => ChangePinBloc(pinRepository: HivePINRepository()),
        child: BlocListener<ChangePinBloc, ChangePinState>(
          listener: (context, state) {
            if (state.pinStatus == ChangePINStatus.equals) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  title: const Text(pinChangedSuccessfully),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    TextButton(
                      onPressed: router.pop, // Navigate back
                      child: const Text(ok),
                    ),
                  ],
                ),
              );
            } else if (state.pinStatus == ChangePINStatus.unequals) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  title: const Text('Pin Change'),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    TextButton(
                      onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                          .add(const ChangeNullPINEvent()),
                      child: const Text(ok),
                    ),
                  ],
                ),
              );
            }
          },
          child: Column(
            children: [
              const Gap(60),
              Expanded(flex: 2, child: _MainPart()),
              Flexible(flex: 6, child: _NumPad()),
            ],
          ),
        ),
      ),
    );
  }
}

class _NumPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                Expanded(
                  child: ButtonOfNumPad(
                    num: '1',
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINAddEvent(pinNum: 1)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '2',
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINAddEvent(pinNum: 2)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '3',
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINAddEvent(pinNum: 3)),
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
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINAddEvent(pinNum: 4)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '5',
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINAddEvent(pinNum: 5)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '6',
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINAddEvent(pinNum: 6)),
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
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINAddEvent(pinNum: 7)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '8',
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINAddEvent(pinNum: 8)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '9',
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINAddEvent(pinNum: 9)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Flexible(
            child: Row(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '0',
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINAddEvent(pinNum: 0)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: IconButton(
                    icon: const Icon(
                      Icons.backspace,
                      size: 30,
                      color: AppColors.primary,
                    ),
                    onPressed: () => BlocProvider.of<ChangePinBloc>(context)
                        .add(const ChangePINEraseEvent()),
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

class _MainPart extends StatelessWidget {
  static const String enterCurrentPIN = 'Enter your current PIN';
  static const String enterNewPIN = 'Enter your new PIN';
  static const String confirmNewPIN = 'Confirm your new PIN';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePinBloc, ChangePinState>(
      buildWhen: (previous, current) =>
      previous.currentPIN != current.currentPIN ||
          previous.newPIN != current.newPIN,
      builder: (context, state) {
        return Column(
          children: [
            Text(
              state.pinStatus == ChangePINStatus.enterCurrentPIN
                  ? enterCurrentPIN
                  : state.pinStatus == ChangePINStatus.enterNewPIN
                  ? enterNewPIN
                  : confirmNewPIN,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 25,
                fontFamily: FontFamily.redHatMedium,
              ),
            ),
            const Gap(70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                    (index) =>
                    PinSphere(input: index < state.getCountsOfPIN()),
              ),
            ),
          ],
        );
      },
    );
  }
}

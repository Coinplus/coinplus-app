import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../store/pin_code_state/create_pin_bloc.dart';
import '../data/pin_repository.dart';
import 'widget/button_of_numpad.dart';
import 'widget/pin_sphere.dart';

@RoutePage()
class CreatePinPage extends StatelessWidget {
  static const String setupPIN = 'Setup pin code';
  static const String pinCreated = 'Your PIN code is successfully created';
  static const String pinNonCreated = 'Pin codes do not match';
  static const String ok = 'OK';

  const CreatePinPage({Key? key}) : super(key: key);

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
          setupPIN,
          style: TextStyle(
            color: Colors.black,
            fontFamily: FontFamily.redHatMedium,
            fontSize: 17,
          ),
        ),
      ),
      body: BlocProvider(
        lazy: false,
        create: (_) => CreatePINBloc(pinRepository: HivePINRepository()),
        child: BlocListener<CreatePINBloc, CreatePINState>(
          listener: (context, state) {
            if (state.pinStatus == PINStatus.equals) {
              router.pushAndPopAll(const Dashboard());
            } else if (state.pinStatus == PINStatus.unequals) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  title: const Text(pinNonCreated),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    TextButton(
                      onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                          .add(const CreateNullPINEvent()),
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
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINAddEvent(pinNum: 1)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '2',
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINAddEvent(pinNum: 2)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '3',
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINAddEvent(pinNum: 3)),
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
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINAddEvent(pinNum: 4)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '5',
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINAddEvent(pinNum: 5)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '6',
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINAddEvent(pinNum: 6)),
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
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINAddEvent(pinNum: 7)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '8',
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINAddEvent(pinNum: 8)),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '9',
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINAddEvent(pinNum: 9)),
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
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINAddEvent(pinNum: 0)),
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
                    onPressed: () => BlocProvider.of<CreatePINBloc>(context)
                        .add(const CreatePINEraseEvent()),
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
  static const String createPIN = 'Create a passcode';
  static const String reEnterYourPIN = 'Repeat the passcode';
  static const String passDescription = 'Passcode protects your wallet';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePINBloc, CreatePINState>(
      buildWhen: (previous, current) =>
          previous.firstPIN != current.firstPIN ||
          previous.secondPIN != current.secondPIN,
      builder: (context, state) {
        return Column(
          children: [
            Text(
              state.pinStatus == PINStatus.enterFirst
                  ? createPIN
                  : reEnterYourPIN,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 25,
                fontFamily: FontFamily.redHatMedium,
              ),
            ),
            const Gap(5),
            const Text(
              passDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontFamily: FontFamily.redHatMedium,
              ),
            ),
            const Gap(70),
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

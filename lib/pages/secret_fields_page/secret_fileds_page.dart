import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../custom_widgets/loading_button.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../router.gr.dart';
import '../../store/text_editing_controller/text_editing_controller.dart';

@RoutePage()
class SecretFieldsPage extends HookWidget {
  const SecretFieldsPage({Key? key, required this.qrData}) : super(key: key);
  final String qrData;

  @override
  Widget build(BuildContext context) {
    final _textFieldStore = useMemoized(TextFieldStore.new);
    final _focusNodeFieldOne = useMemoized(FocusNode.new);
    final _focusNodeFieldTwo = useMemoized(FocusNode.new);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              const Text(
                'Fill in secret fields',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'RedHatBold',
                ),
              ).paddingHorizontal(),
              Observer(
                builder: (context) {
                  return Stack(
                    children: [
                      Container(height: 500),
                      Positioned(
                        top: 40,
                        child: SizedBox(
                          height: 168,
                          child: Assets.images.secretfileds.image(),
                        ).paddingHorizontal(37),
                      ),
                      Visibility(
                        visible: _textFieldStore.isItemOneSelected,
                        child: Positioned(
                          top: 240,
                          child: const Text(
                            'Scan QR or type in the Secret 1:',
                            style: TextStyle(
                              fontFamily: 'RedHatMedium',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ).paddingHorizontal(),
                        ),
                      ),
                      Visibility(
                        visible: _textFieldStore.isItemTwoSelected,
                        child: Positioned(
                          top: 240,
                          child: const Text(
                            'Scan QR or type in the Secret 2:',
                            style: TextStyle(
                              fontFamily: 'RedHatMedium',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ).paddingHorizontal(),
                        ),
                      ),
                      Positioned(
                        left: 37,
                        top: 68,
                        child: ScaleTap(
                          enableFeedback: false,
                          onPressed: () {
                            _textFieldStore.selectItemOne();
                            FocusScope.of(context)
                                .requestFocus(_focusNodeFieldOne);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 59,
                            width: 146,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: _textFieldStore.keyOne.length == 30
                                    ? Colors.transparent
                                    : Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(
                              child: Text(
                                _textFieldStore.keyOne,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'RedHatSemiBold',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _textFieldStore.keyOne.length == 30,
                        child: Positioned(
                          left: 37,
                          top: 68,
                          child: Row(
                            children: [
                              Container(
                                height: 59,
                                width: 6,
                                color: const Color(0xFF84D882),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 193,
                        top: 68,
                        child: ScaleTap(
                          enableFeedback: false,
                          onPressed: () {
                            _textFieldStore.selectItemTwo();
                            FocusScope.of(context)
                                .requestFocus(_focusNodeFieldTwo);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 59,
                            width: 146,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: _textFieldStore.keyTwo.length == 30
                                    ? Colors.transparent
                                    : Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(
                              child: Text(
                                _textFieldStore.keyTwo,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'RedHatSemiBold',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _textFieldStore.keyTwo.length == 30,
                        child: Positioned(
                          right: 51,
                          top: 68,
                          child: Row(
                            children: [
                              Container(
                                height: 59,
                                width: 6,
                                color: const Color(0xFF84D882),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _textFieldStore.fieldTwoSelected,
                        child: Positioned(
                          top: 270,
                          left: 16,
                          right: 16,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFF4A83E0)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Observer(
                              builder: (context) {
                                return TextFormField(
                                  onFieldSubmitted: (_) {},
                                  keyboardType: TextInputType.name,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                      top: 8,
                                      left: 10,
                                      right: 10,
                                    ),
                                    suffixIcon: ScaleTap(
                                      onPressed: () {},
                                      child: Container(
                                        width: 21,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: Assets.icons.qricon.image(),
                                      ),
                                    ),
                                  ),
                                  focusNode: _focusNodeFieldTwo,
                                  onChanged: (_) {
                                    _textFieldStore.setKeyTwo();
                                  },
                                  controller: _textFieldStore.keyTwoController,
                                  onTapOutside: (_) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _textFieldStore.fieldOneSelected,
                        child: Positioned(
                          top: 270,
                          left: 16,
                          right: 16,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFF4A83E0)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Observer(
                              builder: (context) {
                                return TextFormField(
                                  keyboardType: TextInputType.name,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                      top: 8,
                                      left: 10,
                                      right: 10,
                                    ),
                                    suffixIcon: ScaleTap(
                                      onPressed: () {
                                        context.pushRoute(
                                          const SecondQrScanner(),
                                        );
                                      },
                                      child: Container(
                                        width: 21,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: Assets.icons.qricon.image(),
                                      ),
                                    ),
                                  ),
                                  focusNode: _focusNodeFieldOne,
                                  onChanged: (_) {
                                    _textFieldStore.setKeyOne();
                                  },
                                  controller: _textFieldStore.keyOneController,
                                  onTapOutside: (_) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 98,
                        right: 97,
                        top: 333,
                        child: LoadingButton(
                          onPressed: () {},
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'RedHatSemiBold',
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

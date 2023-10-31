import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../models/card_model/card_model.dart';
import '../../providers/screen_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/card_name_sate/card_name_sate.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../dashboard/dashboard.dart';

class CardNameChangeModal extends StatefulWidget {
  const CardNameChangeModal({super.key, required this.card});

  final CardModel card;

  @override
  State<CardNameChangeModal> createState() => _CardNameChangeModalState();
}

class _CardNameChangeModalState extends State<CardNameChangeModal> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();
  final _nameState = CardNameState();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              const Gap(12),
              Assets.icons.notch.image(height: 4),
              const Gap(10),
              Row(
                children: [
                  const Gap(8),
                  IconButton(
                    onPressed: router.pop,
                    icon: const Icon(
                      Icons.close_sharp,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Rename the card',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FontFamily.redHatSemiBold,
                        fontSize: 17,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                ],
              ),
              const Gap(16),
              const Text(
                'New name',
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontSize: 14,
                ),
              ).expandedHorizontally().paddingHorizontal(16),
              const Gap(4),
              TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
                controller: _nameState.nameController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                style: const TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontSize: 16,
                  color: AppColors.primary,
                  fontWeight: FontWeight.normal,
                ),
                focusNode: _focusNode,
                onChanged: (value) {
                  _nameState.isEmpty();
                  value = _nameState.nameController.text;
                },
                onTapOutside: (_) {
                  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                },
                cursorColor: AppColors.secondaryButtons,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: widget.card.name,
                  hintStyle: TextStyle(
                    fontFamily: FontFamily.redHatLight,
                    color: AppColors.primaryTextColor.withOpacity(0.5),
                    fontSize: 14,
                  ),
                  fillColor: AppColors.silver,
                ),
              ).paddingHorizontal(12),
              const Gap(8),
              const Text(
                'Once you rename it, the new name will be shown on the face side of of your card.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.redHatMedium,
                  color: Colors.black38,
                ),
              ).paddingHorizontal(16),
              const Spacer(),
              Observer(
                builder: (context) {
                  return LoadingButton(
                    onPressed: _nameState.isButtonEnabled
                        ? () async {
                            _balanceStore.changeCardNameAndSave(
                              cardAddress: widget.card.address,
                              newName: _nameState.nameController.text,
                            );
                            await router.pop();
                            await Future.delayed(
                              const Duration(milliseconds: 100),
                            );
                            await router.pop(const Dashboard());
                            showTopSnackBar(
                              displayDuration: const Duration(
                                milliseconds: 600,
                              ),
                              Overlay.of(context),
                              CustomSnackBar.success(
                                backgroundColor:
                                    const Color(0xFF4A4A4A).withOpacity(0.9),
                                message: 'Your card name was changed',
                                textStyle: const TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ).paddingHorizontal(60);
                },
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../models/bar_model/bar_model.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/card_name_sate/card_name_sate.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button/loading_button.dart';

class BarNameChangeModal extends StatefulWidget {
  const BarNameChangeModal({super.key, required this.bar});

  final BarModel bar;

  @override
  State<BarNameChangeModal> createState() => _BarNameChangeModalState();
}

class _BarNameChangeModalState extends State<BarNameChangeModal> {
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
                      'Rename the bar',
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
                  LengthLimitingTextInputFormatter(24),
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
                  filled: true,
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
                  hintText: widget.bar.name,
                  hintStyle: TextStyle(
                    fontFamily: FontFamily.redHatLight,
                    color: AppColors.primaryTextColor.withOpacity(0.8),
                    fontSize: 14,
                  ),
                  fillColor: Colors.grey.withOpacity(0.1),
                ),
              ).paddingHorizontal(12),
              const Gap(8),
              const Text(
                'Once you rename it, the new name will be shown on the face side of of your bar.',
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
                            _balanceStore.changeBarNameAndSave(
                              barAddress: widget.bar.address,
                              newName: _nameState.nameController.text,
                            );
                            await router.pop();
                            await Future.delayed(
                              const Duration(milliseconds: 100),
                            );
                            await router.pop();
                            await recordAmplitudeEventPartTwo(const CardNameChanged(walletType: 'Bar'));
                            showTopSnackBar(
                              displayDuration: const Duration(
                                milliseconds: 600,
                              ),
                              Overlay.of(context),
                              CustomSnackBar.success(
                                backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                                message: 'Your bar name was changed',
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

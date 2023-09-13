import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../models/bar_model/bar_model.dart';

class CardNameChangeModal extends StatefulWidget {
  const CardNameChangeModal({super.key, required this.bar});

  final BarModel bar;

  @override
  State<CardNameChangeModal> createState() => _CardNameChangeModalState();
}

class _CardNameChangeModalState extends State<CardNameChangeModal> {
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
      child: Column(
        children: [
          const Gap(12),
          Assets.icons.notch.image(height: 4),
          const Gap(10),
          Row(
            children: [
              const Gap(8),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
            style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 14),
          ).expandedHorizontally().paddingHorizontal(16),
          const Gap(4),
          TextField(
            focusNode: _focusNode,
            onTapOutside: (_) {
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            },
            cursorColor: AppColors.secondaryButtons,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryButtonColor,
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
              hintText: widget.bar.barName,
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
            'Once you rename it, the new name will be shown on the face side of of your bar.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamily.redHatMedium,
              color: Colors.black38,
            ),
          ).paddingHorizontal(16),
        ],
      ),
    );
  }
}
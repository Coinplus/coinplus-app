import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/buttons/button_settings.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/bar_model/bar_model.dart';
import '../../providers/screen_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../dashboard/dashboard.dart';

class RemoveBar extends StatefulWidget {
  const RemoveBar({super.key, required this.bar});

  final BarModel bar;

  @override
  State<RemoveBar> createState() => _RemoveBarState();
}

class _RemoveBarState extends State<RemoveBar> with TickerProviderStateMixin {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    startAnimation();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(-0.5, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 409,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
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
                  'Remove the bar',
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
          const Gap(30),
          AnimatedBuilder(
            animation: _slideAnimation,
            builder: (ctx, child) {
              return SlideTransition(
                position: _slideAnimation,
                child: Assets.images.cardForm.image(
                  height: 84,
                ),
              );
            },
          ),
          const Gap(27),
          const Text(
            'Your Coinplus Bitcoin bar will be deleted from your wallet permanently!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamily.redHatMedium,
              color: AppColors.primary,
            ),
          ).paddingHorizontal(31),
          const Gap(32),
          LoadingButton(
            onPressed: () async {
              await _balanceStore.getSelectedBar(widget.bar.address);
              await router.pop();
              _balanceStore.removeSelectedBar();
              showTopSnackBar(
                displayDuration: const Duration(
                  milliseconds: 600,
                ),
                Overlay.of(context),
                const CustomSnackBar.success(
                  backgroundColor: Color(0xFF4A4A4A),
                  message: 'Your bar was removed',
                  textStyle: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              );
              await router.pop(const Dashboard());
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ).paddingHorizontal(64),
          const Gap(15),
          LoadingButton(
            onPressed: router.pop,
            style: context.theme
                .buttonStyle(
                  buttonType: ButtonTypes.TRANSPARENT,
                  textStyle: const TextStyle(
                    fontFamily: FontFamily.redHatSemiBold,
                    color: AppColors.primaryTextColor,
                    fontSize: 17,
                  ),
                )
                .copyWith(
                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                ),
            child: const Text(
              'Not sure',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await _controller.forward();
  }
}

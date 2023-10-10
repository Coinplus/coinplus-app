import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../store/contact_us_state/contact_us_state.dart';
import '../../../utils/curved_app_bar.dart';
import '../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../widgets/custom_snack_bar/top_snack.dart';
import '../../../widgets/loading_button.dart';

@RoutePage()
class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _mailFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();

  ContactUsStore get store => GetIt.I<ContactUsStore>();

  @override
  void initState() {
    super.initState();

    store
      ..nameController = TextEditingController(text: '')
      ..mailController = TextEditingController(text: '')
      ..messageController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    store.nameController.dispose();
    store.mailController.dispose();
    store.messageController.dispose();
    _mailFocusNode.dispose();
    _nameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            iconTheme: const IconThemeData(color: Colors.white, size: 25),
            toolbarHeight: 80,
            title: const Text(
              'Any feedback or suggestion \nwould be appreciated',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: FontFamily.redHatMedium,
              ),
            ),
            flexibleSpace: CustomPaint(
              size: const Size(390, 166),
              painter: RPSCustomPainter(),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(30),
                const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: FontFamily.redHatMedium,
                  ),
                ).paddingHorizontal(14),
                const Gap(20),
                const Text(
                  'Full name *',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 15,
                  ),
                ).paddingHorizontal(16),
                const Gap(5),
                TextField(
                  focusNode: _nameFocusNode,
                  style: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.normal,
                  ),
                  onChanged: (_) {
                    store.isEmpty();
                  },
                  controller: store.nameController,
                  onTapOutside: (_) {
                    WidgetsBinding.instance.focusManager.primaryFocus
                        ?.unfocus();
                  },
                  onEditingComplete: _nameFocusNode.nextFocus,
                  cursorColor: AppColors.secondaryButtons,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
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
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 10,
                    ),
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      fontFamily: FontFamily.redHatLight,
                      color: AppColors.primaryTextColor.withOpacity(0.5),
                      fontSize: 14,
                    ),
                    fillColor: AppColors.silver,
                  ),
                ).paddingHorizontal(16),
                const Gap(20),
              ],
            ),
          ),
          Observer(
            builder: (context) {
              return SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email *',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 15,
                      ),
                    ).paddingHorizontal(16),
                    const Gap(5),
                    TextFormField(
                      style: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 16,
                        color: AppColors.primary,
                        fontWeight: FontWeight.normal,
                      ),
                      focusNode: _mailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      controller: store.mailController,
                      onEditingComplete: () {
                        if (!_mailFocusNode.hasFocus &&
                            store.mailController.text.isNotEmpty) {
                          store.validateEmail(store.mailController.text);
                        }
                      },
                      onChanged: (value) {
                        store
                          ..isEmpty()
                          ..validateEmail(value);
                      },
                      onFieldSubmitted: (_) {
                        _mailFocusNode.nextFocus();
                        store.mailController.text.isEmpty
                            ? store.isEmailValid = true
                            : store.validateEmail(store.mailController.text);
                      },
                      onTapOutside: (_) {
                        if (store.mailController.text.isNotEmpty) {
                          store.validateEmail(store.mailController.text);
                        }
                        WidgetsBinding.instance.focusManager.primaryFocus
                            ?.unfocus();
                      },
                      cursorColor: AppColors.secondaryButtons,
                      decoration: InputDecoration(
                        errorText:
                            store.isEmailValid ? null : 'Invalid email address',
                        errorStyle: const TextStyle(color: Colors.red),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
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
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          fontFamily: FontFamily.redHatLight,
                          color: AppColors.primaryTextColor.withOpacity(0.5),
                          fontSize: 14,
                        ),
                        fillColor: AppColors.silver,
                      ),
                    ).paddingHorizontal(16),
                    const Gap(20),
                  ],
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Message *',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 15,
                  ),
                ).paddingHorizontal(16),
                const Gap(5),
                TextField(
                  style: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.normal,
                  ),
                  onChanged: (_) {
                    store.isEmpty();
                  },
                  controller: store.messageController,
                  minLines: 10,
                  maxLines: 20,
                  onTapOutside: (_) {
                    WidgetsBinding.instance.focusManager.primaryFocus
                        ?.unfocus();
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
                    hintText: 'Write your message...',
                    hintStyle: TextStyle(
                      fontFamily: FontFamily.redHatLight,
                      color: AppColors.primaryTextColor.withOpacity(0.5),
                      fontSize: 14,
                    ),
                    fillColor: AppColors.silver,
                  ),
                ).paddingHorizontal(16),
                const Gap(20),
              ],
            ),
          ),
          Observer(
            builder: (context) {
              return SliverToBoxAdapter(
                child: LoadingButton(
                  onPressed: store.isButtonEnabled && store.isEmailValid
                      ? () async {
                          await store.sendEmail();

                          store.mailController.text = '';
                          store.nameController.text = '';
                          store.messageController.text = '';
                          store.isButtonEnabled = false;
                          showTopSnackBar(
                            displayDuration: const Duration(
                              milliseconds: 400,
                            ),
                            Overlay.of(context),
                            const CustomSnackBar.success(
                              backgroundColor: Color(0xFF4A4A4A),
                              message: 'Your feedback has been sent',
                              textStyle: TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ).paddingHorizontal(60),
              );
            },
          ),
        ],
      ),
    );
  }
}

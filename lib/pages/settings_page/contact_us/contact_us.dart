import 'dart:async';
import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/contact_us_state/contact_us_state.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../utils/curved_app_bar.dart';
import '../../../widgets/loading_button.dart';
import '../../all_alert_dialogs/email_send_alert/email_send_alert.dart';

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
  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

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
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.white,
              statusBarColor: Colors.transparent,
            ),
            iconTheme: const IconThemeData(color: Colors.white, size: 25),
            toolbarHeight: 110,
            centerTitle: true,
            title: const Text(
              'Hi there 👋\nHow can we help?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
                fontFamily: FontFamily.redHatMedium,
              ),
            ),
            flexibleSpace: CustomPaint(
              size: const Size(50, 200),
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
                  autocorrect: false,
                  enableSuggestions: false,
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
                    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                  },
                  onEditingComplete: _nameFocusNode.nextFocus,
                  cursorColor: AppColors.secondaryButtons,
                  decoration: InputDecoration(
                    filled: true,
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
                    hintText: 'Enter your full name',
                    hintStyle: TextStyle(
                      fontFamily: FontFamily.redHatLight,
                      color: AppColors.primaryTextColor.withOpacity(0.5),
                      fontSize: 14,
                    ),
                    fillColor: Colors.grey.withOpacity(0.1),
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
                      autocorrect: false,
                      enableSuggestions: false,
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
                        if (!_mailFocusNode.hasFocus && store.mailController.text.isNotEmpty) {
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
                        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                      },
                      cursorColor: AppColors.secondaryButtons,
                      decoration: InputDecoration(
                        filled: true,
                        errorText: store.isEmailValid ? null : 'Invalid email address',
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
                        fillColor: Colors.grey.withOpacity(0.1),
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
                  autocorrect: false,
                  enableSuggestions: false,
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
                    hintText: 'Write your message...',
                    hintStyle: TextStyle(
                      fontFamily: FontFamily.redHatLight,
                      color: AppColors.primaryTextColor.withOpacity(0.5),
                      fontSize: 14,
                    ),
                    fillColor: Colors.grey.withOpacity(0.1),
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
                          unawaited(recordAmplitudeEvent(const SendMessageClicked()));
                          await sendEmail();
                          store.mailController.text = '';
                          store.nameController.text = '';
                          store.messageController.text = '';
                          store.isButtonEnabled = false;
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
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: Gap(40),
          ),
        ],
      ),
    );
  }

  Future<void> sendEmail() async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_tfaf84u';
    const templateId = 'template_in2otz2';
    const userId = 'pcZtAC06-Rn1w2mgC';

    unawaited(
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return Center(
            child: SizedBox(
              height: 60,
              width: 60,
              child: Lottie.asset(
                'assets/animated_logo/loading_animation.json',
              ),
            ),
          );
        },
      ),
    );
    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'from_name': store.nameController.text,
            'message': store.messageController.text,
            'reply_to': store.mailController.text,
          },
        }),
      );
      if (response.statusCode == 200) {
        await router.pop();
        await emailSendAlert(context, _walletProtectState);
      } else {
        await router.pop();
        await emailSendFailAlert(context, _walletProtectState);
      }
    } catch (error) {
      await router.pop();
      await emailSendFailAlert(context, _walletProtectState);
    }
  }
}

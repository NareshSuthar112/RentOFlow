import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Utils/AppColors.dart';
import '../Utils/ImagePath.dart';
import '../Utils/constants.dart';
import '../Views/simple_button.dart';
import '../Views/simple_text_view.dart';
import 'Providers/otp_screen_provider.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpTextString = ref.watch(otpText);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.getSize(context, 3.4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Constants.setHeightAndWidth(context, height: 4),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Constants.getSize(context, 4)),
                      child: Image.asset(ImagePath.infoScreenLogo),
                    ),
                    Constants.setHeightAndWidth(context, height: 4.9),
                    SimpleTextView(
                      text: 'Enter OTP',
                      color: AppColors.otpLabelTextColor,
                      size: 2.4,
                      weight: FontWeight.w800,
                    ),
                    Constants.setHeightAndWidth(context, height: 1.5),
                    OtpTextField(
                      numberOfFields: 4,
                      borderColor: Colors.black,
                      borderWidth: Constants.getSize(context, 0.1),
                      showFieldAsBox: true,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        ref.read(otpText.notifier).state = verificationCode;
                      }, // end onSubmit
                    ),
                    Constants.setHeightAndWidth(context, height: 3.9),
                    Hero(
                      tag: 'button',
                      child: SimpleButton(
                        height: 5.7,
                        horizontalPadding: 4.9,
                        onClick: () {
                          print(otpTextString);
                        },
                        color: AppColors.buttonColor,
                        title: "Verify",
                        radius: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Constants.getSize(context, 6.7)),
            child: SimpleTextView(
              text: "© 2024 RentOFlow. All rights reserved.",
              color: Colors.black,
              size: 1.6,
              weight: FontWeight.w800,
            ),
          ),
        ],
      )),
    );
  }
}

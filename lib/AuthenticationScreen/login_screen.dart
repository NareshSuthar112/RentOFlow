import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_flow_project/Utils/AppColors.dart';
import 'package:rent_flow_project/Views/simple_text_view.dart';

import '../Utils/ImagePath.dart';
import '../Utils/constants.dart';
import '../Views/simple_button.dart';
import 'Providers/login_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = ref.watch(phoneTextController);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Constants.setHeightAndWidth(context, height: 0.5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Constants.getSize(context, 4)),
                      child: Image.asset(ImagePath.infoScreenLogo),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Constants.getSize(context, 4)),
                      child: Image.asset(
                        ImagePath.loginScreenTopMobileImg,
                        height: Constants.getSize(context, 22),
                        width: Constants.getSize(context, 22),
                      ),
                    ),
                    Constants.setHeightAndWidth(context, height: 1.6),
                    Container(
                      alignment: Alignment.center,
                      height: Constants.getSize(context, 6),
                      margin: EdgeInsets.symmetric(
                          horizontal: Constants.getSize(context, 4)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              Constants.getSize(context, 0.6)),
                          border: Border.all(
                              color: AppColors.normalDarkGrey,
                              width: Constants.getSize(context, 0.1))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Constants.getSize(context, 1)),
                        child: TextFormField(
                          controller: textController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              label: SimpleTextView(
                                text: 'Email/Phone number',
                                color: Colors.black,
                                size: 1.2,
                              )),
                        ),
                      ),
                    ),
                    Constants.setHeightAndWidth(context, height: 4.8),
                    SimpleButton(
                      height: 5.7,
                      horizontalPadding: 4.9,
                      onClick: () {
                        print(ref.read(phoneTextController).text);
                      },
                      color: AppColors.buttonColor,
                      title: "Send OTP",
                      radius: 1.3,
                    ),
                    Constants.setHeightAndWidth(context, height: 5.3),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Constants.getSize(context, 3.1)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.normalGrey,
                              height: 0,
                              thickness: Constants.getSize(context, 0.1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Constants.getSize(context, 1)),
                            child: SimpleTextView(
                              text: 'Or Sign in with',
                              color: AppColors.normalGrey,
                              size: 1.2,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.normalGrey,
                              height: 0,
                              thickness: Constants.getSize(context, 0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Constants.setHeightAndWidth(context, height: 3.1),
                    SimpleButton(
                      height: 5.7,
                      horizontalPadding: 4.9,
                      onClick: () {},
                      color: Colors.white,
                      title: "Sign in with Google",
                      radius: 1.3,
                      borderColor: AppColors.normalDarkGrey,
                      isBorder: true,
                      elevationSize: 0,
                    ),
                    Constants.setHeightAndWidth(context, height: 1.5),
                    SimpleButton(
                      height: 5.7,
                      horizontalPadding: 4.9,
                      onClick: () {},
                      textColor: Colors.white,
                      color: AppColors.normalLightBlue,
                      title: "Sign in with Facebook",
                      radius: 1.3,
                    ),
                    Constants.setHeightAndWidth(context, height: 1.8),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Don’t have an account? ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: Constants.getSize(context, 1.4))),
                      TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                              color: AppColors.buttonColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Constants.getSize(context, 1.5)))
                    ]))
                  ],
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
        ),
      ),
    );
  }
}

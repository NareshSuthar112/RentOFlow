import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_flow_project/Utils/AppColors.dart';
import 'package:rent_flow_project/Utils/ImagePath.dart';
import 'package:rent_flow_project/Utils/constants.dart';
import 'package:rent_flow_project/Utils/screen_path.dart';
import 'package:rent_flow_project/Views/simple_button.dart';
import 'package:rent_flow_project/Views/simple_text_view.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Constants.setHeightAndWidth(context, height: 4.2),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Constants.getSize(context, 4)),
                  child: Image.asset(ImagePath.infoScreenLogo),
                ),
                Constants.setHeightAndWidth(context, height: 7.5),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Constants.getSize(context, 2.5)),
                  child: Image.asset(
                    ImagePath.infoScreenBannerImg,
                    fit: BoxFit.fill,
                    width: Get.size.width,
                  ),
                ),
                Constants.setHeightAndWidth(context, height: 10.7),
                Hero(
                  tag: 'button',
                  child: SimpleButton(
                    height: 5.7,
                    horizontalPadding: 4.9,
                    onClick: () {
                      Get.offAllNamed(ScreenPath.loginScreen);
                    },
                    color: AppColors.buttonColor,
                    title: "Get Started",
                    radius: 1.3,
                  ),
                ),
              ],
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

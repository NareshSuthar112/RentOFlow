import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_flow_project/Utils/AppColors.dart';
import 'package:rent_flow_project/Utils/ImagePath.dart';
import 'package:rent_flow_project/Utils/constants.dart';
import 'package:rent_flow_project/Utils/screen_path.dart';

import '../Utils/shared_preferences_data_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //_controller = AnimationController(vsync: this);
    splashDelayTime();
  }

  void splashDelayTime() async {
    await Future.delayed(const Duration(seconds: 2));
    // Get.off(const LoginScreen());

    var isLogin = await SharedPreferencesDataModel.readBoolData(
        SharedPreferencesDataModel.isLogin);

    if (isLogin != null && isLogin) {
    } else {
      Get.offAllNamed(ScreenPath.infoScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Center(
        child: Image.asset(
          ImagePath.splashAppLogo,
          fit: BoxFit.fill,
          height: Constants.getSize(context, 10),
          width: Constants.getSize(context, 10),
        ),
      ),
    );
  }
}

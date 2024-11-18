// lib/config/app_routes.dart
import 'package:get/get.dart';
import 'package:rent_flow_project/AuthenticationScreen/info_screen.dart';
import 'package:rent_flow_project/AuthenticationScreen/splash_screen.dart';

import 'login_screen.dart';
import 'otp_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(), // Default route
    ),
    GetPage(
      name: '/loginScreen',
      page: () => const LoginScreen(),
      transition: Transition.fade, // Login screen
    ),
    GetPage(
      name: '/infoScreen',
      page: () => const InfoScreen(), // Login screen
    ),
    GetPage(
      name: '/OtpScreen',
      page: () => const OtpScreen(),
      transition: Transition.fade, // Login screen
    ),
  ];
}

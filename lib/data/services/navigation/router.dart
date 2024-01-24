import 'package:squareme/data/services/navigation/routes.dart';
import 'package:squareme/view/auth/base.dart';
import 'package:squareme/view/auth/intro/index.dart';
import 'package:squareme/view/auth/login/index.dart';
import 'package:squareme/view/auth/register/index.dart';
import 'package:flutter/material.dart';
import 'package:squareme/view/auth/register/verify.dart';
import 'package:squareme/view/auth/set_pin/confirm_pin.dart';
import 'package:squareme/view/auth/set_pin/index.dart';
import 'package:squareme/view/auth/success.dart';
import 'package:squareme/view/dashboard/index.dart';

class CustomRouter {
  CustomRouter._();

  static generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // AUTH
      case Routes.intro:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const IntroPage());

      case Routes.authBase:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AuthBasePage());

      case Routes.register:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const RegisterPage());

      case Routes.verifyOtp:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const VerifyOtpPage());

      case Routes.login:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginPage());

      case Routes.success:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) =>
                SuccessPage(successData: settings.arguments as SuccessData));

      case Routes.setPin:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SetPinPage());

      case Routes.confirmPin:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ConfirmPinPage());


      // DASHBOARD
      case Routes.base:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DashboardPage());
    }
  }
}

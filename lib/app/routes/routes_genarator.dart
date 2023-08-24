import 'package:flutter/material.dart';
import 'package:flutter_assignment_lovoj/app/routes/paths.dart';
import 'package:flutter_assignment_lovoj/view/auth/signup/sign_up_page.dart';

import '../../view/ui.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Paths.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Paths.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Paths.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case Paths.verifyOtpRoute:
        return MaterialPageRoute(
            builder: (context) => VerifyOtpPage(
                data: setting.arguments as Map<String, dynamic>));
      case Paths.dashBoardRoute:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}

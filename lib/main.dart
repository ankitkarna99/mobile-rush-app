import 'package:first_app/themes/app_themes.dart';
import 'package:first_app/views/dashboard/dashboard_view.dart';
import 'package:first_app/views/forgot/forgot_view.dart';
import 'package:first_app/views/login/login_view.dart';
import 'package:first_app/views/signup/signup_view.dart';
import 'package:first_app/views/splash/splash_view.dart';
import 'package:first_app/views/terms/terms_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashView(),
        "/login": (context) => const LoginView(),
        "/signup": (context) => const SignUpView(),
        "/forgot": (context) => const ForgotView(),
        "/terms": (context) => const TermsView(),
        "/home": (context) => const DashboardView(),
      },
    );
  }
}

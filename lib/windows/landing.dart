import 'package:flutter/material.dart';
import 'package:flutter_application_1/windows/auth.dart';
import 'package:flutter_application_1/windows/home.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLogIn = false;
    return isLogIn ? HomePage() : AuthorizationPage();
  }
}

import 'package:best_courses/constants/functions.dart';
import 'package:best_courses/constants/images.dart';
import 'package:best_courses/screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: splashIcon(
        logo,
        backgroundColor: Colors.white,
        nextScreen: const Login(),
      ),
    );
  }
}

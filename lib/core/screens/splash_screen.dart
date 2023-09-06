import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tafeel/modules/students/presentation/screens/users_screen.dart';

import '../constants/assets/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 2000,
        splashIconSize: double.infinity,
        splash: Center(child: Image.asset(AppImages.splash, fit: BoxFit.cover, width: 250)),
        nextScreen: UsersScreen(),
      ),
    );
  }
}

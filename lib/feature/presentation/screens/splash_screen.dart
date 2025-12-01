import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shobra_store_app/feature/presentation/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: HomeScreen(),
      duration: 3000,
      centered: true,
      splash: Column(
        children: [
          Image.asset('assets/images/shubra logo.png'),
          Expanded(
            child: Lottie.asset(
              'assets/images/Animation - 1744956806670 (1).json',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

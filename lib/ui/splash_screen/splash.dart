import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:reposit_it/app.dart';
import 'package:reposit_it/global_home_index.dart';
import 'package:reposit_it/ui/mobile/boot_check/boot_checker.dart';
import 'package:reposit_it/ui/mobile/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:reposit_it/ui/onboarding/onboard_screen.dart';
import 'package:rive/rive.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    //Screen Sizes
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return AnimatedSplashScreen(
        backgroundColor: Color(0xFFE0E0E0),
        splash: RiveAnimation.asset(
          'assets/ntech.riv',
        ),
        animationDuration: const Duration(milliseconds: 3800),
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: height,
        nextScreen: BootChecker());
  }
}

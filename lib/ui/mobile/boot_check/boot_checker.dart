import 'package:flutter/material.dart';
import 'package:reposit_it/ui/global_home_index.dart';
import 'package:reposit_it/ui/onboarding/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/login.dart';

class BootChecker extends StatefulWidget {
  const BootChecker({super.key});

  @override
  State<BootChecker> createState() => _BootCheckerState();
}

class _BootCheckerState extends State<BootChecker> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data == true ? OnBoardingPage() : Login();
          }

          return Container();
        });
  }

  Future<bool> checkFirstTime() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isFirstTime = sp.getBool('initialBoot') ?? true;

    if (isFirstTime) {
      await sp.setBool('initialBoot', false);
    }

    return isFirstTime;
  }
}

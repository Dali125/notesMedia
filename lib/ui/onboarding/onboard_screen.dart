import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:reposit_it/global_home_index.dart';
import 'package:reposit_it/ui/mobile/custom_button/custom_button.dart';
import 'package:reposit_it/ui/mobile/register/register_page.dart';
import 'button.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'A reader lives a thousand lives',
              body: 'The man who never reads lives only one.',
              image: buildImage('assets/ebook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Past Papers and Notes',
              body: 'Available right at your fingerprints',
              image: buildImage('assets/readingbook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Simple UI',
              body: 'For enhanced reading experience',
              image: buildImage('assets/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Today a reader, tomorrow a leader ',
              body: 'Start your journey',
              footer: Center(
                child: ColorfulButton(
                  height: 80,
                  width: 170,
                  onTap: () {
                    Get.to(() => Register());
                  },
                  text: 'Register Now',
                ),
              ),
              image: buildImage('assets/learn.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text('Continue as Guest',
              style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text(
            'Skip',
            style: TextStyle(
                color:
                    Get.isDarkMode == true ? Colors.lightBlue : Colors.black),
          ),
          onSkip: () => goToHome(context),
          next: Icon(
            Icons.arrow_forward,
            color: Get.isDarkMode == true ? Colors.lightBlue : Colors.black,
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Get.isDarkMode == true
              ? Theme.of(context).primaryColor
              : Colors.white,

          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const GlobalHomeIndex()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Get.isDarkMode == true ? Colors.white : Colors.black,
        //activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize: 20),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Get.isDarkMode == true ? Colors.black : Colors.white,
      );
}

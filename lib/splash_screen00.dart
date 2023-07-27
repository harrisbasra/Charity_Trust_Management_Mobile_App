
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'Sign_IN.dart';
import 'main.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Center(
        child: Image.asset('assets/images/img.png'),
      ),
      screenFunction: () async {
        return sign_in();
      },
      duration: 1700,
      splashIconSize: 10000.0,
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.rightToLeftWithFade,
      animationDuration: Duration(seconds: 1),
    );
  }
}

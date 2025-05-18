import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taskone/dashboard/nav_bar.dart';
class splash_animated extends StatelessWidget {
  const splash_animated({super.key});

  @override
  Widget build(BuildContext context) {
    return   AnimatedSplashScreen(
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: 200,
        backgroundColor: Colors.greenAccent,
        splashTransition: SplashTransition.rotationTransition,
        splash: const CircleAvatar(
          radius:50,
          backgroundImage: AssetImage("assets/images/TargetTwirl.png"),), nextScreen:const NavBar());
  }
}

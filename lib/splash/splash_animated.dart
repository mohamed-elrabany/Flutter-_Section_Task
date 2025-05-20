import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_taskone/dashboard/nav_bar.dart';
import 'package:flutter_taskone/login/login_page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashAnimated extends StatelessWidget {
  const SplashAnimated({Key? key}) : super(key: key);

  Future<Widget> _getNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('logged_in') ?? false;
    return loggedIn ? const NavBar() : const LoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _getNextScreen(),
      builder: (context, snapshot) {
        // While we’re loading SharedPreferences
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Once we have the target, pass it in:
        return AnimatedSplashScreen(
          splash: const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/TargetTwirl.png"),
          ),
          splashIconSize: 200,
          backgroundColor: Colors.greenAccent,
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.fade,
          nextScreen: snapshot.data!,
        );
      },
    );
  }
}

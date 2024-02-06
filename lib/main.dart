import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/home_screen.dart';
import 'package:vipr_watch_mobile_application/screens/onboarding_screen.dart';
import 'package:vipr_watch_mobile_application/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: AnimatedSplashScreen(
  //       splash: Image.asset(
  //         'assets/images/logo.png',
  //       ),
  //       nextScreen: const WelcomeScreen(),
  //       splashIconSize: 600,
  //       splashTransition: SplashTransition.fadeTransition,
  //       backgroundColor: Colors.black,
  //       duration: 2000,
  //     ),
  //   );
    Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    );
    }
  }
// import 'dart:async';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:vipr_watch_mobile_application/screens/onboarding_screen.dart';
// import 'package:vipr_watch_mobile_application/screens/welcome_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AnimatedSplashScreen(
//         splash: Image.asset(
//           'assets/images/logo/logo.png',
//           gaplessPlayback: true,
//         ),
//         splashIconSize: 800,
//         splashTransition: SplashTransition.fadeTransition,
//         backgroundColor: Colors.black,
//         nextScreen: Container(),
//       ),
//     );
//   }
//
// // slow splash screen
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 2), () {
//       precacheImage(const AssetImage('assets/images/login/login3.jpg'), context);
//       Navigator.pushAndRemoveUntil(context,
//           MaterialPageRoute(builder: (context) => const WelcomeScreen()), (route) => false);
//     });
//   }
// }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     body: Center(
//   //       child: Hero(
//   //         tag: 'logo',
//   //         child: Image.asset(
//   //           'assets/images/logo.png',
//   //           width: 600,
//   //           height: 600,
//   //         ),
//   //       ),
//   //       ),
//   //         backgroundColor: Colors.black,
//   //     );
//   // }
//
// // import 'package:vipr_watch_mobile_application/screens/welcome_screen.dart';
// //
// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({super.key});
// //
// //   @override
// //   _SplashScreenState createState() => _SplashScreenState();
// //
// // }
// //
// // class _SplashScreenState extends State<SplashScreen> {
// //   bool _showSplash = true;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Simulate some loading time (e.g., fetching data, initializing resources)
// //     Future.delayed(const Duration(seconds: 2), () {
// //       setState(() {
// //         _showSplash = false;
// //       });
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedSwitcher(
// //       duration: const Duration(milliseconds: 500),
// //       child: _showSplash
// //           ? SplashScreenLoding()
// //           : const WelcomeScreen(),
// //     );
// //   }
// // }
// //
// // class SplashScreenLoding extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Center(
// //         child: Image.asset(
// //           'assets/images/logo.png',
// //           width: 600,
// //           height: 600,
// //         ),
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vipr_watch_mobile_application/bindings/general_bindings.dart';

class App extends StatelessWidget {
  const App({super.key});

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
    return  GetMaterialApp(
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

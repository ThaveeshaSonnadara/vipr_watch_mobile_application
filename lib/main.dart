import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vipr_watch_mobile_application/new/application/screens/login/login.dart';
import 'package:vipr_watch_mobile_application/firebase_options.dart';
import 'package:vipr_watch_mobile_application/screens/home_screen.dart';
import 'package:vipr_watch_mobile_application/screens/onboarding_screen.dart';
import 'package:vipr_watch_mobile_application/screens/splash_screen.dart';
import 'package:vipr_watch_mobile_application/screens/welcome_screen.dart';

import 'app.dart';
import 'new/application/repositories/authentication_repository.dart';
import 'new/application/screens/image_input/image_input.dart';

Future<void> main() async {
  // Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // GetX local storage
  await GetStorage.init();

  // Await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

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
      home: ImageInput(),
    );
  }
}

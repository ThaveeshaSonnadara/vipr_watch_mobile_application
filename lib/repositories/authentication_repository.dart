import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:vipr_watch_mobile_application/screens/onboarding/onboarding.dart';
import 'package:vipr_watch_mobile_application/utills/login_or_register.dart';
import 'dart:io';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  get context => null;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    
    // // check whether that the device is connected to the internet or not
    // final hasInternet = await InternetConnectionChecker().hasConnection;
    // if (hasInternet) {
    //
      // store the boolean value in a storage to check that the user first time on application or not
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginOrRegister ())
          : Get.offAll(const OnBoardingScreen ());
    }
//     else {
//       errorPopUp();
//     }
//   }
//
//   // method to pop out a message if the device is not connected to internet
//   void errorPopUp() async {
//
//       String msg = 'Your device is not connected to a network !\n check your network connection.';
//       String title = 'Network Connection Failed';
//       String imgPath = 'assets/images/image_process/network error.json';
//
//     await Dialogs.materialDialog(
//       context: context,
//         msg: msg,
//         title: title,
//         lottieBuilder: Lottie.asset(
//           imgPath,
//           fit: BoxFit.contain,
//         ),
//         titleAlign: TextAlign.center,
//         color: Colors.green.shade100,
//         msgAlign: TextAlign.center,
//         titleStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
//             fontWeight: FontWeight.w500,
//             fontFamily: 'Poppins',
//             color: Colors.red,
//             fontSize: 26),
//         msgStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
//             fontWeight: FontWeight.w500,
//             fontFamily: 'Poppins',
//             color: Colors.black,
//             fontSize: 16),
//         actions: [
//           IconsOutlineButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (e) => exit(0), // exit from the app
//                 ),
//               );
//             },
//             text: 'Close',
//             color: Colors.white,
//             iconData: Icons.cancel_rounded,
//             textStyle: const TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
//             iconColor: Colors.black,
//           ),
//         ]);
//   }
}

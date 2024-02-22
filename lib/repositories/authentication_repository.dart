import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/login/login.dart';
import '../screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.erase();
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

  /*---------- Email and Password sign-in ----------*/

  /// EmailAutehntication = sign in
  /// EmailAutehntication = Register
  Future<UserCredential> registeringUsingEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message as String; // Use e.message directly
    } on FirebaseException catch (e) {
      throw e.message as String;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message as String;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

/// EmailVerification = mail verification
  ///  ReAuthenticate = re-authenticate users
  ///  EmailAutehntication = forget password

  /*---------- Federated identity and social sign-in ----------*/
  ///Google
  ///Facebook


  /*---------- end Federated identity and social sign-in ----------*/
  ///logoutuser = valid for any type of authentication
  ///deleteuser = remove user auth and firestore account
}



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:vipr_watch_mobile_application/new/application/screens/signup/loaders.dart';
import 'package:vipr_watch_mobile_application/utills/popups/full_screen_loader.dart';
import '../screens/signup/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();


  ///Variables
  final hidePassword = true.obs;  //hide password
  final privacyPolicy = true.obs; //observation for privacy policy acceptance
  final email = TextEditingController();  //email controller
  final lastName = TextEditingController(); //last name controller
  final userName = TextEditingController();  //username controller
  final password = TextEditingController();  //password controller
  final firstName = TextEditingController();  //first name controller
  final phoneNumber = TextEditingController(); //phone number controller
  GlobalKey<FormState> signupformKey = GlobalKey<FormState>(); //form key for form validation

  ///SIGNUP
  Future<void> signUp() async {
    try {
      //Start loading
      FullScrrenLoader.openLoadingDialog(
          'we are processing your information...',
          'assets/animations/loading_Animation1.json');

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected)
        return;


      //form validation
      if (!signupformKey.currentState!.validate())
        return;


      //privacy policy check
      //register user in the firebase authentication and save user data in the firebase
      //save authenticaion user data in the firebase firestore
      //show success message
      //move to verify email screen
    } catch (e) {
      //show some generic error to the user
      Loaders.errorsSnackBar(title: 'Error', message: e.toString());
    } finally {
      //remove loaders
      FullScrrenLoader.stopLoading();
    }
  }
}

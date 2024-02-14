import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipr_watch_mobile_application/new/application/repositories/authentication_repository.dart';
import 'package:vipr_watch_mobile_application/new/application/repositories/user_repository.dart';
import 'package:vipr_watch_mobile_application/new/application/screens/signup/Verify_Email.dart';
import 'package:vipr_watch_mobile_application/new/application/screens/signup/loaders.dart';
import 'package:vipr_watch_mobile_application/utills/popups/full_screen_loader.dart';
import '../screens/signup/User_Model.dart';
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
  void signUp() async {
    try {
      //Start loading
      FullScrrenLoader.openLoadingDialog(
          'we are processing your information...',
          'assets/animations/loading_Animation1.json');

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScrrenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupformKey.currentState!.validate()) {
        FullScrrenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In order to cretae account you must accept the privacy policy'
        );
        return;
      }
      //register user in the firebase authentication and save user data in the firebase

      final userCredential=await AuthenticationRepository.instance.registeringUsingEmailAndPassword(email.text.trim(), password.text.trim());

      //save authentication user data in the firebase firestore
      final user = UserModel(
        id: userCredential.user!.uid,
        firstname: firstName.text.trim(),
        lastname: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phonenumber: phoneNumber.text.trim() // Provide the actual phone number here
      );


      final userRepo = Get.put(UserRepository());
      await userRepo.saveDataToFirestore(user);

      //remove loader
      FullScrrenLoader.stopLoading();

      //show success message
      Loaders.successsnackbar(
          title: 'Success',
          message: 'Account created successfully'
      );
      //move to verify email screen
      Get.to(() => const VerifyEmailPage());
    } catch (e) {
      FullScrrenLoader.stopLoading();
      //show some generic error to the user
      Loaders.errorsSnackBar(title: 'Error', message: e.toString());
    }
  }
}

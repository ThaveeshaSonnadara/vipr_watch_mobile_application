import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipr_watch_mobile_application/utills/popups/full_screen_loader.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName= TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupformKey = GlobalKey<FormState>();

  ///SIGNUP
  Future<void> signUp() async {

    try{
      //Start loading
      FullScrrenLoader.openLoadingDialog('we are processing your information...', 'assets/animations/loading.json');



    }finally{




    }
  }

}
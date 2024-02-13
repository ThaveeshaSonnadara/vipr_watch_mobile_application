import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:vipr_watch_mobile_application/new/application/controllers/Signup_Controller.dart';
import 'package:vipr_watch_mobile_application/new/application/screens/signup/Verify_Email.dart';
import 'package:vipr_watch_mobile_application/new/application/screens/login/new/login.dart';
import 'package:vipr_watch_mobile_application/new/application/validators/validation.dart';

import 'Fb_Google_Icon.dart';
import 'Or_signin_with.dart';
import 'SignupForm.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.green),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () { Get.to(()=> const LoginScreen() ); },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            ///Title
            Text(
              'Let us create your account',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.green),
            ),
            const SizedBox(height: 32.0),

            ///Form
            SignUpForm(),
            const SizedBox(height: 16.0),

            ///Divider
            const Or_signin_with(),

            const SizedBox(height: 32.0),

            ///Footer
            const Fb_Google_icon(),
          ]),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../controllers/Signup_Controller.dart';
import '../../validators/validation.dart';
import '../login/login.dart';
import 'Fb_Google_Icon.dart';
import 'Or_signin_with.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      key: controller.signupformKey,
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
            Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.firstName,
                          validator: (value)=> Validation.validateEmpty('First Name',value),
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            prefixIcon: Icon(Iconsax.user),
                          ),
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: TextFormField(
                          controller: controller.lastName,
                          validator: (value)=> Validation.validateEmpty('Last Name',value),
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            prefixIcon: Icon(Iconsax.user),
                          ),
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  ///Username
                  TextFormField(
                    validator: (value)=> Validation.validateEmpty('User Name',value),
                    controller: controller.userName,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Iconsax.user_edit),
                    ),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16.0),

                  ///Email
                  TextFormField(
                    validator: (value)=> Validation.validateEmail(value),
                    controller: controller.email,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Iconsax.direct),
                    ),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16.0),

                  ///Phone number
                  TextFormField(
                    validator: (value)=> Validation.validatePhoneNumber(value),
                    controller: controller.phoneNumber,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Iconsax.call),
                    ),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16.0),

                  ///Password
                  TextFormField(
                    validator: (value)=> Validation.validatePassword(value),
                    controller: controller.password,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: Icon(Iconsax.eye_slash),
                    ),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16.0),

                  ///Terms and condition checkbox
                  Row(
                    children: [
                      SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: Checkbox(value: true, onChanged: (value) {})),
                      const SizedBox(width: 16.0),
                      const Text.rich(TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'i agree to the terms and conditions and privacy policy',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 12.0)),
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  ///Create account button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.signUp(),
                      child: const Text('Create Account'),
                    ),
                  ),
                ],
              ),
            ),
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

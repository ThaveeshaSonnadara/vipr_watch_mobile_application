import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:vipr_watch_mobile_application/new/application/screens/signup/termsandConditions.dart';

import '../../controllers/Signup_Controller.dart';
import '../../validators/validation.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignUpController = Get.put(SignupController());
    return Form(
      key: SignUpController.signupformKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  controller: SignUpController.firstName,
                  validator: (value) =>
                      Validation.validateEmpty('First Name', value),
                  expands: false,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: TextFormField(
                  controller: SignUpController.lastName,
                  validator: (value) =>
                      Validation.validateEmpty('Last Name', value),
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
            validator: (value) => Validation.validateEmpty('User Name', value),
            controller: SignUpController.userName,
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
            validator: (value) => Validation.validateEmail(value),
            controller: SignUpController.email,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Iconsax.direct),
            ),
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16.0),

          ///Phone number
          TextFormField(
            validator: (value) => Validation.validatePhoneNumber(value),
            controller: SignUpController.phoneNumber,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              prefixIcon: Icon(Iconsax.call),
            ),
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16.0),

          ///Password
          Obx(
            () => TextFormField(
              validator: (value) => Validation.validatePassword(value),
              controller: SignUpController.password,
              obscureText: SignUpController.hidePassword.value,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => SignUpController.hidePassword.value =
                        !SignUpController.hidePassword.value,
                    icon: Icon(SignUpController.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
              ),
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          const SizedBox(height: 16.0),

          ///Terms and condition checkbox
          const TermsandConditions(),
          const SizedBox(height: 16.0),

          ///Create account button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => SignUpController.signUp(),
              child: const Text('Create Account'),
            ),
          ),
        ],
      ),
    );
  }
}

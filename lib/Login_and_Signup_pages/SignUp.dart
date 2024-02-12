import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:vipr_watch_mobile_application/Login_and_Signup_pages/Fb_Google_Icon.dart';
import 'package:vipr_watch_mobile_application/Login_and_Signup_pages/Or_signin_with.dart';
import 'package:vipr_watch_mobile_application/Login_and_Signup_pages/Verify_Email.dart';
import 'package:vipr_watch_mobile_application/Login_and_Signup_pages/login.dart';

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
            Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
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
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Iconsax.user_edit),
                    ),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16.0),

                  ///Email
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Iconsax.direct),
                    ),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16.0),

                  ///Phone number
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Iconsax.call),
                    ),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16.0),

                  ///Password
                  TextFormField(
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
                      onPressed: () => Get.to(()=>const VerifyEmailPage()),
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

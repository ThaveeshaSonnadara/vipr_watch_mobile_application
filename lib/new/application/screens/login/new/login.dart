import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:vipr_watch_mobile_application/screens/signup_screen.dart';

import '../../signup/Fb_Google_Icon.dart';
import '../../signup/Or_signin_with.dart';
import '../../signup/SignUp.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 56.0,
            left: 24.0,
            bottom: 24.0,
            right: 24.0,
          ),
          child: Column(
            children: [
              /// Logo, Title, and Subtitle
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image(
                  image: AssetImage('assets/images/logo/vipericon.png'),
                  height: 200,
                ),
                Text(
                  ' Welcome Back ',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.green),
                ),
                const SizedBox(height: 8.0),
              ]),

              ///Form
              Form(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      children: [
                        ///Email
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelText: 'Email',
                          ),
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 16.0),
                        //space between email and password

                        ///password
                        TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.password_check),
                              labelText: 'Password',
                              hintText: 'Enter your email',
                              suffixIcon: Icon(Iconsax.eye_slash)),
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 8.0),

                        ///Remember me and Forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///Remember me
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                const Text(
                                  'Remember me',
                                  style:
                                      TextStyle(color: Colors.deepPurpleAccent),
                                ),
                              ],
                            ),

                            ///Forgot password
                            TextButton(
                                onPressed: () {},
                                child: const Text('Forgot password?')),
                          ],
                        ),
                        const SizedBox(height: 16.0),

                        ///Sign in Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Sign in'),
                          ),
                        ),
                        const SizedBox(height: 16.0),

                        ///Create Account Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => Get.to(() => const SignupPage()),
                            child: const Text('Create Account'),
                          ),
                        ),
                      ],
                    )),
              ),
              ///Divider
              Or_signin_with(),

              const SizedBox(height: 32.0),

              ///Footer
              Fb_Google_icon(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

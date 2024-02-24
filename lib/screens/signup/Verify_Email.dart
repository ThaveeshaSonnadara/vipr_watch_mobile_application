import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login.dart';
import 'SuccessScreen.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.green),
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        //padding to give default equal space on all sides in all screnns
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              ///Image
              const Image(
                image: AssetImage('assets/images/logo/ConfirmMail.png'),
                height: 320,
                width: 320,
              ),
              const SizedBox(height: 32.0),

              /// Title and subtitle
              Text(
                'Verify your email address',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                    fontSize: 26),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),

              Text('isankavimukthi3456@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                      fontSize: 16)),
              const SizedBox(height: 16.0),

              Text(
                  'Congratulation! Your Account Await: Verify Your Email to start shopping and Experience a world of unrivaled Deals and personalized Offers',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                      fontSize: 14)),
              const SizedBox(height: 32.0),

              ///Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const SuccessScreen()),
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Resend Email'),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

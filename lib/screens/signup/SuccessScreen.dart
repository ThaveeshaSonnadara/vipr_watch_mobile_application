import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../login/login.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///Image
              const Image(
                image: AssetImage('assets/images/logo/account succes.png'),
                height: 320,
                width: 320,
              ),
              const SizedBox(height: 32.0),

              /// Title and subtitle
              Text(
                'Your account successfully created!',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                    fontSize: 26),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                  'Welcome to the ultimate snake sanctuary! Your account is now ready to unlock the joy of discovery and help you become a true reptile expert.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                      fontSize: 14)),
              const SizedBox(height: 32.0),

              ///Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: 56.0,
    left: 24.0,
    bottom: 24.0,
    right: 24.0,
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipr_watch_mobile_application/Login_and_Signup_pages/SignUp.dart';
import 'package:vipr_watch_mobile_application/Login_and_Signup_pages/login.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.green),
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear),)
        ],
      ),
      body:  SingleChildScrollView(
        //padding to give default equal space on all sides in all screnns
        child: Padding(padding: EdgeInsets.all(24),
        child: Column(
          children: [
            ///Image
            Image(
              image: AssetImage(''),
            ),
            /// Title and subtitle

            ///Buttons
          ],
        ),
      ),
      ),
      backgroundColor: Colors.black,
    );
  }
  static double ScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}

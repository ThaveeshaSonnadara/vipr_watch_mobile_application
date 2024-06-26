import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/widgets/my_textfield.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future _resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset link sent check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.green),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'FORGET PASSWORD',
            style: TextStyle(
              fontSize: 30,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 25),

          const Text(
            'Enter your Email and we will send you a link to reset your password',
            style: TextStyle(color: Colors.green),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),


          ///email
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
            child: MyTestField(
                hintText: "Email",
                obscureText: false,
                controller: _emailController),
          ),
          const SizedBox(height: 10),

          MaterialButton(
              onPressed: _resetPassword,
              color: Colors.green,
              textColor: Colors.white,
              child: const Text('Send Email')),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/snake_catchers/SnakeCatchers.dart';
import 'package:vipr_watch_mobile_application/utills/helper_function.dart';
import 'package:vipr_watch_mobile_application/widgets/MyTest_Field.dart';
import 'package:vipr_watch_mobile_application/widgets/Mybutton.dart';

import '../../widgets/navigation_menu.dart';
import 'forgetpassword/ForgetPassword.dart';

class Login_page extends StatefulWidget {
  final void Function()? onTap;

  const Login_page({super.key, required this.onTap});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  ///TextEditingController
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  ///login function
  void login() async {
    ///show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    ///try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      ///pop loading circle
      if (context.mounted) Navigator.pop(context);

      ///Navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SnakeCatchers()), // Replace HomePage with your actual home page
      );
    }

    ///display error message
    on FirebaseAuthException catch (e) {
      ///pop loading circle
      Navigator.pop(context);
      displaymessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///logo
                Icon(
                  Icons.person,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25),

                ///app name
                const Text(
                  'ViprWatch',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 50),

                ///email
                MyTestField(
                    hintText: "Email",
                    obscureText: false,
                    controller: emailController),
                const SizedBox(height: 10),

                ///password
                MyTestField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 10),

                ///forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgetPassword();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                ///sign in button
                MyButton(
                  text: 'Login',
                  onTap: login,
                ),
                const SizedBox(height: 25),

                ///dont have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register here',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

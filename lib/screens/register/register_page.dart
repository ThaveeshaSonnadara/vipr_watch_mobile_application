import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vipr_watch_mobile_application/utills/helper_function.dart';
import 'package:vipr_watch_mobile_application/widgets/MyTest_Field.dart';
import 'package:vipr_watch_mobile_application/widgets/Mybutton.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ///TextEditingController
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPwController = TextEditingController();

  ///register function
  Future<void> register() async {
    ///show loading
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    ///make sure passwod match
    if (passwordController.text != confirmPwController.text) {
      ///pop loading circle
      Navigator.pop(context);

      ///show error message
      displaymessageToUser('password do not match!!', context);
    }

    ///if password match
    else {
      ///try creating the user
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        ///create a user document and add to firestore
        createUserDocument(userCredential);

        ///pop loading circle
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        ///pop loading circle
        Navigator.pop(context);

        ///display error message
        displaymessageToUser(e.code, context);
      }
    }
  }

  ///create a user document and collect them in firestore
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': userNameController.text,
      });
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
                  'Vipr Watch',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 50),

                ///username textfield
                MyTestField(
                    hintText: "Username",
                    obscureText: false,
                    controller: userNameController),
                const SizedBox(height: 10),

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
                    controller: passwordController),
                const SizedBox(height: 10),

                ///confirm password
                MyTestField(
                    hintText: "Confirm Password",
                    obscureText: true,
                    controller: confirmPwController),
                const SizedBox(height: 25),

                ///register button
                MyButton(
                  text: 'register',
                  onTap: register,
                ),
                const SizedBox(height: 25),

                ///dont have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'login here',
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

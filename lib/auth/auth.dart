import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/HomeScreen/SearchSnake.dart';
import 'package:vipr_watch_mobile_application/utills/login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          /// user is logged in
          if (snapshot.hasData){
            return const SearchPage(); //put home page here
          }
          /// user is not logged in
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}

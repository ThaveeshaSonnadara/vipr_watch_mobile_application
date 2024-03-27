import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/login/login_page.dart';
import 'package:vipr_watch_mobile_application/screens/register/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State <LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  ///intially show login page
  bool showLoginpage = true;

  ///toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginpage){
      return  LoginPage(onTap: togglePages);
    }else{
      return  RegisterPage(onTap: togglePages);
    }
  }
}

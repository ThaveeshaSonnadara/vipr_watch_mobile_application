import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/signin_screen.dart';
import 'package:vipr_watch_mobile_application/screens/signup_screen.dart';
import 'package:vipr_watch_mobile_application/widgets/welcome_button.dart';
import '../widgets/custom_scaffold.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
    child: Column(
     children: [
       Flexible(
         flex: 8,
           child: Container(
             padding: const EdgeInsets.symmetric(
               vertical: 0,
               horizontal: 40.0,
             ),
             child: Center(child: RichText(
               textAlign: TextAlign.center,
               text: const TextSpan(
                 children: [
                   TextSpan(
                     text: 'Welcome\n\n',
                     style: TextStyle(
                       fontSize: 55.0,
                       fontWeight: FontWeight.w600,
                     )
                   ),
                   TextSpan(
                     text: '\n\n\nViprWatch\n\n\n',
                     style: TextStyle(
                       fontSize: 40.0,
                       color: Colors.green,
                       fontWeight:  FontWeight.w600,
                     )
                   ),
                 ]
               ),
             )),
           )),
       const Flexible(
         flex: 1,
           child: Align(
             alignment: Alignment.bottomRight,
             child: Row(
               children: [
                 Expanded(
                   child: WelcomeButton(
                     buttonText: "Sign in",
                     onTap: SignInScreen(),
                     color: Colors.transparent,
                     textColor: Colors.green,
                   ),
                 ),
                 Expanded(
                   child: WelcomeButton(
                     buttonText: "Sign up",
                     onTap: SignUpScreen(),
                     color: Colors.green,
                     textColor: Colors.black,
                   ),
                 ),
               ],
             ),
           )
       ),
     ], 
    ),
    );
  }
}
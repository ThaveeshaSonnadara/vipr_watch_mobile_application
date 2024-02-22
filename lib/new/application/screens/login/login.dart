import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 56.0,
            left: 24.0,
            bottom: 24.0,
            right: 24.0,
          ),
          child: Column(
            children: [
              /// Logo, Title, and Subtitle
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Image(
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
                            prefixIcon: Icon(Iconsax.direct_right,),
                            labelText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        //space between email and password

                        ///password
                        TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.password_check,),
                              labelText: 'Password',
                              hintText: 'Enter your email',
                              suffixIcon: Icon(Iconsax.eye_slash)),
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
                                      TextStyle(color: Colors.green),
                                ),
                              ],
                            ),

                            ///Forgot password
                            TextButton(
                                onPressed: () {},
                                child: const Text('Forgot password?',
                                    style: TextStyle(
                                        color: Colors.green))),
                          ],
                        ),
                        const SizedBox(height: 16.0),

                        ///Sign in Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Sign in', style: TextStyle(
                                color: Colors.black)),
                          ),
                        ),
                        const SizedBox(height: 16.0),

                        ///Create Account Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text('Create Account', style: TextStyle(
                                color: Colors.green)),
                          ),
                        ),
                      ],
                    )),
              ),

              ///Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    'or Sign in with',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const Flexible(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),

              ///Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      // border: Border.all(color: Colors.green,),
                      // borderRadius: BorderRadius.circular(100),
                    ),
                    child: Logo(Logos.google),
                    // child: const Image(
                    //   width: 35,
                    //   height: 35,
                    //   image: AssetImage(
                    //       'assets/images/logo/googleicon-removebg.png'),
                    ),
                  const SizedBox(width: 16.0),
                  Container(
                    decoration: const BoxDecoration(
                      // border: Border.all(color: Colors.green),
                      // borderRadius: BorderRadius.circular(100),
                    ),
                    child: Logo(Logos.facebook_f,),
                    // child: const Image(
                    //   width: 35,
                    //   height: 35,
                    //   image: AssetImage('assets/images/logo/FacebookLogo.png'),
                    ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

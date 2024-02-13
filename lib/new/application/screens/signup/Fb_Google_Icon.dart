import 'package:flutter/material.dart';

class Fb_Google_icon extends StatelessWidget {
  const Fb_Google_icon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child : const Image(
            width: 35,
            height:35,
            image: AssetImage('assets/images/logo/googleicon-removebg.png'),
          ),
        ),
        const SizedBox(width: 16.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child : const Image(
            width: 35,
            height:35,
            image: AssetImage('assets/images/logo/FacebookLogo.png'),
          ),
        ),
      ],
    );
  }
}

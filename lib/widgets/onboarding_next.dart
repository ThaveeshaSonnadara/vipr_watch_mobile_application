import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/controllers/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24.0,
      bottom: kBottomNavigationBarHeight + 5,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: Colors.green),
        child: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,),
      ),
    );
  }
}
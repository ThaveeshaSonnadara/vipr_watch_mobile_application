import 'package:flutter/material.dart';
import '../controllers/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: kToolbarHeight,
        right: 24.0,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text(
            "Skip",
            style: TextStyle(color: Colors.green, fontSize: 18),
          ),
        ));
  }
}

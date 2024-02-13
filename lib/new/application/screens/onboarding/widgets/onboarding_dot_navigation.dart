import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vipr_watch_mobile_application/new/application/controllers/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: kBottomNavigationBarHeight + 25,
      left: 24.0,
      child: SmoothPageIndicator(
        count: 4,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: const ExpandingDotsEffect(
            activeDotColor: Colors.green, dotHeight: 6),
      ),
    );
  }
}

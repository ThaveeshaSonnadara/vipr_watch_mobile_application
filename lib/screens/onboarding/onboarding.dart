import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipr_watch_mobile_application/screens/onboarding/image_strings.dart';
import 'package:vipr_watch_mobile_application/screens/onboarding/text_strings.dart';

import '../../controllers/onboarding_controller.dart';
import '../../widgets/onboarding_dot_navigation.dart';
import '../../widgets/onboarding_next.dart';
import '../../widgets/onboarding_page.dart';
import '../../widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: BImages.onBoardingImage1,
                title: BTexts.onBoardingTitle1,
                subTitle: BTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: BImages.onBoardingImage2,
                title: BTexts.onBoardingTitle2,
                subTitle: BTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: BImages.onBoardingImage3,
                title: BTexts.onBoardingTitle3,
                subTitle: BTexts.onBoardingSubTitle3,
              ),
              OnBoardingPage(
                image: BImages.onBoardingImage4,
                title: BTexts.onBoardingTitle4,
                subTitle: BTexts.onBoardingSubTitle4,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

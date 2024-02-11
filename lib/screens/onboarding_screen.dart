// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vipr_watch_mobile_application/screens/welcome_screen.dart';
//
// import 'home_screen.dart';
//
// class OnboardingScreen extends StatefulWidget {
//
//   const OnboardingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   late PageController _pageController;
//
//   int _pageIndex = 0;
//   bool onLastPage = false;
//
//   @override
//   void initState() {
//     _pageController = PageController(initialPage: 0);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: PageView.builder(
//                   itemCount: slideData.length,
//                   controller: _pageController,
//                   onPageChanged: (index) {
//                     setState(() {
//                       _pageIndex = index;
//                       onLastPage = index == slideData.length - 1;
//                     });
//                   },
//                   itemBuilder: (context, index) =>
//                       OnboardContent(
//                         image: slideData[index].image,
//                         title: slideData[index].title,
//                         description: slideData[index].description,
//                       ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   const Spacer(),
//                   ...List.generate(
//                       slideData.length,
//                           (index) =>
//                           Padding(
//                             padding: const EdgeInsets.only(right: 4),
//                             child: DotIndicator(isActive: index == _pageIndex,),
//                           )
//                   ),
//                   const Spacer(),
//                   const Spacer(),
//                   const Spacer(),
//                   const Spacer(),
//                   const Spacer(),
//                   const Spacer(),
//                   SizedBox(
//                     child:
//                     ElevatedButton(
//                       onPressed: onLastPage ? () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) {
//                                 return const HomeScreen();
//                               }
//                           ),
//                         );
//                       }
//                           : () {
//                         _pageController.nextPage(
//                             duration: const Duration(milliseconds: 300),
//                             curve: Curves.ease);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         shape: const CircleBorder(),
//                       ),
//                       child: onLastPage ? SvgPicture.asset(
//                         'assets/images/logo/home.svg',
//                         width: 60,
//                         height: 60,
//                         fit: BoxFit.scaleDown,)
//                           : SvgPicture.asset(
//                         'assets/images/logo/right_arrow.svg',
//                         width: 60,
//                         height: 60,
//                         fit: BoxFit.scaleDown,),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.black,
//     );
//   }
// }
//
// class DotIndicator extends StatelessWidget {
//   const DotIndicator({Key? key, this.isActive = false}) : super(key: key);
//
//   final bool isActive;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       height: isActive ? 14 : 4,
//       width: 5,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(12)),
//         color: isActive ? Colors.green.withOpacity(1.0): Colors.green,
//       ),
//     );
//   }
// }
//
// class Onboard {
//   final String image, title, description;
//
//   Onboard ({
//     required this.image,
//     required this.title,
//     required this.description,
//   });
// }
//
// final List<Onboard> slideData = [
//   Onboard(
//       image: 'assets/images/onboarding/onboarding_screen12.jpg',
//       title: 'Secure Serpent Trails',
//       description: 'Step into the Safe Trails Prelude, where your adventure begins with a harmony of safety.'
//   ),
//
//   Onboard(
//       image: 'assets/images/onboarding/onboarding_screen22.jpg',
//       title: 'Capture & Clarify the Unknown',
//       description: 'Witness the unseen as you capture and unveil the secrets within every image.'
//   ),
//
//   Onboard(
//       image: 'assets/images/onboarding/onboarding_screen3.jpg',
//       title: 'Deep Dive into Snake Species',
//       description: 'Embark on a snake search odyssey with our detailed exploration of snake species.'
//   ),
//
//   Onboard(
//       image: 'assets/images/onboarding/onboarding_screen4.jpg',
//       title: 'Emergency Care Center',
//       description: 'Discover the Emergency Aid Alcove, designed for quick and efficient responses.'
//   ),
// ];
//
// class OnboardContent extends StatelessWidget {
//
//   const OnboardContent({Key? key, required this.image, required this.title, required this.description}) : super(key: key);
//
//   final String image, title, description;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: [
//           const Spacer(),
//           ClipRRect(borderRadius: BorderRadius.circular(10.0),
//           child:  Image.asset(
//               image, height: 300, width: 300, fit: BoxFit.cover,
//             ),
//           ),
//           const Spacer(),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: Theme
//                 .of(context)
//                 .textTheme
//                 .titleLarge!
//                 .copyWith(
//                 fontWeight: FontWeight.w500, color: Colors.green, fontSize: 26),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             description,
//             textAlign: TextAlign.center,
//             style: const TextStyle(color: Colors.green, fontSize: 16),
//           ),
//           const Spacer(),
//         ]
//     );
//   }
// }
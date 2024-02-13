import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 80.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              image: AssetImage(image),
              height: 350,
              width: 350,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w500, color: Colors.green, fontSize: 26),
          ),
          const SizedBox(height: 16.0),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

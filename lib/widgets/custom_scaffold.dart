import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child, this.needAppBar,});
  final Widget? child;
  final bool? needAppBar;

  @override
  Widget build(BuildContext context) {
    return needAppBar! ? Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
          children: [
            Image.asset(
              'assets/images/login/login3.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            SafeArea(
              child: child!,
            ),
          ],
      ),
      backgroundColor: Colors.black,
    )
    : Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/login/login3.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: child!,
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}


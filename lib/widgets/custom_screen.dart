import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({super.key, this.child});
  final Widget? child;
  // final int? pageIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: child!,
            ),
            bottomNavigationBar: Container(
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20),
                child: GNav(
                  backgroundColor: Colors.black,
                  color: Colors.green,
                  activeColor: Colors.black,
                  tabBackgroundColor: Colors.green,
                  gap: 8,
                  padding: EdgeInsets.all(16),
                  tabs: [
                    GButton(
                        icon: Icons.home,
                        text: 'Home'),
                    GButton(
                        icon: Icons.camera_rounded,
                        text: 'Scan'),
                    GButton(
                        icon: Icons.search,
                        text: 'Search'),
                    GButton(
                        icon: Icons.person,
                        text: 'Profile'),
                  ],
                  // selectedIndex: pageIndex!,
                  // onTabChange: (index) {
                  //   setState((){
                  //     pageIndex! = index;
                  //   });
                  // },
                ),
              ),
            ),
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
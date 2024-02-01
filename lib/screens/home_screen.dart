import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.green,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.green,
            gap: 8,
            onTabChange: (index) { // to handle click event on each tab black and here index is the tab index
              print(index);
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
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
          ),
        ),
      ),
    );
  }
  
}
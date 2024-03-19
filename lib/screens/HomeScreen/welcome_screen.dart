import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vipr_watch_mobile_application/widgets/navigation_menu.dart';
import 'AboutUs.dart';
import 'package:vipr_watch_mobile_application/screens/login/Login_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.green),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Exit App?'),
                  content:
                  const Text('Are you sure you want to exit ViprWatch?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context), // Cancel
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () => exit(0), // Exit app
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          color: Colors.green[800],
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Text(
                    'ViprWatch',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  'About Us',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AboutUs()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout), // Changed icon to logout
                title: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  // Show LogOut dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Do you want to Logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context), // Cancel LogOut
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await auth.signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  Login_page(onTap: () {}), // Pass required parameters to Login_page constructor
                              ),
                            );
                          },
                          child: const Text('Ok', style: TextStyle(color: Colors.red)), // Ok button with red text color
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      drawerScrimColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(
    top: screenWidth*0.2,
        bottom: screenWidth*0.1,
        ),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/logo/logo.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              "ViprWatch",
              style: TextStyle(
                fontSize: screenWidth*0.1,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenWidth*0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: screenWidth * 0.4, // Adjust the fraction as needed
                  child: Material(
                    color: Colors.green[800],
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        final controller = Get.put(NavigationController());
                        controller.selectedIndex.value = 1;
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                        child: Center(
                          child: Text(
                            "Detect Snake",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.4, // Adjust the fraction as needed
                  child: Material(
                    color: Colors.green[800],
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        final controller = Get.put(NavigationController());
                        controller.selectedIndex.value = 2;
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                        child: Center(
                          child: Text(
                            "Search Snake",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

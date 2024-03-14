import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipr_watch_mobile_application/screens/HomeScreen/DetectSnake.dart';
import 'package:vipr_watch_mobile_application/widgets/navigation_menu.dart';
import '../image_input/image_input.dart';
import 'AboutUs.dart';
import 'LogOut.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        actions: [
          //  exit button
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.black),
            // Use exit icon and white color
            onPressed: () {
              //  exit action
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Exit App?'),
                  content: const Text('Are you sure you want to exit ViprWatch?'),
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
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
            color: Colors.green[800],
            child: ListView(children: [
              const DrawerHeader(
                child: Center(
                    child: Text(
                      'ViprWatch',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    )),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  'About Us',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const AboutUs()));
                },
              ),
              ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text(
                    'LogOut',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const LogOut()));
                  }),
            ])),
      ),
      drawerScrimColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(top: 150, bottom: 60),
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage('assets/images/logo/logo.png'),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "ViprWatch",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      final controller = Get.put(NavigationController());
                      controller.selectedIndex.value = 1;
                    },
                    child: const Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                Material(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      final controller = Get.put(NavigationController());
                      controller.selectedIndex.value = 2;
                    },
                    child: const Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}

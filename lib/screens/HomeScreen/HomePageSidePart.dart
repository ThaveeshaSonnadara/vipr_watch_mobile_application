import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/HomeScreen/my_drawer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,

      ),
      body: Container(
        child: const Center(
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
        padding: const EdgeInsets.only(
          top: 15,
        ),
        child: Column(
          children: [
            menuItem(),
          ],
        ));
  }

  Widget menuItem() {
    return Material(
      child: InkWell(
        onTap: () {},
        child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(children: [
              Expanded(
                child: Icon(
                  Icons.dashboard_outlined,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text("Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              )
            ])),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

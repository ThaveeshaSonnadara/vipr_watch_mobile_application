import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/HomeScreen/SearchSnake.dart';
import 'AboutUs.dart';
import 'LogOut.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        actions: [
          //  exit button
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.black), // Use exit icon and white color
            onPressed: () {
              //  exit action
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Exit App?'),
                  content: Text('Are you sure you want to exit ViprWatch?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context), // Cancel
                      child: Text('No'),
                    ),
                    TextButton(
                      onPressed: () => exit(0), // Exit app
                      child: Text('Yes'),
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
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    'ViprWatch',
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                  )
                ),
              ),

        ListTile(
        leading: Icon(Icons.person),
    title: Text(
    'About Us',
    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
    ),
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AboutUs()));
    },
        ),

        ListTile(
        leading: Icon(Icons.person),
    title: Text(
    'LogOut',
    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
    ),
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LogOut()));
    }
    ),
      ]


          )

        ),
      ),
      drawerScrimColor: Colors.black,
      body:  Container(
        padding: const EdgeInsets.only(top:150,bottom: 60),
        decoration: const BoxDecoration(
          color:Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/logo/logo.png'),
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("ViprWatch",style: TextStyle(
              fontSize: 50,color: Colors.white,
            ),),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(10),
              child:InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>SearchSnake()));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
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
                Material(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(10),
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>SearchSnake()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
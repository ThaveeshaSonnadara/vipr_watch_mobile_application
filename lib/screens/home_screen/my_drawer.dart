import 'package:flutter/material.dart';
class MyHeaderDrawer extends StatefulWidget{
  const MyHeaderDrawer({super.key});

  @override
  _MyHeaderDrawerState createState()=> _MyHeaderDrawerState();
}
class _MyHeaderDrawerState extends State<MyHeaderDrawer>{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.green[800],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/logo/logo.png')
                )
            ),
          ),
          const Text("ViprWatch",style: TextStyle(color: Colors.black,fontSize: 20),),
          const Text("Stay safe Stay Alert",style: TextStyle(color: Colors.black,fontSize: 14),),
        ],
      ),
    );
  }
}
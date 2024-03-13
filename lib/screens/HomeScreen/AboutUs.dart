import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget{
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: Text(
              "Team Elites",
                  style:TextStyle(color: Colors.green,fontSize: 35,fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "We are a group of second-year university students following the BEng(Hons)Software Engineering degree at the Informatics Insititute of Technology in collaboration with University of Westminster,UK.",
                style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 70,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/pics/thaveesha.jpg'),
                radius: 50,
              ),
              SizedBox(width: 20),
              Text(
                'Thaveesha\n Thilan',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 20), // Increased spacing between items
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/pics/ronath.jpg'),
                radius: 50,
              ),
              SizedBox(width: 10),
              Text(
                ' Ronath\n Tharana',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 70), // Spacing between rows
          // Second row with two images
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/pics/isanka.jpg'),
                radius: 50,
              ),
              SizedBox(width: 10),
              Text(
                ' Isanka\n Vimukthi',
                   style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 20),
              Padding(
                padding: EdgeInsets.only(right: 25),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/pics/dinuka.jpg'),
                radius: 50,
              ),
              SizedBox(width: 10),
              Text(
                ' Dinuka\n Himasha',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 70),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/pics/durangi.jpg'),
                radius: 50,
              ),
              SizedBox(width: 10),
              Text(
                '  Durangi\n  Nethmini',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
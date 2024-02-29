import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      child: Container(
        padding: EdgeInsets.only(top:150,bottom: 60),
        decoration: const BoxDecoration(
          color:Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/logo/logo.png'),


          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("ViprWatch",style: TextStyle(
              fontSize: 50,color: Colors.white,
            ),),
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(10),
              child:InkWell(
                onTap: (){},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30,horizontal: 25),
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
                    onTap: (){},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30,horizontal: 25),
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
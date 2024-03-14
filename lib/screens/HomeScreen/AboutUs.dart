import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Team Elites",
              style: TextStyle(color: Colors.green, fontSize: screenWidth * 0.1, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                "We are a group of second-year university students following the BEng(Hons)Software Engineering degree at the Informatics Institute of Technology in collaboration with University of Westminster, UK.",
                style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAvatarWithName('assets/images/pics/thaveesha.jpg', 'Thaveesha\nThilan', screenWidth),
                SizedBox(width: screenWidth * 0.22),
                _buildAvatarWithName('assets/images/pics/ronath.jpg', 'Ronath\nTharana', screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAvatarWithName('assets/images/pics/isanka.jpg', 'Isanka\nVimukthi', screenWidth),
                SizedBox(width: screenWidth * 0.22),
                _buildAvatarWithName('assets/images/pics/dinuka.jpg', 'Dinuka\nHimasha', screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAvatarWithName('assets/images/pics/durangi.jpg', '   Durangi\n   Nethmini', screenWidth),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarWithName(String imagePath, String name, double screenWidth) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: screenWidth * 0.1,
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

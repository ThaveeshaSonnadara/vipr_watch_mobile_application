import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:vipr_watch_mobile_application/screens/species_details/species_details.dart';
import 'package:vipr_watch_mobile_application/widgets/navigation_menu.dart';
import 'identify_snake.dart';
import 'package:material_dialogs/dialogs.dart';

class ImageProcessScreen extends StatefulWidget {
  const ImageProcessScreen({super.key, required this.path});

  final String path;

  @override
  State<ImageProcessScreen> createState() => _ImageProcessScreenState();
}

class _ImageProcessScreenState extends State<ImageProcessScreen> {
  List snakeDetails = [];
  late String snakeName;
  late int accuracy;
  List identifiedSnakeDetails = [];

  @override
  void initState() {
    super.initState();

    Future(() {
      popUpDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const NavigationMenu())); // Implement the back button functionality
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 300.0, 0.0, 0.0),
                child: CircularProgressIndicator(
                  color: Colors.green,
                  strokeWidth: 6.0,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'Processing...',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Colors.green,
                        fontSize: 30),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  getSnakeDetails() async {
    try {
      // check that the device is connected to the internet or not
      final hasInternet = await InternetConnectionChecker().hasConnection;
      if (hasInternet) {
        final String imagePath = widget.path;
        snakeDetails = await IdentifySnake().sendImage(imagePath); // pass the image file to the API and get the return data and store in a list
        print(imagePath);
      } else {
        errorPopUp();
      }
    } catch (e) {
      accuracy = 0;
    }
  }

  // method to check that the system should display the snake details or the error message
  Future<void> popUpDetails() async {
    await getSnakeDetails();
    print(snakeDetails);

    if (snakeDetails.isEmpty) {
      // Not to show the processing long time
      errorPopUp();
    } else {
      snakeName = await snakeDetails[0];
      accuracy = await snakeDetails[1];

      if (accuracy > 80) {
        await getIdentifiedSnakeDetails();
        print(identifiedSnakeDetails);
        AnimatedSnackBar.material(
          'Result Found!',
          type: AnimatedSnackBarType.success,
        ).show(context);
        snakeDetailsPopUp(snakeName, accuracy);
      } else {
        AnimatedSnackBar.material(
          'Result not Found!',
          type: AnimatedSnackBarType.error,
        ).show(context);
        failIdentifyPopUp();
      }
    }
  }

  // method to pop out identified snake details
  void snakeDetailsPopUp(String snakeName, int accuracy) async {
    await Dialogs.materialDialog(
        context: context,
        msg: 'Accuracy Level : $accuracy%\n\n\nDo you want more Details?',
        title: 'Snake Species Name :\n$snakeName',
        lottieBuilder: Lottie.asset(
          'assets/images/image_process/correct.json',
          fit: BoxFit.contain,
        ),
        titleAlign: TextAlign.center,
        color: Colors.green.shade100,
        msgAlign: TextAlign.center,
        titleStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 26),
        msgStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 16),
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => const NavigationMenu(),
                ),
              );
            },
            text: 'No',
            color: Colors.red,
            iconData: Icons.cancel_rounded,
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
            iconColor: Colors.white,
          ),
          IconsButton(
            onPressed: () {
              if (identifiedSnakeDetails.length > 5) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (e) => SnakeSpeciesDetailsScreen(
                      identifiedSnakeDetails: identifiedSnakeDetails,
                    ), //Snake details
                  ),
                );
              } else {
                errorPopUp();
              }
            },
            text: 'Yes',
            color: Colors.green,
            iconData: Icons.tag_faces_rounded,
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
            iconColor: Colors.white,
          ),
        ]);
  }

  // method to pop out a message if the snake is not identified
  void failIdentifyPopUp() async {
    await Dialogs.materialDialog(
        context: context,
        msg: 'Can not identify type of the Snake !',
        title: 'Identification Failed',
        lottieBuilder: Lottie.asset(
          'assets/images/image_process/warning.json',
          fit: BoxFit.contain,
        ),
        titleAlign: TextAlign.center,
        color: Colors.green.shade100,
        msgAlign: TextAlign.center,
        titleStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.red,
            fontSize: 26),
        msgStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 16),
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => const NavigationMenu(),
                ),
              );
            },
            text: 'Cancel',
            color: Colors.white,
            iconData: Icons.cancel_rounded,
            textStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
            iconColor: Colors.black,
          ),
        ]);
  }

  // method to pop out a error message if an error is occurred
  void errorPopUp() async {
    final hasInternet = await InternetConnectionChecker().hasConnection;
    late String msg;
    late String title;
    late String imgPath;

    // check that the device is connected to the internet or not
    if (hasInternet) {
      msg = 'An error occurred on the server !';
      title = 'Server Error';
      imgPath = 'assets/images/image_process/warning.json';
    } else {
      msg = 'Your internet connection is unstable !';
      title = 'Network Connection Failed';
      imgPath = 'assets/images/image_process/network error.json';
    }
    await Dialogs.materialDialog(
        context: context,
        msg: msg,
        title: title,
        lottieBuilder: Lottie.asset(
          imgPath,
          fit: BoxFit.contain,
        ),
        titleAlign: TextAlign.center,
        color: Colors.green.shade100,
        msgAlign: TextAlign.center,
        titleStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.red,
            fontSize: 26),
        msgStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 16),
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => const NavigationMenu(),
                ),
              );
            },
            text: 'Cancel',
            color: Colors.white,
            iconData: Icons.cancel_rounded,
            textStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
            iconColor: Colors.black,
          ),
        ]);
  }

  // get the details of the identified snake from the data base.
  Future<void> getIdentifiedSnakeDetails() async {
    QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore.instance
        .collection('Snake details and treatments')
        .where('Snake Name', isEqualTo: snakeName.toLowerCase())
        .get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> snakeInfo = snap.docs;
    if (snakeInfo.isNotEmpty) {
      setState(() {
        var identifiedDetails = snakeInfo[0].data();
        identifiedSnakeDetails = [
          snakeName,
          identifiedDetails['Snake Scientific Name'] ?? 'no data',
          identifiedDetails['Snake Sinhala Name'] ?? 'no data',
          identifiedDetails['Venomous Type'] ?? 'no data',
          identifiedDetails['Details'] ?? 'no data',
          identifiedDetails['Medical Treatments'] ?? 'no data',
          identifiedDetails['img_url'] ??
              'https://imageresizer.furnituredealer.net/img/remote/images.furnituredealer.net/img/commonimages%2Fitem-placeholder.jpg?width=480&scale=both&trim.threshold=80&trim.percentpadding=15',
        ];
      });
    }
  }
}

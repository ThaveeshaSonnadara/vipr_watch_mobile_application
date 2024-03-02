import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import '../../widgets/navigation_menu.dart';
import '../species_details/species_details.dart';
import 'identify_snake.dart';
import 'package:material_dialogs/dialogs.dart';

class ImageProcessScreen extends StatefulWidget {
  const ImageProcessScreen({super.key, required this.path});

  final String path;

  @override
  State<ImageProcessScreen> createState() => _ImageProcessScreenState();
}

class _ImageProcessScreenState extends State<ImageProcessScreen> {
  List snakeDetails = ['Indian Cobra', 99];
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
          icon:  const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NavigationMenu())); // Implement the back button functionality
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
      final String imagePath = widget.path;
      snakeDetails = await IdentifySnake().sendImage(imagePath);
      print(imagePath);
    } catch (e) {
      accuracy = 0;
    }
  }

  Future<void> popUpDetails() async {
    // await getSnakeDetails();
    print(snakeDetails);

    snakeName = await snakeDetails[0];
    accuracy = await snakeDetails[1];

    if (accuracy > 70) {
      await getIdentifiedSnakeDetails();
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => SnakeSpeciesDetailsScreen(identifiedSnakeDetails: identifiedSnakeDetails,), //Snake details
                ),
              );
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

  // get the details of the identified snake from the data base.

  Future<void> getIdentifiedSnakeDetails() async {
    QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore.instance
        .collection('Snake details and treatments')
        .where('Snake Name', isEqualTo: snakeName)
        .get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> snakeInfo = snap.docs;
    if (snakeInfo.isNotEmpty) {
      setState(() {
        var identifiedDetails = snakeInfo[0].data();
        identifiedSnakeDetails = [
          snakeName,
          identifiedDetails['Snake Scientific Name'] ?? '',
          identifiedDetails['Snake Sinhala Name'] ?? '',
          identifiedDetails['Venomous Type'] ?? '',
          identifiedDetails['Details'] ?? '',
          identifiedDetails['Medical Treatments'] ?? '',
        ];
      });
    }
  }
}

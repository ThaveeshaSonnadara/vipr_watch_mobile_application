import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? image;

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.file(
                        image!,
                        width: 350,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      "assets/images/input_image/imageAnimation2.gif",
                      width: 150,
                      height: 150,
                    ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () => pickImage(ImageSource.gallery),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Adjust the border radius
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.image_outlined,
                      color: Colors.green,
                      size: 30,
                    ),
                    const SizedBox(width: 40),
                    Text(
                      "Pick Gallery",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => pickImage(ImageSource.camera),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Adjust the border radius
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.green,
                      size: 30,
                    ),
                    const SizedBox(width: 40),
                    Text(
                      "Pick Camera",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

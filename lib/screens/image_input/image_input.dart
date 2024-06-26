import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'image_process.dart';

class ImageInputScreen extends StatefulWidget {
  const ImageInputScreen({super.key});

  @override
  State<ImageInputScreen> createState() => _ImageInputScreenState();
}

class _ImageInputScreenState extends State<ImageInputScreen> {
  File? _image;

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source); // get the image file from the device
      if (image == null) return;
      File? imageTemporary = File(image.path);
      imageTemporary = await cropImage(imageFile: imageTemporary);
      setState(() {
        _image = imageTemporary;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  // edit the image as user preferred
  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        _image!,
                        height: 200,
                      ),
                    )
                  : Image.asset(
                      "assets/images/input_image/imageAnimation3.gif",
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
              const SizedBox(height: 30),
              _image != null
                  ? OutlinedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (e) =>
                                ImageProcessScreen(path: _image!.path),
                          ),
                        );
                        print(_image!.path);
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 3.0,
                          color: Colors.green,
                          style: BorderStyle.solid,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Adjust the border radius
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.add_box,
                            color: Colors.green,
                            size: 30,
                          ),
                          const SizedBox(width: 40),
                          Text(
                            "Confirm",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green,
                                    fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  : Flexible(
                      child: Center(
                          child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'ViprWatch\n',
                            style: GoogleFonts.oleoScript(
                              fontSize: 25.0,
                              color: Colors.green,
                              fontWeight: FontWeight.w400,
                            )),
                        const TextSpan(
                            text: 'Stay Alert, Stay Safe\n\n',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            )),
                      ]),
                    ))),
              const Spacer(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

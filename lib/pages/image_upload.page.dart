import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({Key? key}) : super(key: key);

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? frontImage;
  File? backImage;

  Future pickFrontImage(imageSource) async {
    try {
      final frontImage = await ImagePicker().pickImage(source: imageSource);
      if (frontImage == null) return;

      final imageTemp = File(frontImage.path);
      setState(() {
        this.frontImage = imageTemp;
      });
    } on PlatformException catch (e) {
      print("failed to choose an frontImage: $e");
    }
  }

  Future pickBackImage(imageSource) async {
    try {
      final backImage = await ImagePicker().pickImage(source: imageSource);
      if (backImage == null) return;

      final imageTemp = File(backImage.path);
      setState(() {
        this.backImage = imageTemp;
      });
    } on PlatformException catch (e) {
      print("failed to choose an BackImage: $e");
    }
  }

  Future cropFrontImage(ImageSource gallery) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: frontImage!.path,
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload an Image"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.purple[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                frontImage != null
                    ? FittedBox(
                        fit: BoxFit.fill,
                        child: Image.file(frontImage!,
                            width: MediaQuery.of(context).size.width * .4,
                            height: MediaQuery.of(context).size.height * .4),
                      )
                    : GestureDetector(
                        onTap: (() {
                          cropFrontImage(ImageSource.gallery);
                        }),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: SizedBox(
                                height: h / 3.8,
                                width: h / 2.5,
                                child: const Center(
                                    child: Text(
                                  "Aadhaar_Front_Side ",
                                  style: TextStyle(fontSize: 26),
                                )))),
                      ),
                SizedBox(
                  height: h / 50,
                ),
                backImage != null
                    ? FittedBox(
                        fit: BoxFit.fill,
                        child: Image.file(backImage!,
                            width: MediaQuery.of(context).size.width * .4,
                            height: MediaQuery.of(context).size.height * .4),
                      )
                    : GestureDetector(
                        onTap: (() {
                          pickBackImage(ImageSource.gallery);
                        }),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: SizedBox(
                                height: h / 3.8,
                                width: h / 2.5,
                                child: const Center(
                                    child: Text(
                                  "Aadhaar_Back_Side ",
                                  style: TextStyle(fontSize: 26),
                                )))),
                      ),
              ],
            ),

            /*  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(
                    icon: Icons.file_copy_outlined,
                    title: 'Choose Front Page',
                    onClicked: () {
                      pickFrontImage(ImageSource.gallery);

                      // if (state == AppState.free) {
                      //   pickFrontImage(ImageSource.gallery);
                      // } else if (state == AppState.picked) {
                      //   cropFrontImage(ImageSource.gallery);
                      // } else if (state == AppState.free) {
                      //   clearFrontImage();
                      // }
                    }),
                buildButton(
                    icon: Icons.file_copy_outlined,
                    title: 'Choose Back Page',
                    onClicked: () {
                      pickBackImage(
                        ImageSource.gallery,
                      );
                    }),
              ],
            ), */
            buildUploadButton(
                icon: Icons.upload_file,
                title: 'Upload Files',
                onClicked: () {}),
          ],
        ),
      ),
    );
  }

  buildButton(
      {required String title,
      required IconData icon,
      required VoidCallback onClicked}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        onPressed: onClicked,
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(title)
          ],
        ));
  }

  buildUploadButton(
      {required IconData icon,
      required String title,
      required Null Function() onClicked}) {
    {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          onPressed: onClicked,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(title)
            ],
          ));
    }
  }
}

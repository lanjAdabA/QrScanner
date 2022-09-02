import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadCameraPage extends StatefulWidget {
  const UploadCameraPage({Key? key}) : super(key: key);

  @override
  State<UploadCameraPage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadCameraPage> {
  final ImagePicker picker = ImagePicker();

  File? frontImage;
  File? backImage;
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
                        child: Image.file(
                          frontImage!,
                          height: h / 3.8,
                          width: h / 2.5,
                        ),
                      )
                    : GestureDetector(
                        onTap: (() async {
                          var img = await picker.pickImage(
                              source: ImageSource.camera);

                          CroppedFile? val = await ImageCropper().cropImage(
                            uiSettings: [
                              AndroidUiSettings(
                                toolbarColor: Colors.white,
                                toolbarTitle: "Image Cropper",
                              )
                            ],
                            sourcePath: img!.path,
                            aspectRatio:
                                const CropAspectRatio(ratioX: 20, ratioY: 13),
                            maxHeight: 600,
                            maxWidth: 600,
                            compressFormat: ImageCompressFormat.jpg,
                          );
                          final temp = File(val!.path);
                          setState(() {
                            frontImage = temp;
                          });
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
                        child: Image.file(
                          backImage!,
                          height: h / 3.8,
                          width: h / 2.5,
                        ),
                      )
                    : GestureDetector(
                        onTap: (() async {
                          var img = await picker.pickImage(
                              source: ImageSource.camera);

                          CroppedFile? val = await ImageCropper().cropImage(
                            uiSettings: [
                              AndroidUiSettings(
                                toolbarColor: Colors.white,
                                toolbarTitle: "Image Cropper",
                              )
                            ],
                            sourcePath: img!.path,
                            aspectRatio:
                                const CropAspectRatio(ratioX: 20, ratioY: 13),
                            maxHeight: 600,
                            maxWidth: 600,
                            compressFormat: ImageCompressFormat.jpg,
                          );
                          final temp = File(val!.path);
                          setState(() {
                            backImage = temp;
                          });
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
            buildUploadButton(
                icon: Icons.upload_file,
                title: 'Upload Files',
                onClicked: () {}),
          ],
        ),
      ),
    );
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




// ‰
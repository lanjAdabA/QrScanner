import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscanner/storage_service.dart';

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({Key? key}) : super(key: key);

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  final ImagePicker picker = ImagePicker();
  File? frontImage;

  Future uploadFrontImage() async {}

  File? backImage;

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
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
                              source: ImageSource.gallery);

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
                            log(frontImage.toString());
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
                              source: ImageSource.gallery);

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
                            log(backImage.toString());
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
                onClicked: () {
                  const path = "file/Aadhaar-Front.jpg";
                  final fileName = File(frontImage!.path);
                  storage.uploadFile(path, fileName).then((value) => log(path));
                }),
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

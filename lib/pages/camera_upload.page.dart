import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscanner/localstorage.dart';
import 'package:qrscanner/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadCameraPage extends StatefulWidget {
  const UploadCameraPage({Key? key}) : super(key: key);

  @override
  State<UploadCameraPage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadCameraPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final ImagePicker picker = ImagePicker();
  File? frontImage;
  String fullname = '';
  final Storage storage = Storage();

  String frontImagePath = "";
  String backImagePath = "";
  String frontImageName = "";
  String backImageName = "";
  bool isLoading = false;
  Color btncolor = const Color.fromARGB(255, 29, 76, 194);

  String name = "";

  Future uploadFrontImage() async {}

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
                              final SharedPreferences prefs = await _prefs;
                              if (img == null) return;
                              CroppedFile? croppedImgFront =
                                  await ImageCropper().cropImage(
                                uiSettings: [
                                  AndroidUiSettings(
                                    toolbarColor: Colors.white,
                                    toolbarTitle: "Image Cropper",
                                  )
                                ],
                                sourcePath: img.path,
                                aspectRatio: const CropAspectRatio(
                                    ratioX: 20, ratioY: 13),
                                maxHeight: 600,
                                maxWidth: 600,
                                compressFormat: ImageCompressFormat.jpg,
                              );
                              final temp = File(croppedImgFront!.path);
                              setState(() {
                                frontImage = temp;
                              });
                              prefs.setString(
                                  'frontImagePath', croppedImgFront.path);
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
                              final SharedPreferences prefs = await _prefs;
                              if (img == null) return;
                              CroppedFile? croppedImgBack =
                                  await ImageCropper().cropImage(
                                uiSettings: [
                                  AndroidUiSettings(
                                    toolbarColor: Colors.white,
                                    toolbarTitle: "Image Cropper",
                                  )
                                ],
                                sourcePath: img.path,
                                aspectRatio: const CropAspectRatio(
                                    ratioX: 20, ratioY: 13),
                                maxHeight: 600,
                                maxWidth: 600,
                                compressFormat: ImageCompressFormat.jpg,
                              );
                              final temp = File(croppedImgBack!.path);
                              setState(() {
                                backImage = temp;
                              });
                              prefs.setString(
                                  'backImagePath', croppedImgBack.path);
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: btncolor,
                        minimumSize: const Size.fromHeight(40),
                        elevation: 5,
                      ),
                      onPressed: () async {
                        log('Upload Button Pressed');
                        setState(() {
                          isLoading = true;
                          btncolor = const Color.fromARGB(255, 62, 185, 66);
                        });
                        var front = await DiskRepo().retrieve1();
                        var back = await DiskRepo().retrieve2();
                        setState(() {
                          frontImagePath = front;
                          backImagePath = back;
                          log(frontImagePath);
                          log(backImagePath);
                        });

                        storage
                            .uploadFile(
                                frontImage: frontImagePath,
                                frontImageName: 'Front Image',
                                backImage: backImagePath,
                                backImageName: 'Rear Image',
                                name: name)
                            .then((value) async {
                          log('Uploaded Successfully');

                          setState(() {
                            isLoading = false;
                            btncolor = Colors.green;
                          });
                          // _displaySuccessMotionToast();
                          AlertController.show(
                            " Done Uploaded",
                            "Successfully!",
                            TypeAlert.success,
                          );
                          log('Done Upload');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      super.widget));
                        }).onError((error, stackTrace) {
                          setState(() {
                            isLoading = false;
                            btncolor = Colors.red;
                          });
                          return AlertController.show(
                            " No File Found",
                            "Select the file first!",
                            TypeAlert.error,
                          );
                        });
                      },
                      child: isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Uploading...',
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ],
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.cloud_upload_outlined, size: 28),
                                SizedBox(width: 16),
                                Text(
                                  "Upload File",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )
                              ],
                            )),
                )
              ],
            )));
  }
}

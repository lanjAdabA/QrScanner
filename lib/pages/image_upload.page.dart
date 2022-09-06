import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

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
  String frontimgUrl = '';
  String backimgUrl = '';

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
                          var pickedImgFront = await picker.pickImage(
                              source: ImageSource.gallery);

                          CroppedFile? croppedImgFront =
                              await ImageCropper().cropImage(
                            uiSettings: [
                              AndroidUiSettings(
                                toolbarColor: Colors.white,
                                toolbarTitle: "Image Cropper",
                              )
                            ],
                            sourcePath: pickedImgFront!.path,
                            aspectRatio:
                                const CropAspectRatio(ratioX: 20, ratioY: 13),
                            maxHeight: 600,
                            maxWidth: 600,
                            compressFormat: ImageCompressFormat.jpg,
                          );
                          final fronttemp = File(croppedImgFront!.path);
                          setState(() {
                            frontImage = fronttemp;
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
                          var pickedImgBack = await picker.pickImage(
                              source: ImageSource.gallery);

                          CroppedFile? croppedImgBack =
                              await ImageCropper().cropImage(
                            uiSettings: [
                              AndroidUiSettings(
                                toolbarColor: Colors.white,
                                toolbarTitle: "Image Cropper",
                              )
                            ],
                            sourcePath: pickedImgBack!.path,
                            aspectRatio:
                                const CropAspectRatio(ratioX: 20, ratioY: 13),
                            maxHeight: 600,
                            maxWidth: 600,
                            compressFormat: ImageCompressFormat.jpg,
                          );
                          final backtemp = File(croppedImgBack!.path);
                          setState(() {
                            backImage = backtemp;
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
            ElevatedButton(
                onPressed: () async {
                  final storage = FirebaseStorage.instance;
                  // final res = await FilePicker.platform.pickFiles(
                  //     allowMultiple: false,
                  //     type: FileType.custom,
                  //     allowedExtensions: ['png', 'jpg']);

                  final frontImg = frontImage;
                  final backImg = backImage;

                  if (frontImg == null && backImg == null) return;

                  final frontPath = frontImg.files.single.path;
                  final frontfileName = frontImg.files.single.name;
                  final frontfile = File(frontPath);
                  final frontref = storage.ref("image/$frontfileName");
                  final fronturl = ref.putFile(frontfile);
                  final fronturlsnap =
                      await fronturl.snapshot.ref.getDownloadURL();
                  final backPath = backImg.files.single.path;
                  final backfileName = backImg.files.single.name;
                  final backfile = File(backPath);
                  final backref = storage.ref("image/$backfileName");
                  final backurl = ref.putFile(backfile);
                  final backurlsnap =
                      await backurl.snapshot.ref.getDownloadURL();
                  setState(() {
                    frontimgUrl = fronturlsnap;
                  });

                  //todo if (res == null) return;
                  //todo   final path = res.files.single.path!;
                  //todo   final fileName = res.files.single.name;
                  //todo   final file = File(path);
                  //todo   final ref = storage.ref("image/$fileName");
                  //todo   final url = ref.putFile(file);
                  //todo   final u = await url.snapshot.ref.getDownloadURL();
                  //todo   setState(() {
                  //todo     imgUrl = u;
                  //todo   });
                },
                child: const Text("UPLOAD")),
            // buildUploadButton(
            //     icon: Icons.upload_file,
            //     title: 'Upload Files',
            //     onClicked: () {
            //       const path = "file/Aadhaar-Front.jpg";
            //       final fileName = File(frontImage!.path);
            //       storage.uploadFile(path, fileName).then((value) => log(path));
            //     }),
          ],
        ),
      ),
    );
  }

  // buildUploadButton(
  //     {required IconData icon,
  //     required String title,
  //     required Null Function() onClicked}) {
  //   {
  //     return ElevatedButton(
  //         style: ElevatedButton.styleFrom(primary: Colors.blue),
  //         onPressed: onClicked,
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Icon(
  //               icon,
  //               size: 60,
  //             ),
  //             const SizedBox(
  //               width: 16,
  //             ),
  //             Text(title)
  //           ],
  //         ));
  //   }
  // }
}

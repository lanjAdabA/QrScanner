// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter_dropdown_alert/alert_controller.dart';
// import 'package:flutter_dropdown_alert/model/data_alert.dart';

// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:qrscanner/localstorage.dart';
// import 'package:qrscanner/storage_service.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// class UploadImagePage extends StatefulWidget {
//   const UploadImagePage({Key? key}) : super(key: key);

//   @override
//   State<UploadImagePage> createState() => _UploadImagePageState();
// }

// class _UploadImagePageState extends State<UploadImagePage> {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   final ImagePicker picker = ImagePicker();
//   File? frontImage;
//   final Storage storage = Storage();

//   String frontImagePath = "";
//   String backImagePath = "";
//   String frontImageName = "";
//   String backImageName = "";
//   bool isLoading = false;
//   Color btncolor = Colors.deepPurple;

//   String name = "";

//   File? backImage;
//   @override
//   void initState() {
//     super.initState;
//     clear();
//   }

//   void alerdial() {
//     AlertController.show(
//       " Scan QR Code First",
//       "And then Pick Images",
//       TypeAlert.warning,
//     );
//   }

//   clear() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey('frontImagePath') &&
//         prefs.containsKey('backImagePath')) {
//       prefs.remove('frontImagePath');
//       prefs.remove('backImagePath');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final Storage storage = Storage();
//     double h = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Upload an Image"),
//         centerTitle: true,
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         color: Colors.purple[50],
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 frontImage != null
//                     ? FittedBox(
//                         fit: BoxFit.fill,
//                         child: Image.file(
//                           frontImage!,
//                           height: h / 3.8,
//                           width: h / 2.5,
//                         ),
//                       )
//                     : GestureDetector(
//                         onTap: (() async {
//                           clear();
//                           var pickedImgFront = await picker.pickImage(
//                               source: ImageSource.gallery);

//                           final SharedPreferences prefs = await _prefs;
//                           if (pickedImgFront == null) return;

//                           CroppedFile? croppedImgFront =
//                               await ImageCropper().cropImage(
//                             uiSettings: [
//                               AndroidUiSettings(
//                                 toolbarColor: Colors.white,
//                                 toolbarTitle: "Image Cropper",
//                               )
//                             ],
//                             sourcePath: pickedImgFront.path,
//                             aspectRatio:
//                                 const CropAspectRatio(ratioX: 20, ratioY: 13),
//                             maxHeight: 600,
//                             maxWidth: 600,
//                             compressFormat: ImageCompressFormat.jpg,
//                           );
//                           if (croppedImgFront == null) return;
//                           final frontPathtemp = File(croppedImgFront.path);

//                           setState(() {
//                             frontImage = frontPathtemp;
//                             log('Front adhar${frontImage.toString()}');
//                           });
//                           prefs.setString(
//                               'frontImagePath', croppedImgFront.path);
//                         }),
//                         child: Container(
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey)),
//                             child: SizedBox(
//                                 height: h / 3.8,
//                                 width: h / 2.5,
//                                 child: const Center(
//                                     child: Text(
//                                   "Aadhaar_Front_Side ",
//                                   style: TextStyle(fontSize: 26),
//                                 )))),
//                       ),
//                 SizedBox(
//                   height: h / 50,
//                 ),
//                 backImage != null
//                     ? FittedBox(
//                         fit: BoxFit.fill,
//                         child: Image.file(
//                           backImage!,
//                           height: h / 3.8,
//                           width: h / 2.5,
//                         ),
//                       )
//                     : GestureDetector(
//                         onTap: (() async {
//                           var pickedImgBack = await picker.pickImage(
//                               source: ImageSource.gallery);
//                           final SharedPreferences prefs = await _prefs;
//                           if (pickedImgBack == null) return;

//                           CroppedFile? croppedImgBack =
//                               await ImageCropper().cropImage(
//                             uiSettings: [
//                               AndroidUiSettings(
//                                 toolbarColor: Colors.white,
//                                 toolbarTitle: "Image Cropper",
//                               )
//                             ],
//                             sourcePath: pickedImgBack.path,
//                             aspectRatio:
//                                 const CropAspectRatio(ratioX: 20, ratioY: 13),
//                             maxHeight: 600,
//                             maxWidth: 600,
//                             compressFormat: ImageCompressFormat.jpg,
//                           );
//                           if (croppedImgBack == null) return;
//                           final backtemp = File(croppedImgBack.path);
//                           setState(() {
//                             backImage = backtemp;
//                             log('back adhar${backImage.toString()}');
//                           });
//                           prefs.setString('backImagePath', croppedImgBack.path);
//                         }),
//                         child: Container(
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey)),
//                             child: SizedBox(
//                                 height: h / 3.8,
//                                 width: h / 2.5,
//                                 child: const Center(
//                                     child: Text(
//                                   "Aadhaar_Back_Side ",
//                                   style: TextStyle(fontSize: 26),
//                                 )))),
//                       ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: btncolor,
//                     minimumSize: const Size.fromHeight(40),
//                     elevation: 5,
//                   ),
//                   onPressed: () async {
//                     log('Upload Button Pressed');
//                     setState(() {
//                       isLoading = true;
//                       btncolor = const Color.fromARGB(255, 62, 185, 66);
//                     });
//                     var front = await DiskRepo().retrieve1();
//                     var back = await DiskRepo().retrieve2();
//                     setState(() {
//                       frontImagePath = front;
//                       backImagePath = back;
//                       log('front$frontImagePath');
//                       log('back$backImagePath');
//                     });

//                     storage
//                         .uploadFile(
//                             frontImage: frontImagePath,
//                             frontImageName: 'Front Image',
//                             backImage: backImagePath,
//                             backImageName: 'Rear Image',
//                             name: name)
//                         .then((value) async {
//                       log('Uploaded Successfully');
//                       setState(() {
//                         isLoading = false;
//                         btncolor = const Color.fromARGB(255, 29, 76, 194);
//                       });
//                       AlertController.show(
//                         " Done Uploaded",
//                         "Successfully!",
//                         TypeAlert.success,
//                       );
//                       log('Done Upload');
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (BuildContext context) => super.widget));
//                     }).onError((error, stackTrace) {
//                       log('error');
//                       setState(() {
//                         isLoading = false;
//                         btncolor = Colors.red;
//                       });
//                       return AlertController.show(
//                         " No File Found",
//                         "Select the file first!",
//                         TypeAlert.error,
//                       );
//                     });
//                   },
//                   child: isLoading
//                       ? Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             Text(
//                               'Uploading...',
//                               style: TextStyle(fontSize: 17),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             CircularProgressIndicator(
//                               color: Colors.white,
//                             ),
//                           ],
//                         )
//                       : Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const [
//                             Icon(Icons.cloud_upload_outlined, size: 28),
//                             SizedBox(width: 16),
//                             Text(
//                               "Upload File",
//                               style:
//                                   TextStyle(fontSize: 18, color: Colors.white),
//                             )
//                           ],
//                         )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadImagePage extends StatefulWidget {
  final documentType;
  const UploadImagePage(this.documentType);

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}
List<String> documentFace = <String>['Front','Back'];
class _UploadImagePageState extends State<UploadImagePage> {

  late DatabaseReference _dbref;

  String? frontPath;
  String status = 'Upload';
  String imageUrl = 'Upload';
  String docFace = "Front";
  String phoneNum = '';

  TextEditingController documentType = TextEditingController();
  var file;
  uploadImage() async {
    _dbref = FirebaseDatabase.instance.ref("documentkeeper"); //realtime DB instance
    final _firebaseStorage = FirebaseStorage.instance; //Storage instance
    final _imagePicker = ImagePicker();
    PickedFile? image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    final prefs = await SharedPreferences.getInstance();
    phoneNum = prefs.getString("PhoneNumber").toString();

    if (permissionStatus.isGranted) {
      //Select Image  .getImage(source: ImageSource.gallery);
      // image = await _imagePicker.pickImage(source: source)
      final XFile? image =
      await _imagePicker.pickImage(source: ImageSource.gallery);
       file = File(image!.path);

      setState(() {
        status = "Uploading...";
      });
      if (image != null) {
        //Upload to Firebase
        var snapshot =
        await _firebaseStorage.ref().child('images/fgfg').putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
          status = "Uploaded";

          _dbref
              .child("$phoneNum")
              .child("data")
              .child("${documentType.value.text}").child("$docFace")
          .set(
            {
            "imgUrl" : "${imageUrl}",
            }
          );

        });
        print("DPWNNN $imageUrl");
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
  String documentFaceList = documentFace.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Upload"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: documentType,
                  decoration: InputDecoration(
                    labelText: "Enter document type",
                    border: OutlineInputBorder()
                  ),
                ),

                DropdownButton<String>(
                    value: documentFaceList,
                    elevation: 10,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        documentFaceList = value!;
                        docFace = value;
                      });
                    },
                    items: documentFace.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),

                SizedBox(
                  height: 100,
                ),
                //FadeInImage.assetNetwork(placeholder: "assets/sampleID.png", image: imageUrl),
                ElevatedButton(onPressed: (){
                  uploadImage();
                }, child: Text(status))
                // SizedBox(
                //   // height: MediaQuery.of(context).size.height * .8,
                //   width: MediaQuery.of(context).size.width * .8,
                //   child: frontPath == null
                //       ? InkWell(
                //           onTap: () async {
                //             final imgPicker = ImagePicker();
                //             var pickedImgFront = await imgPicker.pickImage(
                //                 source: ImageSource.gallery);
                //             if (pickedImgFront == null) return;
                //
                //             CroppedFile? croppedImgFront =
                //                 await ImageCropper().cropImage(
                //               uiSettings: [
                //                 AndroidUiSettings(
                //                   toolbarColor: Colors.white,
                //                   toolbarTitle: "Image Cropper",
                //                 )
                //               ],
                //               sourcePath: pickedImgFront.path,
                //               aspectRatio:
                //                   const CropAspectRatio(ratioX: 20, ratioY: 13),
                //               maxHeight: 600,
                //               maxWidth: 600,
                //               compressFormat: ImageCompressFormat.jpg,
                //             );
                //             if (croppedImgFront == null) return;
                //             final frontPathtemp = File(croppedImgFront.path);
                //             setState(() {
                //               frontPath = pickedImgFront.path;
                //             });
                //           },
                //           child: Image.asset("assets/sampleID.png"),
                //         )
                //       : InkWell(
                //           onTap: () async {
                //             uploadImage();
                //
                //             // status = 'Upload';
                //             // final imgPicker = ImagePicker();
                //             // var pickedImgFront = await imgPicker.pickImage(
                //             //     source: ImageSource.gallery);
                //             // if (pickedImgFront == null) return;
                //             //
                //             // CroppedFile? croppedImgFront =
                //             //     await ImageCropper().cropImage(
                //             //   uiSettings: [
                //             //     AndroidUiSettings(
                //             //       toolbarColor: Colors.white,
                //             //       toolbarTitle: "Image Cropper",
                //             //     )
                //             //   ],
                //             //   sourcePath: pickedImgFront.path,
                //             //   aspectRatio:
                //             //       const CropAspectRatio(ratioX: 20, ratioY: 13),
                //             //   maxHeight: 600,
                //             //   maxWidth: 600,
                //             //   compressFormat: ImageCompressFormat.jpg,
                //             // );
                //             // if (croppedImgFront == null) return;
                //             // final frontPathtemp = File(croppedImgFront.path);
                //             // setState(() {
                //             //   frontPath = pickedImgFront.path;
                //             // });
                //           },
                //           child: Image.file(
                //             File(frontPath!),
                //           ),
                //         ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     ElevatedButton(
                //       onPressed: (){
                //         uploadImage();
                //       },
                //       child: Text("ccc"),
                //     ),
                //     ElevatedButton(
                //         onPressed: frontPath != null
                //             ? () {
                //                 setState(() {
                //                   status = 'Uploading';
                //                 });
                //
                //                 uploadImage();
                //                 //
                //                 // final db = FirebaseStorage.instance.ref(
                //                 //   '${widget.documentType}/${documentFace.value.text}/',
                //                 // );
                //                 // db.putFile(File(frontPath!)).whenComplete(() {
                //                 //   setState(() {
                //                 //     status = 'Uploaded';
                //                 //   });
                //                 // });
                //
                //               }
                //             : null,
                //         child: Text(status)),
                //   ],
                // )
              ],
            ),
          ),
        ));
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadImagePage extends StatefulWidget {
//   const UploadImagePage({Key? key}) : super(key: key);

//   @override
//   State<UploadImagePage> createState() => _UploadImagePageState();
// }

// class _UploadImagePageState extends State<UploadImagePage> {
//   final ImagePicker _picker = ImagePicker();
//   String? frontImagePath;
//   String? frontImageFileName;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Upload Aadhaar"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () async {
//                     final p =
//                         await _picker.pickImage(source: ImageSource.camera);
//                     if (p == null) return;

//                     var cropped =
//                         await ImageCropper().cropImage(sourcePath: p.path);
//                     if (cropped == null) return;

//                     setState(() {
//                       frontImagePath = cropped.path;
//                       frontImageFileName = p.name;
//                     });
//                   },
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height / 3.8,
//                     width: MediaQuery.of(context).size.height / 2.5,
//                     child: frontImagePath == null
//                         ? const Placeholder()
//                         : Image.file(File(frontImagePath!)),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {},
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height / 3.8,
//                     width: MediaQuery.of(context).size.height / 2.5,
//                     child: const Placeholder(),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//                 onPressed: () {
//                   // Storage().uploadFile(frontImagePath!, frontImageFileName!);
//                 },
//                 child: const Text("Upload"))
//           ],
//         ),
//       ),
//     );
//   }
// }


//todo class Storage {
//todo   final firebase_storage.FirebaseStorage storage =
//todo       firebase_storage.FirebaseStorage.instance;

//todo   Future uploadFile(String filePath, fileName) async {
//todo     File file = File(filePath);

//todo     try {
//todo       await storage.ref("test/$fileName").putFile(file);
//todo     } on firebase_core.FirebaseException catch (e) {
//todo       print(e);
//todo     }
//todo   }
//todo }



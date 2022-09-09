// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase_core/firebase_core.dart' as firebase_core;

// import 'dart:io';

// class Storage {
//   final firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;

//   Future uploadFile(String filePath, fileName) async {
//     File file = File(filePath);

//     try {
//       await storage.ref("test/$fileName").putFile(file);
//     } on firebase_core.FirebaseException catch (e) {
//       print(e);
//     }
//   }
// }

import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(
    String frontImagePath,
    String frontImageName,
    String backImagePath,
    String backImageName,
    String name,
  ) async {
    File file1 = File(frontImagePath);
    File file2 = File(backImagePath);
    // final newCustomMetadata = SettableMetadata(
    //   contentType: 'text/html',
    // );
    try {
      await storage.ref('Aadhaar/$frontImageName').putFile(file1);
      await storage.ref('Aadhaar/$backImageName').putFile(file2);
      // await storage.ref('Aadhaar/$name').putFile(file1, newCustomMetadata);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }
}

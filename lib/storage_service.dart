import 'dart:developer';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
      

  Future<void> uploadFile({
    required String frontImage,
    required String frontImageName,
    required String backImage,
    required String backImageName,
    required String name,
  })async {
    File file1 = File(frontImage);
    File file2 = File(backImageName);
    try {
      await storage.ref('Aadhaar/$name/$frontImageName').putFile(file1);
      await storage.ref('Aadhaar/$name/$backImageName').putFile(file2);
    } on firebase_core.FirebaseException catch(e){
     log(e.toString());
    }
  }
}

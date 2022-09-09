import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(
    File frontImage,
    String frontImageName,
    File backImage,
    String backImageName,
    String name,
  ) async {
    try {
      await storage.ref('test/$name/$frontImageName').putFile(frontImage);
      await storage.ref('test/$name/$backImageName').putFile(backImage);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }
}

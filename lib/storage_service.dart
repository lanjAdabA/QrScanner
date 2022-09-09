import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile({
    required File frontImage,
    required String frontImageName,
    required File backImage,
    required String backImageName,
    required String name,
  }) async {
    try {
      await storage
          .ref('Document Name/$name/$frontImageName')
          .putFile(frontImage);
      await storage.ref('Document/$name/$backImageName').putFile(backImage);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }
}

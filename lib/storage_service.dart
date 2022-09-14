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
  }) async {
    File frontImageName = File(frontImage);
    File backImageName = File(backImage);
    try {
      await storage
          .ref('Aadhaar/$name/$frontImageName')
          .putFile(frontImageName);
      var p = storage.ref('Aadhaar/$name/$backImageName');
      var url = p.putFile(backImageName);

      log("msg${url.snapshot.bytesTransferred}");
    } on firebase_core.FirebaseException catch (e) {
      log(e.toString());
    }
  }
}

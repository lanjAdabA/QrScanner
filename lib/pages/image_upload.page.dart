import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({Key? key}) : super(key: key);

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? image;
  Future pickImage(imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("failed to choose an image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload an Image"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.purple[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            image != null
                ? Image.file(image!,
                    width: MediaQuery.of(context).size.width * .7,
                    height: MediaQuery.of(context).size.height * .7)
                : const FlutterLogo(
                    size: 160,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(
                    icon: Icons.image_outlined,
                    title: 'Open Gallery',
                    onClicked: () {
                      pickImage(ImageSource.gallery);
                    }),
                buildButton(
                    icon: Icons.camera_alt_outlined,
                    title: 'Open Camera',
                    onClicked: () {
                      pickImage(ImageSource.camera);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildButton(
      {required String title,
      required IconData icon,
      required VoidCallback onClicked}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        onPressed: onClicked,
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(title)
          ],
        ));
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qrscanner/router/router.gr.dart';

class CreateIdFolderPage extends StatefulWidget {
  const CreateIdFolderPage({Key? key}) : super(key: key);

  @override
  State<CreateIdFolderPage> createState() => _CreateIdFolderPageState();
}

class _CreateIdFolderPageState extends State<CreateIdFolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text("creating folder"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.purple[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  label: const Text("Create new"),
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: ((context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * .3,
                            padding: const EdgeInsets.all(20),
                            color: Colors.purple[50],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "Select an Option ",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              25,
                                    ),
                                    const Opacity(
                                      opacity: .9,
                                      child: Positioned(
                                        bottom: -59,
                                        child: Icon(
                                          Icons.photo_camera_back_outlined,
                                          size: 68,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildButton(
                                        icon: Icons.image_outlined,
                                        title: 'Open Gallery',
                                        onClicked: () {
                                          context.router
                                              .push(const UploadImageRoute());
                                        }),
                                    buildButton(
                                        icon: Icons.camera_alt_outlined,
                                        title: 'Open Camera',
                                        onClicked: () {
                                          context.router
                                              .push(const UploadCameraRoute());
                                        }),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50,
                                ),
                              ],
                            ),
                          );
                        }));
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                )
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
        style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
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

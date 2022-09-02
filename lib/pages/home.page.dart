import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qrscanner/router/router.gr.dart';
import 'package:qrscanner/widgets/login_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("QR gen/scanR"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.login),
              onPressed: () {
                const LogInWidget();
              }
              //  {
              //   StreamBuilder<User?>(
              //     stream: FirebaseAuth.instance.authStateChanges(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return const HomePage();
              //       } else {
              //         return const SignInPage();

              //         //     IconButton(
              //         //   icon: const Icon(Icons.login),
              //         //   onPressed: () {
              //         //     context.router.push(const SignInRoute());
              //         //   },
              //         // );
              //       }
              //     },
              //   );
              // },
              )
        ],
      ),
      body: Container(
        color: Colors.purple[50],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  context.router.push(const QrCreateRoute());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code,
                      size: MediaQuery.of(context).size.width / 3,
                    ),
                    Text(
                      "Create custom QR",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(const QrScannerRoute());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_scanner,
                      size: MediaQuery.of(context).size.width / 3,
                    ),
                    Text(
                      "QR Code Scanner",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(const AadhaarScannerRoute());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_2,
                      size: MediaQuery.of(context).size.width / 3,
                    ),
                    Text(
                      "Aadhaar Scanner",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
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
                                        MediaQuery.of(context).size.height / 25,
                                  ),
                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    clipBehavior: Clip.none,
                                    children: const [
                                      Opacity(
                                        opacity: .9,
                                        child: Positioned(
                                          bottom: -59,
                                          child: Icon(
                                            Icons.photo_camera_back_outlined,
                                            size: 80,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                      )
                                    ],
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
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        );
                      }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_outlined,
                      size: MediaQuery.of(context).size.width / 3,
                    ),
                    Text(
                      "Upload Aadhaar ",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(const CreateIdFolderRoute());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file,
                      size: MediaQuery.of(context).size.width / 3,
                    ),
                    Text(
                      "Upload more IDs",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
            ],
          ),
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

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
}

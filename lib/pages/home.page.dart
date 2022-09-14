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
              })
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
                      color: Colors.black,
                      size: MediaQuery.of(context).size.width / 3.2,
                    ),
                    Text(
                      "Create custom QR",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                      size: MediaQuery.of(context).size.width / 3.2,
                    ),
                    Text(
                      "QR Code Scanner",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                      size: MediaQuery.of(context).size.width / 3.2,
                    ),
                    Text(
                      "Aadhaar Scanner",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(const MyWalletRoute());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wallet_outlined,
                      color: Colors.grey[800],
                      size: MediaQuery.of(context).size.width / 3.2,
                    ),
                    Text(
                      "My Docs Wallet",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
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
                      Icons.upload_file_outlined,
                      color: Colors.grey[800],
                      size: MediaQuery.of(context).size.width / 3.2,
                    ),
                    Text(
                      "Upload more IDs",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
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

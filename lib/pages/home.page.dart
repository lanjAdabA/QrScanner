import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qrscanner/router/router.gr.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR gen/scanR"),
        centerTitle: true,
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
                      "Scan an Aadhaar",
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
                  context.router.push(const UploadImageRoute());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file,
                      size: MediaQuery.of(context).size.width / 3,
                    ),
                    Text(
                      "Upload  a Picture",
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

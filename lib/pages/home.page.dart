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
        title: const Text("QR CREATER & SCANNER"),
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
                      "Create a QR code",
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
                      "Scan a QR code",
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

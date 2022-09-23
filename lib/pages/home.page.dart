import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qrscanner/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('LOGOUT'),
                      content: const Text('Do you want to logout'),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Yes'),
                          onPressed: () async {
                            // Obtain shared preferences.
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString("PhoneNumber", "");
                            context.router.replace(LoginScreen());
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
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
                      color: Colors.blueGrey,
                      size: MediaQuery.of(context).size.width / 3.2,
                    ),
                    Text(
                      "Create custom QR",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .048,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 26,
                color: Colors.deepPurple,
                endIndent: 26,
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
              const Divider(
                color: Colors.deepPurple,
                indent: 26,
                endIndent: 26,
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
                  context.router.push(UploadImageRoute(documentType: "sdf"));
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

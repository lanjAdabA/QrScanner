import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({Key? key}) : super(key: key);

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final qrkey = GlobalKey(debugLabel: "QR");
  // QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
      ),
      body: Stack(
        alignment: Alignment.center,
        // children: [buildQrView(context)],
      ),
    );
  }

//   buildQrView(BuildContext context) {
//     QRView(
//       key: qrkey,
//       onQRViewCreated: onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//           borderRadius: 10,
//           borderLength: 20,
//           borderWidth: 10,
//           borderColor: Colors.blue,
//           cutOutSize: MediaQuery.of(context).size.width * .8),
//     );
//   }

//   void onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//   }
}

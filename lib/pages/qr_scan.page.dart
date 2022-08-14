import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrscanner/modal/data.model.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({Key? key}) : super(key: key);

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  PrintLetterBarcodeData? scannedData;
  String _scanBarcode = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('QR scanner'),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.purple[50],
            child: Builder(builder: (BuildContext context) {
              return Container(
                alignment: Alignment.center,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(20),
                      // color: Colors.purple[100],
                      child: Text('Scan result : $_scanBarcode\n',
                          style: const TextStyle(fontSize: 20)),
                    ),
                    // ? ElevatedButton(
                    // ?     onPressed: () => scanBarcodeNormal(),
                    // ?     child: const Text('Start barcode scan')),

                    GestureDetector(
                      onTap: () {
                        scanQR();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code_scanner,
                            size: MediaQuery.of(context).size.width / 6,
                          ),
                          Text(
                            "Open Scanner ",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .048,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })));
  }
}

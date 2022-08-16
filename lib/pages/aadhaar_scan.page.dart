import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrscanner/modal/data.model.dart';
import 'package:xml/xml.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class AadhaarScannerPage extends StatefulWidget {
  const AadhaarScannerPage({Key? key}) : super(key: key);

  @override
  State<AadhaarScannerPage> createState() => _AadhaarScannerPageState();
}

class _AadhaarScannerPageState extends State<AadhaarScannerPage> {
  PrintLetterBarcodeData? scannedData;
  // String _scanBarcode = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Aadhaa Qr code scanner'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.purple[50],
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                    controller: TextEditingController(
                        text: scannedData != null ? scannedData!.name : ''),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Name',
                    )),
                TextFormField(
                    controller: TextEditingController(
                        text: scannedData != null ? scannedData!.uid : ''),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'UID',
                    )),
                TextFormField(
                    controller: TextEditingController(
                        text: scannedData != null ? scannedData!.gender : ""),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Gender')),
                TextFormField(
                    controller: TextEditingController(
                        text: scannedData != null ? scannedData!.dob : ''),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'DOB')),
                TextFormField(
                    controller: TextEditingController(
                        text: scannedData != null ? scannedData!.loc : ''),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Address')),
                TextFormField(
                    controller: TextEditingController(
                        text: scannedData != null ? scannedData!.vtc : ''),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Town')),
                TextFormField(
                    controller: TextEditingController(
                        text: scannedData != null ? scannedData!.po : ''),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Post Office')),
                TextFormField(
                    controller: TextEditingController(
                        text: scannedData != null ? scannedData!.dist : ''),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'District')),
                TextFormField(
                    controller: TextEditingController(
                        text: scannedData != null ? scannedData!.state : ''),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'State')),
                TextFormField(
                    controller: TextEditingController(
                        text: scannedData != null ? scannedData!.pc : ''),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Pin Code')),
                GestureDetector(
                  onTap: () async {
                    String barcodeScanRes =
                        await FlutterBarcodeScanner.scanBarcode(
                            "#ff6666", "Cancel", true, ScanMode.QR);
                    // ! * ? todo log(scannedData.toString());
                    var a = XmlDocument.parse(barcodeScanRes);

                    var e = a.getElement("PrintLetterBarcodeData");
                    if (e != null) {
                      var name = e.getAttribute("name");
                      var uid = e.getAttribute("uid");
                      var gender = e.getAttribute("gender");
                      var yob = e.getAttribute("yob");
                      var co = e.getAttribute("co");
                      var loc = e.getAttribute("loc");
                      var vtc = e.getAttribute("vtc");
                      var po = e.getAttribute("po");
                      var dist = e.getAttribute("dist");
                      var subdist = e.getAttribute("subdist");
                      var state = e.getAttribute("state");
                      var pc = e.getAttribute("pc");
                      var dob = e.getAttribute("dob");
                      var userData = PrintLetterBarcodeData(
                          uid: uid,
                          name: name,
                          gender: gender,
                          yob: yob,
                          co: co,
                          loc: loc,
                          vtc: vtc,
                          po: po,
                          dist: dist,
                          subdist: subdist,
                          state: state,
                          pc: pc,
                          dob: dob);
                      setState(() {
                        scannedData = userData;
                      });
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: width / 2.7,
                        width: width / 2.7,
                        child: Animator<double>(
                          duration: const Duration(milliseconds: 1000),
                          cycles: 0,
                          curve: Curves.easeInOutCirc,
                          tween: Tween<double>(begin: 20.0, end: 25.0),
                          builder: (context, animatorState, child) => Icon(
                            Icons.qr_code_scanner,
                            size: animatorState.value * 5,
                          ),
                        ),
                      ),
                      Text(
                        "Open Scanner ",
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
      ),
    );
  }
}

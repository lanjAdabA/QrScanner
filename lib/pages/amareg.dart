// import 'dart:developer';
// import 'package:flutter_dropdown_alert/alert_controller.dart';
// import 'package:flutter_dropdown_alert/dropdown_alert.dart';
// import 'package:flutter_dropdown_alert/model/data_alert.dart';
// import 'package:qrcodescanner/refactor/imagepicker.dart';
// import 'package:qrcodescanner/services/localstorage.dart';
// import 'package:qrcodescanner/services/firebase_storage.dart';
// import 'package:qrcodescanner/modal/xml_modal.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:xml/xml.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity),
//       builder: (context, child) => Stack(
//         children: [
//           child!,
//           const DropdownAlert(
//             position: AlertPosition.BOTTOM,
//           )
//         ],
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const BarcodeScannerApp(),
//     );
//   }
// }

// class BarcodeScannerApp extends StatefulWidget {
//   const BarcodeScannerApp({Key? key}) : super(key: key);

//   @override
//   State<BarcodeScannerApp> createState() => _BarcodeScannerAppState();
// }

// class _BarcodeScannerAppState extends State<BarcodeScannerApp> {
//   PrintLetterBarcodeData? AdhaarData;
//   String fullname = '';
//   final Storage storage = Storage();
//   String frontImagePath = '';
//   String backImagePath = '';
//   bool isLoading = false;
//   Color btncolor = const Color.fromARGB(255, 29, 76, 194);

//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   @override
//   void initState() {
//     super.initState;
//     clear();
//   }

//   void alerdial() {
//     AlertController.show(
//       " Scan QR Code First",
//       "And then Pick Images",
//       TypeAlert.warning,
//     );
//   }

//   clear() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey('frontImagePath') &&
//         prefs.containsKey('backImagePath')) {
//       prefs.remove('frontImagePath');
//       prefs.remove('backImagePath');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('Barcode Scanner')),
//         body: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(top: 10),
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       'WELCOME TO AADHAAR QR CODE SCANNER',
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Color.fromARGB(255, 223, 36, 105),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   SizedBox(
//                     height: 200,
//                     child: Image.asset('assets/images/scanner.jpg'),
//                   ),
//                   Container(
//                     child: Padding(
//                         padding: const EdgeInsets.all(30),
//                         child: Form(
//                           child: Column(
//                             children: [
//                               TextFormField(
//                                   controller: TextEditingController(
//                                       text: AdhaarData != null
//                                           ? AdhaarData!.name
//                                           : ''),
//                                   decoration: const InputDecoration(
//                                       label: Text("Name"), hintText: 'Name')),
//                               TextFormField(
//                                   controller: TextEditingController(
//                                       text: AdhaarData != null
//                                           ? AdhaarData!.uid
//                                           : ''),
//                                   decoration: const InputDecoration(
//                                       label: Text("Aadhaar Number"),
//                                       hintText: 'uid')),
//                               TextFormField(
//                                   controller: TextEditingController(
//                                       text: AdhaarData != null
//                                           ? AdhaarData!.gender
//                                           : ''),
//                                   decoration: InputDecoration(
//                                       label: const Text("Gender"),
//                                       hintText: AdhaarData != null
//                                           ? AdhaarData!.gender
//                                           : 'gender')),
//                               TextFormField(
//                                   controller: TextEditingController(
//                                       text: AdhaarData != null
//                                           ? AdhaarData!.dob
//                                           : ''),
//                                   decoration: InputDecoration(
//                                       label: const Text("Date Of Birth"),
//                                       hintText: AdhaarData != null
//                                           ? AdhaarData!.dob
//                                           : 'DOB')),
//                               TextFormField(
//                                   controller: TextEditingController(
//                                       text: AdhaarData != null
//                                           ? AdhaarData!.loc
//                                           : ''),
//                                   decoration: InputDecoration(
//                                       label: const Text("Address"),
//                                       hintText: AdhaarData != null
//                                           ? AdhaarData!.loc
//                                           : 'Address')),
//                               const SizedBox(
//                                 height: 50,
//                               ),
//                               Container(
//                                 child: ElevatedButton(
//                                     onPressed: () async {
//                                       String barcodeScanRes;

//                                       try {
//                                         barcodeScanRes =
//                                             await FlutterBarcodeScanner
//                                                 .scanBarcode(
//                                                     '#ff6666',
//                                                     'Cancel',
//                                                     true,
//                                                     ScanMode.QR);
//                                       } on PlatformException {
//                                         barcodeScanRes =
//                                             'Failed to get platform version.';
//                                       }
//                                       if (!mounted) return;
//                                       final document =
//                                           XmlDocument.parse(barcodeScanRes);
//                                       var data = document
//                                           .getElement('PrintLetterBarcodeData');
//                                       var uid = data!.getAttribute('uid');
//                                       var name = data.getAttribute('name');
//                                       var gender = data.getAttribute('gender');
//                                       var yob = data.getAttribute('yob');
//                                       var co = data.getAttribute('co');
//                                       var loc = data.getAttribute('loc');
//                                       var vtc = data.getAttribute('vtc');
//                                       var po = data.getAttribute('po');
//                                       var dist = data.getAttribute('dist');
//                                       var subdist =
//                                           data.getAttribute('subdist');
//                                       var state = data.getAttribute('state');
//                                       var pc = data.getAttribute('pc');
//                                       var dob = data.getAttribute('dob');
//                                       PrintLetterBarcodeData finaldata =
//                                           PrintLetterBarcodeData(
//                                               uid: uid,
//                                               name: name,
//                                               gender: gender,
//                                               yob: yob,
//                                               co: co,
//                                               loc: loc,
//                                               vtc: vtc,
//                                               po: po,
//                                               dist: dist,
//                                               subdist: subdist,
//                                               state: state,
//                                               pc: pc,
//                                               dob: dob);

//                                       setState(() {
//                                         AdhaarData = finaldata;
//                                         fullname = name!;
//                                       });
//                                     },
//                                     child: const Text('Start QR Scan')),
//                               ),
//                             ],
//                           ),
//                         )),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AadhaarImagePicker(
//                         filepath: 'frontImagePath',
//                         Uploadname: 'Upload Front',
//                         fullname: fullname,
//                         alertdialog: alerdial,
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       AadhaarImagePicker(
//                         filepath: 'backImagePath',
//                         Uploadname: 'Upload Back',
//                         fullname: fullname,
//                         alertdialog: alerdial,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           primary: btncolor,
//                           minimumSize: const Size.fromHeight(40),
//                           elevation: 5,
//                         ),
//                         onPressed: () async {
//                           setState(() {
//                             isLoading = true;
//                             btncolor = const Color.fromARGB(255, 62, 185, 66);
//                           });
//                           var front = await DiskRepo().retrieve1();
//                           var back = await DiskRepo().retrieve2();
//                           setState(() {
//                             frontImagePath = front;
//                             backImagePath = back;
//                           });

//                           storage
//                               .uploadFile(
//                                   filename1: 'Front',
//                                   frontImagePath: frontImagePath,
//                                   name: fullname,
//                                   metadata: AdhaarData,
//                                   backImagePath: backImagePath,
//                                   filename2: 'Back')
//                               .then((value) async {
//                             setState(() {
//                               isLoading = false;
//                               btncolor = const Color.fromARGB(255, 29, 76, 194);
//                             });
//                             // _displaySuccessMotionToast();
//                             AlertController.show(
//                               " Done Uploaded",
//                               "Successfully!",
//                               TypeAlert.success,
//                             );
//                             log('Done Upload');
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (BuildContext context) =>
//                                         super.widget));
//                           }).onError((error, stackTrace) {
//                             setState(() {
//                               isLoading = false;
//                               btncolor = const Color.fromARGB(255, 29, 76, 194);
//                             });
//                             return AlertController.show(
//                               " No File Found",
//                               "Select the file first!",
//                               TypeAlert.error,
//                             );
//                           });
//                         },
//                         child: isLoading
//                             ? Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: const [
//                                   Text(
//                                     'Uploading...',
//                                     style: TextStyle(fontSize: 17),
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   CircularProgressIndicator(
//                                     color: Colors.white,
//                                   ),
//                                 ],
//                               )
//                             : Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: const [
//                                   Icon(Icons.cloud_upload_outlined, size: 28),
//                                   SizedBox(width: 16),
//                                   Text(
//                                     "Upload File",
//                                     style: TextStyle(
//                                         fontSize: 18, color: Colors.white),
//                                   ),
//                                 ],
//                               )),
//                   )
//                 ])));
//   }
// }

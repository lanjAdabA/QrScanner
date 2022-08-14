import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCreatePage extends StatefulWidget {
  const QrCreatePage({Key? key}) : super(key: key);

  @override
  State<QrCreatePage> createState() => _QrCreatePageState();
}

class _QrCreatePageState extends State<QrCreatePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qr Code Generator"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.purple[50],
        child: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: controller.text,
                  size: MediaQuery.of(context).size.height / 3,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                buildTextField(context)
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget buildTextField(BuildContext contect) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      decoration: InputDecoration(
          hintText: "Enter Data",
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.green),
          ),
          suffixIcon: IconButton(
              onPressed: () => setState(() {}),
              icon: const Icon(
                Icons.done,
                size: 30,
              ))),
    );
  }
}

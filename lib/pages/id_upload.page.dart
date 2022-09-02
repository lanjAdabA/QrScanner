import 'package:flutter/material.dart';

class CreateIdFolderPage extends StatefulWidget {
  const CreateIdFolderPage({Key? key}) : super(key: key);

  @override
  State<CreateIdFolderPage> createState() => _CreateIdFolderPageState();
}

class _CreateIdFolderPageState extends State<CreateIdFolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      appBar: AppBar(
        title: const Text("creating folder"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.purple[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    onPressed: () {}, child: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

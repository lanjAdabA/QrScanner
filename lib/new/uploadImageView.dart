import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadImageView extends StatefulWidget {
  final rjson;
  final titleSpace;
  UploadImageView({this.rjson,this.titleSpace});

  @override
  _UploadImageViewState createState() => _UploadImageViewState();
}

class _UploadImageViewState extends State<UploadImageView> {

  List docFac = [];
  List docImage = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.rjson);

    docFac = [];
    widget.rjson.forEach((k,v){
      docFac.add(k);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleSpace)
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: docFac.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ClipRRect(
                  child: FadeInImage.assetNetwork(placeholder: "assets/sampleID.png", image: widget.rjson[docFac[index]]["imgUrl"]),
                ),
              );
            },)
        ),
      ),
    );
  }
}

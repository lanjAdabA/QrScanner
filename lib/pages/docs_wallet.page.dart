import 'package:auto_route/auto_route.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:qrscanner/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWalletPage extends StatefulWidget {
  const MyWalletPage({Key? key}) : super(key: key);

  @override
  State<MyWalletPage> createState() => _MyWalletPageState();
}



class _MyWalletPageState extends State<MyWalletPage> {

  List title = [];
  //List faceCount =[];
  List imgUrl = [];
  var arg_json;
  late String phoneNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPhone();
  }
  void getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    phoneNum = prefs.getString("PhoneNumber").toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Documents"),
          centerTitle: true,
        ),
        body: Builder(
          builder: (BuildContext context) {
            late DatabaseReference _dbref;
            _dbref = FirebaseDatabase.instance.ref("documentkeeper");
            return StreamBuilder(
              stream: _dbref.onValue,
                builder: (context, snapshot) {
                  List messageList = [];
                  if (snapshot.hasData &&
                      snapshot.data != null &&
                      (snapshot.data! as DatabaseEvent).snapshot.value !=
                          null) {
                    final myMessages = Map<dynamic, dynamic>.from(
                        (snapshot.data! as DatabaseEvent).snapshot.value
                        as Map<dynamic, dynamic>);
                     title = [];
                     imgUrl = [];
                    myMessages[phoneNum]["data"].forEach((k,v){
                      title.add(k);
                      //faceCount = myMessages["+917005807751"]["data"][k].length;
                      arg_json = myMessages[phoneNum]["data"];


                    });


                    return Center(
                      child: Container(
                        child: ListView.builder(
                          itemCount: title.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: (){
                                context.router.push(UploadImageView(rjson :arg_json[title[index]],titleSpace: title[index].toString()));
                              },
                              child: Card(
                                  child: ListTile(
                                    leading: Icon(Icons.book),
                                    title: Text("${title[index]}"),
                                    trailing: CircleAvatar(child: Text(arg_json[title[index]].length.toString())),
                                  )),
                            );
                          },)
                      ),
                    );
                  }
                  return Container();
                }
            );
          },
        )
    );
  }
}


    // return Scaffold(
    //   backgroundColor: Colors.purple[50],
    //   appBar: AppBar(
    //       title: const Text("Wallet"),
    //       centerTitle: true,
    //       systemOverlayStyle: SystemUiOverlayStyle.light),
    //   body: AnimationLimiter(
    //     child: GridView.count(
    //       physics: const BouncingScrollPhysics(
    //           parent: AlwaysScrollableScrollPhysics()),
    //       padding: EdgeInsets.all(w / 60),
    //       crossAxisCount: columnCount,
    //       children: List.generate(
    //         7,
    //         (int index) {
    //           return AnimationConfiguration.staggeredGrid(
    //             position: index,
    //             duration: const Duration(milliseconds: 500),
    //             columnCount: columnCount,
    //             child: ScaleAnimation(
    //               duration: const Duration(milliseconds: 900),
    //               curve: Curves.fastLinearToSlowEaseIn,
    //               child: FadeInAnimation(
    //                 child: Container(
    //                   margin: EdgeInsets.only(
    //                       bottom: w / 30, left: w / 60, right: w / 60),
    //                   decoration: BoxDecoration(
    //                     color: Colors.white54,
    //                     borderRadius:
    //                         const BorderRadius.all(Radius.circular(20)),
    //                     boxShadow: [
    //                       BoxShadow(
    //                         color: Colors.black.withOpacity(0.1),
    //                         blurRadius: 40,
    //                         spreadRadius: 10,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
//   }
// }

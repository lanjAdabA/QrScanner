import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class MyWalletPage extends StatefulWidget {
  const MyWalletPage({Key? key}) : super(key: key);

  @override
  State<MyWalletPage> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  final List<Map<String, dynamic>> shapeData = [
    {
      'shapeName': "Aadhaar",
      'shapeImg': 'assets/ranAadhaar.jpg',
    },
    {
      'shapeName': "Driving Licence",
      'shapeImg': 'assets/drivingL.jpg',
    },
    {
      'shapeName': "Pan Card",
      'shapeImg': 'assets/ramPAN.jpg',
    },
    {
      'shapeName': "Voter Card",
      'shapeImg': 'assets/ranVoter.jpg',
    },
    {
      'shapeName': "Add new",
      'shapeImg': 'assets/sampleID.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Number_Chart"),
        centerTitle: true,
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          enableInfiniteScroll: true,
          viewportFraction: .43,
          height: height * 1,
        ),
        items: shapeData.map((e) {
          return Container(
            decoration: BoxDecoration(
              // color: e["shapeColor"],
              color: Colors.purple[50],
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            width: width * 1,
            height: height / 2.6,
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    e["shapeName"],
                    style: TextStyle(
                        fontFamily: "titanOne", fontSize: height * 0.04),
                  ),
                  SizedBox(
                      height: height / 3,
                      width: width / 1.5,
                      child: Image.asset(e["shapeImg"])),
                ],
              ),
            ),
          );
        }).toList(),
      ),
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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qrscanner/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String phoneNum = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Row(
                children: [
                  Image.asset("assets/icon.JPG"),
                  Image.asset("assets/sampleID.png"),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            LinearProgressIndicator(
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    phoneNum = prefs.getString("PhoneNumber").toString();
    if (phoneNum != "" && phoneNum != null) {
      await Future.delayed(Duration(seconds: 3));
      context.router.replace(HomeRoute());
    } else {
      await Future.delayed(Duration(seconds: 3));
      context.router.replace(LoginScreen());
    }
    print("XXXXXXXXXXx $phoneNum");
  }
}

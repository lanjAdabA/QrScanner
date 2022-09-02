import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qrscanner/pages/home.page.dart';
import 'package:qrscanner/pages/login.page.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({Key? key}) : super(key: key);

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return
                  // const Icon(Icons.lunch_dining_outlined)
                  const HomePage();
            } else {
              return const SignInPage();
            }
          }),
    );
  }
}

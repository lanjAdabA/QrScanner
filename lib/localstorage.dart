import 'package:shared_preferences/shared_preferences.dart';

class DiskRepo {
  String retrivepath = '';

  final Future<SharedPreferences> prefstate = SharedPreferences.getInstance();

  retrieve1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    retrivepath = prefs.getString('frontImagePath').toString();
    return retrivepath;
  }

  retrieve2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    retrivepath = prefs.getString('backImagePath').toString();
    return retrivepath;
  }
}

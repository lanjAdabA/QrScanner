// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:qrscanner/pages/home.page.dart';
import 'package:qrscanner/pages/qr_create.page.dart';
import 'package:qrscanner/pages/qr_scan.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: QrCreatePage),
    AutoRoute(page: QrScannerPage),
  ],
)
class $AppRouter {}

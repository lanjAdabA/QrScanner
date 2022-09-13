// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:qrscanner/pages/aadhaar_scan.page.dart';
import 'package:qrscanner/pages/camera_upload.page.dart';
import 'package:qrscanner/pages/docs_wallet.page.dart';
import 'package:qrscanner/pages/home.page.dart';
import 'package:qrscanner/pages/id_upload.page.dart';
import 'package:qrscanner/pages/image_upload.page.dart';
import 'package:qrscanner/pages/login.page.dart';
import 'package:qrscanner/pages/qr_create.page.dart';
import 'package:qrscanner/pages/qr_scan.page.dart';
import 'package:qrscanner/pages/signup.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: QrCreatePage),
    AutoRoute(page: QrScannerPage),
    AutoRoute(page: AadhaarScannerPage),
    AutoRoute(page: UploadImagePage),
    AutoRoute(page: UploadCameraPage),
    AutoRoute(page: CreateIdFolderPage),
    AutoRoute(page: SignInPage),
    AutoRoute(page: SignUpPage),
    AutoRoute(page: MyWalletPage),
  ],
)
class $AppRouter {}

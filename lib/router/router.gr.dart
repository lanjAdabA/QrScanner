// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../new/loadingScreen.dart' as _i1;
import '../new/loginscreen.dart' as _i2;
import '../new/uploadImageView.dart' as _i13;
import '../pages/aadhaar_scan.page.dart' as _i6;
import '../pages/camera_upload.page.dart' as _i8;
import '../pages/docs_wallet.page.dart' as _i12;
import '../pages/home.page.dart' as _i3;
import '../pages/id_upload.page.dart' as _i9;
import '../pages/image_upload.page.dart' as _i7;
import '../pages/login.page.dart' as _i10;
import '../pages/qr_create.page.dart' as _i4;
import '../pages/qr_scan.page.dart' as _i5;
import '../pages/signup.page.dart' as _i11;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    LoadingScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoadingScreen());
    },
    LoginScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginScreen());
    },
    HomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    QrCreateRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.QrCreatePage());
    },
    QrScannerRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.QrScannerPage());
    },
    AadhaarScannerRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AadhaarScannerPage());
    },
    UploadImageRoute.name: (routeData) {
      final args = routeData.argsAs<UploadImageRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.UploadImagePage(args.documentType));
    },
    UploadCameraRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.UploadCameraPage());
    },
    CreateIdFolderRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.CreateIdFolderPage());
    },
    SignInRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SignUpPage());
    },
    MyWalletRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.MyWalletPage());
    },
    UploadImageView.name: (routeData) {
      final args = routeData.argsAs<UploadImageViewArgs>(
          orElse: () => const UploadImageViewArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.UploadImageView(
              rjson: args.rjson, titleSpace: args.titleSpace));
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(LoadingScreen.name, path: '/'),
        _i14.RouteConfig(LoginScreen.name, path: '/login-screen'),
        _i14.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i14.RouteConfig(QrCreateRoute.name, path: '/qr-create-page'),
        _i14.RouteConfig(QrScannerRoute.name, path: '/qr-scanner-page'),
        _i14.RouteConfig(AadhaarScannerRoute.name,
            path: '/aadhaar-scanner-page'),
        _i14.RouteConfig(UploadImageRoute.name, path: '/upload-image-page'),
        _i14.RouteConfig(UploadCameraRoute.name, path: '/upload-camera-page'),
        _i14.RouteConfig(CreateIdFolderRoute.name,
            path: '/create-id-folder-page'),
        _i14.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i14.RouteConfig(SignUpRoute.name, path: '/sign-up-page'),
        _i14.RouteConfig(MyWalletRoute.name, path: '/my-wallet-page'),
        _i14.RouteConfig(UploadImageView.name, path: '/upload-image-view')
      ];
}

/// generated route for
/// [_i1.LoadingScreen]
class LoadingScreen extends _i14.PageRouteInfo<void> {
  const LoadingScreen() : super(LoadingScreen.name, path: '/');

  static const String name = 'LoadingScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i14.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login-screen');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.QrCreatePage]
class QrCreateRoute extends _i14.PageRouteInfo<void> {
  const QrCreateRoute() : super(QrCreateRoute.name, path: '/qr-create-page');

  static const String name = 'QrCreateRoute';
}

/// generated route for
/// [_i5.QrScannerPage]
class QrScannerRoute extends _i14.PageRouteInfo<void> {
  const QrScannerRoute() : super(QrScannerRoute.name, path: '/qr-scanner-page');

  static const String name = 'QrScannerRoute';
}

/// generated route for
/// [_i6.AadhaarScannerPage]
class AadhaarScannerRoute extends _i14.PageRouteInfo<void> {
  const AadhaarScannerRoute()
      : super(AadhaarScannerRoute.name, path: '/aadhaar-scanner-page');

  static const String name = 'AadhaarScannerRoute';
}

/// generated route for
/// [_i7.UploadImagePage]
class UploadImageRoute extends _i14.PageRouteInfo<UploadImageRouteArgs> {
  UploadImageRoute({required dynamic documentType})
      : super(UploadImageRoute.name,
            path: '/upload-image-page',
            args: UploadImageRouteArgs(documentType: documentType));

  static const String name = 'UploadImageRoute';
}

class UploadImageRouteArgs {
  const UploadImageRouteArgs({required this.documentType});

  final dynamic documentType;

  @override
  String toString() {
    return 'UploadImageRouteArgs{documentType: $documentType}';
  }
}

/// generated route for
/// [_i8.UploadCameraPage]
class UploadCameraRoute extends _i14.PageRouteInfo<void> {
  const UploadCameraRoute()
      : super(UploadCameraRoute.name, path: '/upload-camera-page');

  static const String name = 'UploadCameraRoute';
}

/// generated route for
/// [_i9.CreateIdFolderPage]
class CreateIdFolderRoute extends _i14.PageRouteInfo<void> {
  const CreateIdFolderRoute()
      : super(CreateIdFolderRoute.name, path: '/create-id-folder-page');

  static const String name = 'CreateIdFolderRoute';
}

/// generated route for
/// [_i10.SignInPage]
class SignInRoute extends _i14.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i11.SignUpPage]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i12.MyWalletPage]
class MyWalletRoute extends _i14.PageRouteInfo<void> {
  const MyWalletRoute() : super(MyWalletRoute.name, path: '/my-wallet-page');

  static const String name = 'MyWalletRoute';
}

/// generated route for
/// [_i13.UploadImageView]
class UploadImageView extends _i14.PageRouteInfo<UploadImageViewArgs> {
  UploadImageView({dynamic rjson, dynamic titleSpace})
      : super(UploadImageView.name,
            path: '/upload-image-view',
            args: UploadImageViewArgs(rjson: rjson, titleSpace: titleSpace));

  static const String name = 'UploadImageView';
}

class UploadImageViewArgs {
  const UploadImageViewArgs({this.rjson, this.titleSpace});

  final dynamic rjson;

  final dynamic titleSpace;

  @override
  String toString() {
    return 'UploadImageViewArgs{rjson: $rjson, titleSpace: $titleSpace}';
  }
}

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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../pages/aadhaar_scan.page.dart' as _i4;
import '../pages/camera_upload.page.dart' as _i6;
import '../pages/docs_wallet.page.dart' as _i10;
import '../pages/home.page.dart' as _i1;
import '../pages/id_upload.page.dart' as _i7;
import '../pages/image_upload.page.dart' as _i5;
import '../pages/login.page.dart' as _i8;
import '../pages/qr_create.page.dart' as _i2;
import '../pages/qr_scan.page.dart' as _i3;
import '../pages/signup.page.dart' as _i9;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    QrCreateRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.QrCreatePage());
    },
    QrScannerRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.QrScannerPage());
    },
    AadhaarScannerRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AadhaarScannerPage());
    },
    UploadImageRoute.name: (routeData) {
      final args = routeData.argsAs<UploadImageRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.UploadImagePage(args.documentType));
    },
    UploadCameraRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.UploadCameraPage());
    },
    CreateIdFolderRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CreateIdFolderPage());
    },
    SignInRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SignUpPage());
    },
    MyWalletRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.MyWalletPage());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(HomeRoute.name, path: '/'),
        _i11.RouteConfig(QrCreateRoute.name, path: '/qr-create-page'),
        _i11.RouteConfig(QrScannerRoute.name, path: '/qr-scanner-page'),
        _i11.RouteConfig(AadhaarScannerRoute.name,
            path: '/aadhaar-scanner-page'),
        _i11.RouteConfig(UploadImageRoute.name, path: '/upload-image-page'),
        _i11.RouteConfig(UploadCameraRoute.name, path: '/upload-camera-page'),
        _i11.RouteConfig(CreateIdFolderRoute.name,
            path: '/create-id-folder-page'),
        _i11.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i11.RouteConfig(SignUpRoute.name, path: '/sign-up-page'),
        _i11.RouteConfig(MyWalletRoute.name, path: '/my-wallet-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.QrCreatePage]
class QrCreateRoute extends _i11.PageRouteInfo<void> {
  const QrCreateRoute() : super(QrCreateRoute.name, path: '/qr-create-page');

  static const String name = 'QrCreateRoute';
}

/// generated route for
/// [_i3.QrScannerPage]
class QrScannerRoute extends _i11.PageRouteInfo<void> {
  const QrScannerRoute() : super(QrScannerRoute.name, path: '/qr-scanner-page');

  static const String name = 'QrScannerRoute';
}

/// generated route for
/// [_i4.AadhaarScannerPage]
class AadhaarScannerRoute extends _i11.PageRouteInfo<void> {
  const AadhaarScannerRoute()
      : super(AadhaarScannerRoute.name, path: '/aadhaar-scanner-page');

  static const String name = 'AadhaarScannerRoute';
}

/// generated route for
/// [_i5.UploadImagePage]
class UploadImageRoute extends _i11.PageRouteInfo<UploadImageRouteArgs> {
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
/// [_i6.UploadCameraPage]
class UploadCameraRoute extends _i11.PageRouteInfo<void> {
  const UploadCameraRoute()
      : super(UploadCameraRoute.name, path: '/upload-camera-page');

  static const String name = 'UploadCameraRoute';
}

/// generated route for
/// [_i7.CreateIdFolderPage]
class CreateIdFolderRoute extends _i11.PageRouteInfo<void> {
  const CreateIdFolderRoute()
      : super(CreateIdFolderRoute.name, path: '/create-id-folder-page');

  static const String name = 'CreateIdFolderRoute';
}

/// generated route for
/// [_i8.SignInPage]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i9.SignUpPage]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i10.MyWalletPage]
class MyWalletRoute extends _i11.PageRouteInfo<void> {
  const MyWalletRoute() : super(MyWalletRoute.name, path: '/my-wallet-page');

  static const String name = 'MyWalletRoute';
}

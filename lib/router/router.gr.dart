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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../pages/aadhaar_scan.page.dart' as _i4;
import '../pages/camera_upload.page.dart' as _i6;
import '../pages/home.page.dart' as _i1;
import '../pages/id_upload.page.dart' as _i7;
import '../pages/image_upload.page.dart' as _i5;
import '../pages/login.page.dart' as _i8;
import '../pages/qr_create.page.dart' as _i2;
import '../pages/qr_scan.page.dart' as _i3;
import '../pages/signup.page.dart' as _i9;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    QrCreateRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.QrCreatePage());
    },
    QrScannerRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.QrScannerPage());
    },
    AadhaarScannerRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AadhaarScannerPage());
    },
    UploadImageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.UploadImagePage());
    },
    UploadCameraRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.UploadCameraPage());
    },
    CreateIdFolderRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CreateIdFolderPage());
    },
    SignInRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SignUpPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(HomeRoute.name, path: '/'),
        _i10.RouteConfig(QrCreateRoute.name, path: '/qr-create-page'),
        _i10.RouteConfig(QrScannerRoute.name, path: '/qr-scanner-page'),
        _i10.RouteConfig(AadhaarScannerRoute.name,
            path: '/aadhaar-scanner-page'),
        _i10.RouteConfig(UploadImageRoute.name, path: '/upload-image-page'),
        _i10.RouteConfig(UploadCameraRoute.name, path: '/upload-camera-page'),
        _i10.RouteConfig(CreateIdFolderRoute.name,
            path: '/create-id-folder-page'),
        _i10.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i10.RouteConfig(SignUpRoute.name, path: '/sign-up-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.QrCreatePage]
class QrCreateRoute extends _i10.PageRouteInfo<void> {
  const QrCreateRoute() : super(QrCreateRoute.name, path: '/qr-create-page');

  static const String name = 'QrCreateRoute';
}

/// generated route for
/// [_i3.QrScannerPage]
class QrScannerRoute extends _i10.PageRouteInfo<void> {
  const QrScannerRoute() : super(QrScannerRoute.name, path: '/qr-scanner-page');

  static const String name = 'QrScannerRoute';
}

/// generated route for
/// [_i4.AadhaarScannerPage]
class AadhaarScannerRoute extends _i10.PageRouteInfo<void> {
  const AadhaarScannerRoute()
      : super(AadhaarScannerRoute.name, path: '/aadhaar-scanner-page');

  static const String name = 'AadhaarScannerRoute';
}

/// generated route for
/// [_i5.UploadImagePage]
class UploadImageRoute extends _i10.PageRouteInfo<void> {
  const UploadImageRoute()
      : super(UploadImageRoute.name, path: '/upload-image-page');

  static const String name = 'UploadImageRoute';
}

/// generated route for
/// [_i6.UploadCameraPage]
class UploadCameraRoute extends _i10.PageRouteInfo<void> {
  const UploadCameraRoute()
      : super(UploadCameraRoute.name, path: '/upload-camera-page');

  static const String name = 'UploadCameraRoute';
}

/// generated route for
/// [_i7.CreateIdFolderPage]
class CreateIdFolderRoute extends _i10.PageRouteInfo<void> {
  const CreateIdFolderRoute()
      : super(CreateIdFolderRoute.name, path: '/create-id-folder-page');

  static const String name = 'CreateIdFolderRoute';
}

/// generated route for
/// [_i8.SignInPage]
class SignInRoute extends _i10.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i9.SignUpPage]
class SignUpRoute extends _i10.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

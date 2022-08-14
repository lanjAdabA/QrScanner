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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../pages/aadhaar_scan.page.dart' as _i4;
import '../pages/home.page.dart' as _i1;
import '../pages/image_upload.page.dart' as _i5;
import '../pages/qr_create.page.dart' as _i2;
import '../pages/qr_scan.page.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    QrCreateRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.QrCreatePage());
    },
    QrScannerRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.QrScannerPage());
    },
    AadhaarScannerRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AadhaarScannerPage());
    },
    UploadImageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.UploadImagePage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(HomeRoute.name, path: '/'),
        _i6.RouteConfig(QrCreateRoute.name, path: '/qr-create-page'),
        _i6.RouteConfig(QrScannerRoute.name, path: '/qr-scanner-page'),
        _i6.RouteConfig(AadhaarScannerRoute.name,
            path: '/aadhaar-scanner-page'),
        _i6.RouteConfig(UploadImageRoute.name, path: '/upload-image-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.QrCreatePage]
class QrCreateRoute extends _i6.PageRouteInfo<void> {
  const QrCreateRoute() : super(QrCreateRoute.name, path: '/qr-create-page');

  static const String name = 'QrCreateRoute';
}

/// generated route for
/// [_i3.QrScannerPage]
class QrScannerRoute extends _i6.PageRouteInfo<void> {
  const QrScannerRoute() : super(QrScannerRoute.name, path: '/qr-scanner-page');

  static const String name = 'QrScannerRoute';
}

/// generated route for
/// [_i4.AadhaarScannerPage]
class AadhaarScannerRoute extends _i6.PageRouteInfo<void> {
  const AadhaarScannerRoute()
      : super(AadhaarScannerRoute.name, path: '/aadhaar-scanner-page');

  static const String name = 'AadhaarScannerRoute';
}

/// generated route for
/// [_i5.UploadImagePage]
class UploadImageRoute extends _i6.PageRouteInfo<void> {
  const UploadImageRoute()
      : super(UploadImageRoute.name, path: '/upload-image-page');

  static const String name = 'UploadImageRoute';
}

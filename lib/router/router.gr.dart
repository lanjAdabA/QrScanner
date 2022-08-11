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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/home.page.dart' as _i1;
import '../pages/qr_create.page.dart' as _i2;
import '../pages/qr_scan.page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    QrCreateRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.QrCreatePage());
    },
    QrScannerRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.QrScannerPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(QrCreateRoute.name, path: '/qr-create-page'),
        _i4.RouteConfig(QrScannerRoute.name, path: '/qr-scanner-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.QrCreatePage]
class QrCreateRoute extends _i4.PageRouteInfo<void> {
  const QrCreateRoute() : super(QrCreateRoute.name, path: '/qr-create-page');

  static const String name = 'QrCreateRoute';
}

/// generated route for
/// [_i3.QrScannerPage]
class QrScannerRoute extends _i4.PageRouteInfo<void> {
  const QrScannerRoute() : super(QrScannerRoute.name, path: '/qr-scanner-page');

  static const String name = 'QrScannerRoute';
}

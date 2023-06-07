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

import '../core/authflowpage.dart' as _i5;
import '../model/basemodel.dart' as _i16;
import '../src/example_module/page/brand.page.dart' as _i11;
import '../src/example_module/page/cart.page.dart' as _i12;
import '../src/example_module/page/dashboard.page.dart' as _i8;
import '../src/example_module/page/details.page.dart' as _i7;
import '../src/example_module/page/forgotPass.page.dart' as _i2;
import '../src/example_module/page/getstarted.page.dart' as _i4;
import '../src/example_module/page/homePage.dart' as _i10;
import '../src/example_module/page/login.page.dart' as _i9;
import '../src/example_module/page/otp.page.dart' as _i3;
import '../src/example_module/page/profile.page.dart' as _i13;
import '../src/example_module/page/signup.page.dart' as _i1;
import '../src/example_module/page/wishlist.page.dart' as _i6;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SignupRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SignupPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.OtpPage(),
      );
    },
    GetStartedRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.GetStartedPage(),
      );
    },
    AuthFlowpage.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AuthFlowpage(),
      );
    },
    WishlistRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.WishlistPage(),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DetailsPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.DashboardPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.HomePage(),
      );
    },
    BrandRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.BrandPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.CartPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ProfilePage(),
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          SignupRoute.name,
          path: '/signup-page',
        ),
        _i14.RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        ),
        _i14.RouteConfig(
          OtpRoute.name,
          path: '/otp-page',
        ),
        _i14.RouteConfig(
          GetStartedRoute.name,
          path: '/get-started-page',
        ),
        _i14.RouteConfig(
          AuthFlowpage.name,
          path: '/',
          children: [
            _i14.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard-page',
              parent: AuthFlowpage.name,
              children: [
                _i14.RouteConfig(
                  HomeRoute.name,
                  path: 'home-page',
                  parent: DashboardRoute.name,
                ),
                _i14.RouteConfig(
                  BrandRoute.name,
                  path: 'brand-page',
                  parent: DashboardRoute.name,
                ),
                _i14.RouteConfig(
                  CartRoute.name,
                  path: 'cart-page',
                  parent: DashboardRoute.name,
                ),
                _i14.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile-page',
                  parent: DashboardRoute.name,
                ),
              ],
            ),
            _i14.RouteConfig(
              LoginRoute.name,
              path: 'login-page',
              parent: AuthFlowpage.name,
            ),
          ],
        ),
        _i14.RouteConfig(
          WishlistRoute.name,
          path: '/wishlist-page',
        ),
        _i14.RouteConfig(
          DetailsRoute.name,
          path: '/details-page',
        ),
      ];
}

/// generated route for
/// [_i1.SignupPage]
class SignupRoute extends _i14.PageRouteInfo<void> {
  const SignupRoute()
      : super(
          SignupRoute.name,
          path: '/signup-page',
        );

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i14.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        );

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i3.OtpPage]
class OtpRoute extends _i14.PageRouteInfo<void> {
  const OtpRoute()
      : super(
          OtpRoute.name,
          path: '/otp-page',
        );

  static const String name = 'OtpRoute';
}

/// generated route for
/// [_i4.GetStartedPage]
class GetStartedRoute extends _i14.PageRouteInfo<void> {
  const GetStartedRoute()
      : super(
          GetStartedRoute.name,
          path: '/get-started-page',
        );

  static const String name = 'GetStartedRoute';
}

/// generated route for
/// [_i5.AuthFlowpage]
class AuthFlowpage extends _i14.PageRouteInfo<void> {
  const AuthFlowpage({List<_i14.PageRouteInfo>? children})
      : super(
          AuthFlowpage.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AuthFlowpage';
}

/// generated route for
/// [_i6.WishlistPage]
class WishlistRoute extends _i14.PageRouteInfo<void> {
  const WishlistRoute()
      : super(
          WishlistRoute.name,
          path: '/wishlist-page',
        );

  static const String name = 'WishlistRoute';
}

/// generated route for
/// [_i7.DetailsPage]
class DetailsRoute extends _i14.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i15.Key? key,
    required _i16.BaseModel data,
  }) : super(
          DetailsRoute.name,
          path: '/details-page',
          args: DetailsRouteArgs(
            key: key,
            data: data,
          ),
        );

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.data,
  });

  final _i15.Key? key;

  final _i16.BaseModel data;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i8.DashboardPage]
class DashboardRoute extends _i14.PageRouteInfo<void> {
  const DashboardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: 'dashboard-page',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i10.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i11.BrandPage]
class BrandRoute extends _i14.PageRouteInfo<void> {
  const BrandRoute()
      : super(
          BrandRoute.name,
          path: 'brand-page',
        );

  static const String name = 'BrandRoute';
}

/// generated route for
/// [_i12.CartPage]
class CartRoute extends _i14.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: 'cart-page',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i13.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}

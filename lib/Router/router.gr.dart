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
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;

import '../core/authflowpage.dart' as _i7;
import '../src/example_module/page/brand.page.dart' as _i13;
import '../src/example_module/page/brandDetails.page.dart' as _i6;
import '../src/example_module/page/cart.page.dart' as _i14;
import '../src/example_module/page/dashboard.page.dart' as _i10;
import '../src/example_module/page/details.page.dart' as _i9;
import '../src/example_module/page/forgotPass.page.dart' as _i2;
import '../src/example_module/page/getstarted.page.dart' as _i4;
import '../src/example_module/page/homePage.dart' as _i12;
import '../src/example_module/page/login.page.dart' as _i11;
import '../src/example_module/page/otp.page.dart' as _i3;
import '../src/example_module/page/profile.page.dart' as _i15;
import '../src/example_module/page/seeall.page.dart' as _i5;
import '../src/example_module/page/signup.page.dart' as _i1;
import '../src/example_module/page/wishlist.page.dart' as _i8;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    SignupRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SignupPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.OtpPage(),
      );
    },
    GetStartedRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.GetStartedPage(),
      );
    },
    SeeallRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SeeallPage(),
      );
    },
    BrandDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BrandDetailsRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.BrandDetailsPage(
          key: args.key,
          tittle: args.tittle,
        ),
      );
    },
    AuthFlowpage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AuthFlowpage(),
      );
    },
    WishlistRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.WishlistPage(),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.DetailsPage(
          key: args.key,
          label: args.label,
          brand: args.brand,
          discription: args.discription,
          price: args.price,
          imageUrl: args.imageUrl,
          seller: args.seller,
          size: args.size,
          offer: args.offer,
          shoe: args.shoe,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.DashboardPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.HomePage(),
      );
    },
    BrandRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.BrandPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.CartPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.ProfilePage(),
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          SignupRoute.name,
          path: '/signup-page',
        ),
        _i16.RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        ),
        _i16.RouteConfig(
          OtpRoute.name,
          path: '/otp-page',
        ),
        _i16.RouteConfig(
          GetStartedRoute.name,
          path: '/get-started-page',
        ),
        _i16.RouteConfig(
          SeeallRoute.name,
          path: '/seeall-page',
        ),
        _i16.RouteConfig(
          BrandDetailsRoute.name,
          path: '/brand-details-page',
        ),
        _i16.RouteConfig(
          AuthFlowpage.name,
          path: '/',
          children: [
            _i16.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard-page',
              parent: AuthFlowpage.name,
              children: [
                _i16.RouteConfig(
                  HomeRoute.name,
                  path: 'home-page',
                  parent: DashboardRoute.name,
                ),
                _i16.RouteConfig(
                  BrandRoute.name,
                  path: 'brand-page',
                  parent: DashboardRoute.name,
                ),
                _i16.RouteConfig(
                  CartRoute.name,
                  path: 'cart-page',
                  parent: DashboardRoute.name,
                ),
                _i16.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile-page',
                  parent: DashboardRoute.name,
                ),
              ],
            ),
            _i16.RouteConfig(
              LoginRoute.name,
              path: 'login-page',
              parent: AuthFlowpage.name,
            ),
          ],
        ),
        _i16.RouteConfig(
          WishlistRoute.name,
          path: '/wishlist-page',
        ),
        _i16.RouteConfig(
          DetailsRoute.name,
          path: '/details-page',
        ),
      ];
}

/// generated route for
/// [_i1.SignupPage]
class SignupRoute extends _i16.PageRouteInfo<void> {
  const SignupRoute()
      : super(
          SignupRoute.name,
          path: '/signup-page',
        );

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i16.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        );

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i3.OtpPage]
class OtpRoute extends _i16.PageRouteInfo<void> {
  const OtpRoute()
      : super(
          OtpRoute.name,
          path: '/otp-page',
        );

  static const String name = 'OtpRoute';
}

/// generated route for
/// [_i4.GetStartedPage]
class GetStartedRoute extends _i16.PageRouteInfo<void> {
  const GetStartedRoute()
      : super(
          GetStartedRoute.name,
          path: '/get-started-page',
        );

  static const String name = 'GetStartedRoute';
}

/// generated route for
/// [_i5.SeeallPage]
class SeeallRoute extends _i16.PageRouteInfo<void> {
  const SeeallRoute()
      : super(
          SeeallRoute.name,
          path: '/seeall-page',
        );

  static const String name = 'SeeallRoute';
}

/// generated route for
/// [_i6.BrandDetailsPage]
class BrandDetailsRoute extends _i16.PageRouteInfo<BrandDetailsRouteArgs> {
  BrandDetailsRoute({
    _i17.Key? key,
    required String tittle,
  }) : super(
          BrandDetailsRoute.name,
          path: '/brand-details-page',
          args: BrandDetailsRouteArgs(
            key: key,
            tittle: tittle,
          ),
        );

  static const String name = 'BrandDetailsRoute';
}

class BrandDetailsRouteArgs {
  const BrandDetailsRouteArgs({
    this.key,
    required this.tittle,
  });

  final _i17.Key? key;

  final String tittle;

  @override
  String toString() {
    return 'BrandDetailsRouteArgs{key: $key, tittle: $tittle}';
  }
}

/// generated route for
/// [_i7.AuthFlowpage]
class AuthFlowpage extends _i16.PageRouteInfo<void> {
  const AuthFlowpage({List<_i16.PageRouteInfo>? children})
      : super(
          AuthFlowpage.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AuthFlowpage';
}

/// generated route for
/// [_i8.WishlistPage]
class WishlistRoute extends _i16.PageRouteInfo<void> {
  const WishlistRoute()
      : super(
          WishlistRoute.name,
          path: '/wishlist-page',
        );

  static const String name = 'WishlistRoute';
}

/// generated route for
/// [_i9.DetailsPage]
class DetailsRoute extends _i16.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i17.Key? key,
    required String label,
    required String brand,
    required String discription,
    required String price,
    required String imageUrl,
    required String seller,
    required List<dynamic> size,
    required String offer,
    required Map<String, dynamic> shoe,
  }) : super(
          DetailsRoute.name,
          path: '/details-page',
          args: DetailsRouteArgs(
            key: key,
            label: label,
            brand: brand,
            discription: discription,
            price: price,
            imageUrl: imageUrl,
            seller: seller,
            size: size,
            offer: offer,
            shoe: shoe,
          ),
        );

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.label,
    required this.brand,
    required this.discription,
    required this.price,
    required this.imageUrl,
    required this.seller,
    required this.size,
    required this.offer,
    required this.shoe,
  });

  final _i17.Key? key;

  final String label;

  final String brand;

  final String discription;

  final String price;

  final String imageUrl;

  final String seller;

  final List<dynamic> size;

  final String offer;

  final Map<String, dynamic> shoe;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, label: $label, brand: $brand, discription: $discription, price: $price, imageUrl: $imageUrl, seller: $seller, size: $size, offer: $offer, shoe: $shoe}';
  }
}

/// generated route for
/// [_i10.DashboardPage]
class DashboardRoute extends _i16.PageRouteInfo<void> {
  const DashboardRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: 'dashboard-page',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i11.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i12.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i13.BrandPage]
class BrandRoute extends _i16.PageRouteInfo<void> {
  const BrandRoute()
      : super(
          BrandRoute.name,
          path: 'brand-page',
        );

  static const String name = 'BrandRoute';
}

/// generated route for
/// [_i14.CartPage]
class CartRoute extends _i16.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: 'cart-page',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i15.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}

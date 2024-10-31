// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:sneaker_app/core/authflowpage.dart';
import 'package:sneaker_app/src/example_module/page/brand.page.dart';
import 'package:sneaker_app/src/example_module/page/brandDetails.page.dart';
import 'package:sneaker_app/src/example_module/page/cart.page.dart';
import 'package:sneaker_app/src/example_module/page/dashboard.page.dart';
import 'package:sneaker_app/src/example_module/page/details.page.dart';
import 'package:sneaker_app/src/example_module/page/forgotPass.page.dart';
import 'package:sneaker_app/src/example_module/page/getstarted.page.dart';
import 'package:sneaker_app/src/example_module/page/homePage.dart';
import 'package:sneaker_app/src/example_module/page/login.page.dart';
import 'package:sneaker_app/src/example_module/page/ordersucessfull.dart';
import 'package:sneaker_app/src/example_module/page/otp.page.dart';
import 'package:sneaker_app/src/example_module/page/profile.page.dart';
import 'package:sneaker_app/src/example_module/page/seeall.page.dart';
import 'package:sneaker_app/src/example_module/page/signup.page.dart';
import 'package:sneaker_app/src/example_module/page/wishlist.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignupPage),
    AutoRoute(page: ForgotPasswordPage),
    AutoRoute(page: OtpPage),
    AutoRoute(page: GetStartedPage),
    AutoRoute(page: SeeallPage),
    AutoRoute(
      page: BrandDetailsPage,
    ),    // AutoRoute(page: AuthPage)

    AutoRoute(
      page: AuthFlowpage,
      initial: true,
      children: [
        AutoRoute(page: DashboardPage, children: [
          AutoRoute(page: HomePage),
          AutoRoute(page: BrandPage),
          AutoRoute(page: CartPage),
          AutoRoute(page: ProfilePage),
        ]),
        AutoRoute(page: LoginPage),
      ],
    ),
    AutoRoute(page: WishlistPage),
    AutoRoute(page: DetailsPage),
    AutoRoute(page: OrderSucssfull)
  ],
)
class $AppRouter {}

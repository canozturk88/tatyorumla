import 'package:flutter/material.dart';
import 'package:tadayim_bunu/core/models/home/product.dart';
import 'package:tadayim_bunu/ui/views/customer/change_mail_address_view.dart';
import 'package:tadayim_bunu/ui/views/customer/change_password_view.dart';
import 'package:tadayim_bunu/ui/views/customer/commentator_profile_wiew.dart';
import 'package:tadayim_bunu/ui/views/customer/customer_signup_view.dart';
import 'package:tadayim_bunu/ui/views/like/commend_like_view.dart';
import 'package:tadayim_bunu/ui/views/product/add_comment_view.dart';
import 'package:tadayim_bunu/ui/views/product/filter_page_view.dart';
import 'package:tadayim_bunu/ui/views/product/product_detail_view.dart';
import 'views/customer/customer_profile_view.dart';
import 'views/main_view.dart';
import 'views/splash/splash_view.dart';

import 'views/customer/customer_login_view.dart';

class RouterOld {
  static const String splashRoute = '/';
  static const String signInRoute = '/signIn';
  static const String mainRoute = '/main';
  static const String signupRoute = '/signUp';
  static const String customerProfileRoute = '/customerProfile';
  static const String myProfileInfoRoute = '/myProfileInfo';
  static const String changeMailAddressRoute = '/changeMailAddress';
  static const String changePasswordRoute = '/changePassword';
  static const String productDetailRoute = '/productDetail';
  static const String addCommentView = '/addComment';
  static const String commentatorProfileRoute = '/commentatorProfile';
  static const String filterPageView = '/filterPage';
  static const String likeDetailRoute = '/likeDetail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => MainPage());
      // case loginRoute:
      //   return MaterialPageRoute(builder: (_) => LoginView());
      case mainRoute:
        return MaterialPageRoute(builder: (_) => MainPage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => CustomerSignInView());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => CustomerSignUpView());

      case customerProfileRoute:
        return MaterialPageRoute(builder: (_) => CustomerProfileView());

      case changeMailAddressRoute:
        return MaterialPageRoute(builder: (_) => ChangeMailAddressView());

      case changePasswordRoute:
        return MaterialPageRoute(builder: (_) => ChangePasswordView());

      // case likeDetailRoute:
      //   return MaterialPageRoute(builder: (_) => CommetLikeView(settings.arguments as String));

      case productDetailRoute:
        return MaterialPageRoute(builder: (_) => ProductDetailView(settings.arguments.toString()));

      case addCommentView:
        return MaterialPageRoute(builder: (_) => AddCommentView(settings.arguments as Product));

      case commentatorProfileRoute:
        return MaterialPageRoute(builder: (_) => CommentatorProfileView(settings.arguments as String));

      case filterPageView:
        return MaterialPageRoute(builder: (_) => FilterPageView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

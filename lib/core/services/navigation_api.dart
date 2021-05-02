import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../enums/page_named.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final _removeAllOldRoutes = (Route<dynamic> route) => false;

  Future<dynamic> navigateTo(Pages routeType, [Object arguments = '', int extraVal]) async {
    return await navigatorKey.currentState.pushNamed(_named(routeType), arguments: arguments);
  }

  void pop() {
    if (isPop()) {
      return navigatorKey.currentState.pop();
    }
    return null;
  }

  bool isPop() {
    return navigatorKey.currentState.canPop();
  }

  Future<dynamic> navigateToRemove(Pages routeType, [Object arguments = '']) async {
    return await navigatorKey.currentState.pushNamedAndRemoveUntil(_named(routeType), _removeAllOldRoutes, arguments: arguments);
  }

  void fullScreenPopup() {
    // ignore: unnecessary_new
    navigatorKey.currentState.push(new MaterialPageRoute<Null>(builder: newMethod, fullscreenDialog: true));
  }

  Widget newMethod(BuildContext context) {
    return Container();
  }

  // ignore: always_declare_return_types
  analyticsLog(String screenName) async {
    //await CoreHelper.analyticsScreenLog(screen: screenName);
  }

  String _named(Pages page) {
    switch (page) {
      case Pages.Splash:
        return '/splash';

      case Pages.SignIn:
        return '/signIn';

      case Pages.SignUp:
        return '/signUp';

      case Pages.MyAccount:
        return '/customerProfile';

      case Pages.Onboarding:
        return '/onboarding';

      case Pages.Home:
        return '/main';

      case Pages.DoNotice:
        return '/doNotice';

      case Pages.ChangeMailAddress:
        return '/changeMailAddress';

      case Pages.ChangePassword:
        return '/changePassword';

      case Pages.ProductDetail:
        return '/productDetail';

      case Pages.News:
        return '/newsRoute';

      case Pages.MyProfile:
        return '/myProfileInfoRoute';

      case Pages.AddNewComment:
        return '/addComment';

      case Pages.CommentatorProfile:
        return '/commentatorProfile';

      case Pages.FilterPage:
        return '/filterPage';

      default:
        return '/';
    }
  }
}

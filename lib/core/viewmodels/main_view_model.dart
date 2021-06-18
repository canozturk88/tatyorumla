import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'package:tadayim_bunu/ui/views/customer/customer_login_view.dart';
import 'package:tadayim_bunu/ui/views/home/survey_view.dart';
import 'package:tadayim_bunu/ui/views/product/product_comment_view.dart';
import 'package:tadayim_bunu/ui/views/product/product_search_view.dart';
import '../../ui/views/home/home_view.dart';
import '../../ui/views/left_drawer_widget.dart';

final mainViewProvider = ChangeNotifierProvider((_) => MainViewModel());

class MainViewModel extends ChangeNotifier {
  int counter = 0;

  late BuildContext _context;

  BuildContext get context => _context;

  static GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey();

  ProductCommentView? productCommentView;
  ProductSearchPage? productSearchView;
  //WriteCommentView? writeCommentView;
  CustomerSignInView? customerLogin;
  SurveyPage? myApp;
  HomePage? homeView;
  // CreditView creditView;
  int currentIndex = 0;
  final LeftDrawerWidget leftDrawerWidget = LeftDrawerWidget();
  // NotificationListRequestModel notificationListRequestModel =
  //     new NotificationListRequestModel();

  List<Widget> bottomBarChildren = [ProductCommentView(), ProductCommentView(), SurveyPage(), SurveyPage(), SurveyPage()];

  void goToProductCommentList() {
    currentIndex = 1;
    notifyListeners();
  }

  void goToProductList() {
    currentIndex = 3;
    notifyListeners();
  }

  MainViewModel() {
    //leftDrawerWidget = LeftDrawerWidget();
    // _apiService = new ApiServices();
    // campaignRequestModel = new CampaignRequestModel();

    homeView = HomePage(
        // goToProductCommentList: goToProductCommentList,
        // goToProductList: goToProductList,
        );
  }

  static Future<void> openLeftMenu() async => mainScaffoldKey.currentState!.openDrawer();

  // @override
  // void setContext(BuildContext context) {
  //   _context = context;

  // }

}

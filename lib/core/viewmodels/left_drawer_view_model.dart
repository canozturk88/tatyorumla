import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadayim_bunu/core/models/user/customer_detail_response.dart';
import 'package:tadayim_bunu/core/services/navigation_api.dart';
import '../../locator.dart';
import '../enums/page_named.dart';
import '../enums/viewstate.dart';
import '../services/shared_prefernces_api.dart';
import 'base_model.dart';

final leftDrawerViewProvider = ChangeNotifierProvider((_) => LeftDrawerViewModel());

class LeftDrawerViewModel extends ChangeNotifier with WidgetsBindingObserver {
  late BuildContext _context;

  BuildContext get context => _context;

  CustomerResponse? customerDetail;

  VoidCallback? onChangeTokenStatusModel;
  VoidCallback? returnMain;
  VoidCallback? returnMainConverted;

  SharedManager sharedManager = SharedManager();

  LeftDrawerViewModel() {
    getCustomer();
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  Future getCustomer() async {
    if (sharedManager.token != null) {
      customerDetail = sharedManager.custmerDetail as CustomerResponse?;
      notifyListeners();
    }
  }

  NavigationService get navigator {
    return locator<NavigationService>();
  }

  // ignore: always_declare_return_types
  navigateLeftMenu(Pages _page) async {
    navigator.pop();
    final response = await navigator.navigateTo(_page);

    if (response == 'changeTokenStatus') {
      onChangeTokenStatusModel!();
    } else if (response == 'returnMain') {
      returnMain!();
    } else if (response == 'returnConvertedTlPoint') {
      returnMainConverted!();
    }
  }

  // ignore: always_declare_return_types
  logout() async {
    onChangeTokenStatusModel!();
    // sharedManager.removeNotifications();
    customerDetail = null;
    //setState(ViewState.Busy);
    sharedManager.logOut();

    // setState(ViewState.Idle);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tadayim_bunu/core/models/user/customer_detail_response.dart';
import '../enums/page_named.dart';
import '../enums/viewstate.dart';
import '../services/shared_prefernces_api.dart';
import 'base_model.dart';

class LeftDrawerViewModel extends BaseModel with WidgetsBindingObserver {
  BuildContext _context;

  BuildContext get context => _context;

  CustomerResponse customerDetail;

  VoidCallback onChangeTokenStatusModel;
  VoidCallback returnMain;
  VoidCallback returnMainConverted;

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
      customerDetail = sharedManager.custmerDetail;
      notifyListeners();
    }
  }

  // ignore: always_declare_return_types
  navigateLeftMenu(Pages _page) async {
    navigator.pop();
    final response = await navigator.navigateTo(_page);

    if (response == 'changeTokenStatus') {
      onChangeTokenStatusModel();
    } else if (response == 'returnMain') {
      returnMain();
    } else if (response == 'returnConvertedTlPoint') {
      returnMainConverted();
    }
  }

  // ignore: always_declare_return_types
  logout() async {
    onChangeTokenStatusModel();
    // sharedManager.removeNotifications();
    customerDetail = null;
    setState(ViewState.Busy);
    sharedManager.logOut();

    setState(ViewState.Idle);
    notifyListeners();
  }
}

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:tadayim_bunu/core/apis/account/account_api.dart';
import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/enums/viewstate.dart';
import 'package:tadayim_bunu/core/models/user/save_customer_command.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';

import 'base_model.dart';

class CustomerSignupViewModel extends BaseModel {
  final customerSignupScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: '_customerSignupScaffoldKey');

  late BuildContext _context;

  BuildContext get context => _context;

  CustomerSignupViewModel();

  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> saveCustomer(SaveCustomerCommand saveCustomerCommand) async {
    var isConncet = false;

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConncet = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isConncet = true;
    }
    if (isConncet) {
      await AccountApiServices.createUser(saveCustomerCommand).then((response) {
        if (response.statusCode == 201) {
          snackBarWarningMessage('Kayıdınız alındı. Lütfen mail adresinize gelen e-postayı onaylayınız');
          //
        }
        if (response.statusCode == 409) {
          snackBarWarningMessage('Aynı mail adresine ait kayıt vardır.');
        }
      });
    } else {
      snackBarWarningMessage('Lütfen internet bağlantınızı kontrol ediniz.');
    }
  }

  // ignore: always_declare_return_types
  snackBarWarningMessage(String _message) async {
    await UIHelper.showSnackBar(key: customerSignupScaffoldKey, child: Text(_message));
    setState(ViewState.Idle);
    await navigator.navigateToRemove(Pages.SignIn);
  }
}

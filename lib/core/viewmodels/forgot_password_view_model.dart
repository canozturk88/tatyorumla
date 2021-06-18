import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:tadayim_bunu/core/apis/account/account_api.dart';
import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/enums/viewstate.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';
import 'package:flutter/widgets.dart';

import 'base_model.dart';

class ForgotPasswordViewModel extends BaseModel {
  final forgotPasswordViewModel = GlobalKey<ScaffoldState>(debugLabel: '_forgotPasswordViewModel');

  late BuildContext _context;

  BuildContext get context => _context;

  // ignore: always_declare_return_types
  CustomerAddViewModel() {}

  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  // ignore: missing_return
  void goToRenewPassword(String mailAddres) async {
    var isConnect = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConnect = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isConnect = true;
    }

    if (isConnect) {
      await AccountApiServices.forgotPassword(mailAddres).then((response) {
        setState(ViewState.Busy);
        if (response.statusCode == 200) {
          snackBarWarningMessage('Kayıtlı mail adresinize e-posta gönderilmiştşir.');
        } else {
          snackBarWarningMessage('E-posta adresine ait kullanıcı bulunamadı.');
        }
      });
    } else {
      snackBarWarningMessage('Lütfen internet bağlantınızı kontrol ediniz.');
    }
  }

  // ignore: always_declare_return_types
  snackBarWarningMessage(String? _message) async {
    await UIHelper.showSnackBar(key: forgotPasswordViewModel, child: Text(_message ?? ''));
    setState(ViewState.Idle);
    await navigator.navigateToRemove(Pages.SignIn);
  }
}

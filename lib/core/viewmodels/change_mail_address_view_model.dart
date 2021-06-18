import 'package:connectivity/connectivity.dart';
import 'package:tadayim_bunu/core/apis/account/account_api.dart';
import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/enums/viewstate.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base_model.dart';

// E-posta adresini değiştirmek için kullan model
class ChangeMailAddressViewModel extends BaseModel {
  final changeMailAddressScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: '_changeMailAddressScaffoldKey');

  late BuildContext _context;

  BuildContext get context => _context;

  // ignore: empty_constructor_bodies
  ChangeMailAddressViewModel() {}

  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> saveNewEmail(String password, String email) async {
    var isConnect = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConnect = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isConnect = true;
    }

    if (isConnect) {
      await AccountApiServices.changeMailAddress(SharedManager().custmerDetail!.id!, password, email).then((response) {
        setState(ViewState.Busy);
        if (response.statusCode == 204) {
          var newCustomerDetail = SharedManager().custmerDetail;
          newCustomerDetail!.mailAddress = email;
          SharedManager().setCustmerDetail = newCustomerDetail;
          snackBarWarningMessage('E-Posta Adresi Değiştirilmiştir.');
          Future.delayed(Duration(milliseconds: 2000), () {
            navigator.navigateToRemove(Pages.MyAccount);
          });
        } else {
          snackBarWarningMessage('Mevcut şifre yanlıştır.');
        }
      });
    } else {
      snackBarWarningMessage('Lütfen internet bağlantınızı kontrol ediniz.');
    }
  }

  // ignore: always_declare_return_types
  snackBarWarningMessage(String _message) {
    UIHelper.showSnackBar(key: changeMailAddressScaffoldKey, child: Text(_message));
    setState(ViewState.Idle);
  }
}

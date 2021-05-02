import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tadayim_bunu/core/apis/account/account_api.dart';
import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/enums/viewstate.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';

import 'base_model.dart';

//Kullanıcının şifresini değiştirmesi için kullanılan model
class ChangePasswordViewModel extends BaseModel {
  BuildContext get context => _context;
  final changePasswordScaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext _context;

  ChangePasswordViewModel();

  @override
  void setContext(BuildContext context) async {
    _context = context;
    notifyListeners();
  }

  // ignore: missing_return
  void saveNewPassword(String oldPassword, String newPassword) {
    AccountApiServices.changePassword(SharedManager().custmerDetail.id, oldPassword, newPassword).then((response) {
      setState(ViewState.Busy);
      if (response.statusCode == 204) {
        // Map userMap = jsonDecode(response.body);
        //var userLogin = User.fromJson(userMap);
        //userLogin.userToken = SharedManager().jwtToken;
        // userLogin.noticies = SharedManager().custmerDetail.noticies;
        //SharedManager().custmerDetail = userLogin;
        snackBarWarningMessage('Şifre Değiştirilmiştir.');
        Future.delayed(Duration(milliseconds: 2000), () {
          navigator.navigateToRemove(Pages.MyAccount);
        });
      } else {
        snackBarWarningMessage('Mevcut şifre yanlıştır.');
      }
    });
  }

  // ignore: always_declare_return_types
  snackBarWarningMessage(String _message) {
    UIHelper.showSnackBar(key: changePasswordScaffoldKey, child: Text(_message ?? ''));
    setState(ViewState.Idle);
  }
}

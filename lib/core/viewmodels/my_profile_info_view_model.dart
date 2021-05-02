import 'package:connectivity/connectivity.dart';

import 'package:tadayim_bunu/core/enums/viewstate.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';

import 'base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyProfileInfoViewModel extends BaseModel {
  final myProfileInfoViewModel = GlobalKey<ScaffoldState>(debugLabel: '_myProfileInfoViewModel');

  BuildContext _context;

  BuildContext get context => _context;

  // ignore: empty_constructor_bodies
  MyProfileInfoViewModel() {}

  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  // ignore: missing_return
  void updateProfilInfo(String nameSurname) async {
    var isConnect = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConnect = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isConnect = true;
    }
    if (isConnect) {
      var updateuser = SharedManager().custmerDetail;
      updateuser.nameSurname = nameSurname;
      setState(ViewState.Busy);
      // await AccountApiServices.updateUser(updateuser).then((response) {
      //   if (response.statusCode == 204) {
      //     Map userMap = jsonDecode(response.body);
      //     var userLogin = Custum.fromJson(userMap);
      //     userLogin.userToken = SharedManager().jwtToken;
      //     //userLogin.noticies = SharedManager().custmerDetail.noticies;
      //     SharedManager().custmerDetail = userLogin;
      //     snackBarWarningMessage('Bilgileriniz Güncellenmiştir');
      //     Future.delayed(Duration(milliseconds: 2000), () {
      //       navigator.navigateToRemove(Pages.MyAccount);
      //     });
      //   } else {
      //     snackBarWarningMessage('Güncelleme yaparken sorun yaşandı');
      //   }
      // });
    } else {
      snackBarWarningMessage('Lütfen internet bağlantınızı kontrol ediniz.');
    }
  }

  // ignore: always_declare_return_types
  snackBarWarningMessage(String _message) {
    UIHelper.showSnackBar(key: myProfileInfoViewModel, child: Text(_message ?? ''));
    setState(ViewState.Idle);
  }
}

import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:tadayim_bunu/core/apis/account/account_api.dart';
import 'package:tadayim_bunu/core/apis/productComment/product_comment_api.dart';
import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/models/user/customer_detail_response.dart';
import 'package:tadayim_bunu/core/models/user/save_customer_command.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';
import '../enums/viewstate.dart';
import 'base_model.dart';

class CustomerSignInViewModel extends BaseModel {
  final customerSignInScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: '_customerSignInScaffoldKey');

  BuildContext _context;

  BuildContext get context => _context;

  CustomerSignInViewModel();
  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> saveCustomer(SaveCustomerCommand saveCustomerCommand) async {
    setState(ViewState.Idle);
    if (state == ViewState.Busy) {
      return;
    } else {
      var isConncet = false;

      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        isConncet = true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        isConncet = true;
      }
      if (isConncet) {
        setState(ViewState.Busy);
        await AccountApiServices.loginCustomer(saveCustomerCommand.mailAddress, saveCustomerCommand.password).then((response) {
          if (response.statusCode == 200) {
            Map userMap = jsonDecode(response.body);
            var userLogin = CustomerResponse.fromJson(userMap);
            SharedManager().custmerDetail = userLogin;
            setState(ViewState.Idle);
            navigator.navigateToRemove(Pages.Home);

            ProductCommentApiServices.getCustomerProductCommentByCustomerId(userLogin.id.toString()).then((response) {
              // if (response.statusCode == 200) {
              //   Map<String, dynamic> map = jsonDecode(response.body);
              //   var responseNotice = ResponseNotice.fromJson(map);
              //   SharedManager().token = userLogin.id;
              //   userLogin.productComments = new List<ProductComment>();
              //   userLogin.productComments = responseNotice.notices;
              //   SharedManager().custmerDetail = userLogin;
              //   setState(ViewState.Idle);
              //   navigator.navigateToRemove(Pages.Home);
              // } else {
              //   setState(ViewState.Idle);
              //   SharedManager().token = userLogin.id;
              //   SharedManager().custmerDetail = userLogin;
              // }
              //  });
            });
          } else {
            snackBarWarningMessage('Yanlış E-posta yada Şifre');
          }
          //   });
        });
      } else {
        snackBarWarningMessage('Lütfen internet bağlantınızı kontrol ediniz.');
      }
    }
  }

  // ignore: always_declare_return_types
  snackBarWarningMessage(String _message) async {
    setState(ViewState.Idle);
    await UIHelper.showSnackBar(key: customerSignInScaffoldKey, child: Text(_message ?? ''));
  }
}

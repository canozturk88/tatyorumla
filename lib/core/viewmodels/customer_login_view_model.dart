import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import '../enums/viewstate.dart';
import '../models/user/customer.dart';
import 'base_model.dart';

class CustomerLoginViewModel extends BaseModel {
  final noticeScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: '_customerLoginScaffoldKey');

  BuildContext _context;

  BuildContext get context => _context;

  CustomerLoginViewModel() {
    // bannerPageController = new PageController();
    // pricesPageController = new PageController();
    // customerNotice = new List<Notice>();
    // _homeRequestModel = new HomeRequestModel();
    // newLocationManager = LocationManager();

    // apiService = new ApiServices();
  }
  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> saveCustomer(Customer customer) async {
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
//         if (customer.mailAddress.contains("bildireyimbunu.com")) {
//           CorporationApiServices.loginUser(customer.mailAddress, customer.password)
//               .then((response) {
//             // setState(() {
//             if (response.statusCode == 200) {
//               Map userMap = jsonDecode(response.body);
//               var loginRequestMunicipalityAccountLogin =
//                   Corporation.fromJson(userMap);
//               // userStatus = 1;
//               // loginId = loginRequestMunicipalityAccountLogin.id;

//               SharedManager().token = loginRequestMunicipalityAccountLogin.id;

//               // SharedManager().loginRequestCorporation =
//               //     loginRequestMunicipalityAccountLogin;

//               NoticeApiServices.instance
//                   .getMyCorporationNotice(
//                       loginRequestMunicipalityAccountLogin.corporationName, 0)
//                   .then((response) {
//                 // setState(() {
//                 if (response.statusCode == 200) {
//                   Map<String, dynamic> map = jsonDecode(response.body);
//                   var responseNotice = ResponseNotice.fromJson(map);

//                   loginRequestMunicipalityAccountLogin.noticies =
//                       new List<Notice>();
//                   loginRequestMunicipalityAccountLogin.noticies =
//                       responseNotice.notices;

//                   SharedManager().loginRequestCorporation =
//                       loginRequestMunicipalityAccountLogin;
//                 } else {
//                   SharedManager().loginRequestCorporation =
//                       loginRequestMunicipalityAccountLogin;
//                 }
//                 // });
//               });

//               setState(ViewState.Idle);
//               navigator.navigateToRemove(Pages.Home);
//             } else {
//               _showDialog("Yanlış E-posta yada Şifre");
//             }
//             //  });
//           });
// // belediye

//         } else {

        setState(ViewState.Busy);
        // AccountApiServices.loginUser(customer.mailAddress, customer.password)
        //     .then((response) {
        //   //  setState(() {
        //   if (response.statusCode == 200) {
        //     Map userMap = jsonDecode(response.body);
        //     var userLogin = Customer.fromJson(userMap);

        //     // NoticeApiServices.instance
        //     //     .getmyNotice(userLogin.id)
        //     //     .then((response) {
        //     //   // setState(() {
        //     //   if (response.statusCode == 200) {
        //     //     Map<String, dynamic> map = jsonDecode(response.body);
        //     //     var responseNotice = ResponseNotice.fromJson(map);
        //     //     SharedManager().token = userLogin.id;
        //     //     userLogin.productComments = new List<ProductComment>();
        //     //     userLogin.productComments = responseNotice.notices;
        //     //     SharedManager().custmerDetail = userLogin;
        //     //     setState(ViewState.Idle);
        //     //     navigator.navigateToRemove(Pages.Home);
        //     //   } else {
        //     //     setState(ViewState.Idle);
        //     //     SharedManager().token = userLogin.id;
        //     //     SharedManager().custmerDetail = userLogin;
        //     //   }
        //     //   //  });
        //     // });

        //     //);
        //   } else {
        //     setState(ViewState.Idle);
        //     _showDialog("Yanlış E-posta yada Şifre");
        //   }
        //   //   });
        // });
        // }
      } else {
        // setState(ViewState.Idle);
        _showDialog('Lütfen internet bağlantınızı kontrol ediniz.');
      }
    }
  }

  void _showDialog(String contextText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bildiri'),
          content: Text(contextText),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

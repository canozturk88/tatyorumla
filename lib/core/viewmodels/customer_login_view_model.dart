import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadayim_bunu/core/apis/account/account_api.dart';
import 'package:tadayim_bunu/core/apis/productComment/product_comment_api.dart';
import 'package:tadayim_bunu/core/models/user/customer_detail_response.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'package:tadayim_bunu/services/api.dart';
import 'package:tadayim_bunu/services/converters.dart';
import 'package:tadayim_bunu/services/error_converter.dart';
import 'package:tadayim_bunu/services/request_interceptor.dart';

// final chopperClientProvider = Provider<ChopperClient>((_) {
//   final headers = {"Bearer": "Bearer"};
//   final factories = {
//     CustomerResponse: (json) => CustomerResponse.fromJson(json),
//     //  CustomerResponse: (json) => CustomerResponse.fromJson(json),
//   };

//   return ChopperClient(
//       services: [
//         JsonPlaceHolderService.create()
//       ],
//       interceptors: [
// // before request
//         MyRequestInterceptor(),

// // headers
//         HeadersInterceptor(headers),

// // default chopper logging
//         HttpLoggingInterceptor(),
//       ],

// // error converter
//       errorConverter: MyErrorConverter(),

// // json converter factories
//       converter: Converters(factories));
// });

final customerSignInViewProvider = StateNotifierProvider<CustomerSignInViewModel, AuthState>((_) => CustomerSignInViewModel());

enum AuthState { anon, auth, none }
late final Reader _reader;

class CustomerSignInViewModel extends StateNotifier<AuthState> {
  CustomerSignInViewModel() : super(AuthState.none);

  //final customerSignInViewProvider = StateNotifierProvider<CustomerSignInViewModel, AuthState>((_) => CustomerSignInViewModel());

  //  static final provider = StateNotifierProvider<CustomerSignInViewModel, AsyncValue<AuthState>>((ref) => CustomerSignInViewModel(ref.read));

  Future<void> loginCustomer(String email, String password) async {
    //state = AsyncValue.loading() as AuthState;

    // final chopper = _reader(chopperClientProvider).getService<JsonPlaceHolderService>();
    // final response = await chopper.loginCustomer(email, password);
    // if (response.isSuccessful) {
    //   // return response.body;
    // } else {
    //   // return response.error;
    // }
  }

  // state = (await AsyncValue.guard(() async {

  // )) as AuthState;
  //}

  void login() {
    state = AuthState.auth;
  }

  void logout() {
    state = AuthState.anon;
  }
}




// final customerSignInViewProvider = ChangeNotifierProvider((_) => CustomerSignInViewModel());





// class CustomerSignInViewModel extends ChangeNotifier {








//   Future<void> loginCustomer(String email, String password) async {
//     // setState(ViewState.Idle);
//     // if (state == ViewState.Busy) {
//     //   return;
//     // } else {

//     // var isConncet = false;

//     // var connectivityResult = await (Connectivity().checkConnectivity());
//     // if (connectivityResult == ConnectivityResult.mobile) {
//     //   isConncet = true;
//     // } else if (connectivityResult == ConnectivityResult.wifi) {
//     //   isConncet = true;
//     // }
//     // if (isConncet) {
//     //   //setState(ViewState.Busy);
//     await AccountApiServices.loginCustomer(email, password).then((response) {
//       if (response.statusCode == 200) {
//         Map userMap = jsonDecode(response.body);
//         var userLogin = CustomerResponse.fromJson(userMap);
//         SharedManager().setCustmerDetail = userLogin;
//         //  setState(ViewState.Idle);
//         // navigator.navigateToRemove(Pages.Home);

//         ProductCommentApiServices.getCustomerProductCommentByCustomerId(userLogin.id.toString()).then((response) {
//           // if (response.statusCode == 200) {
//           //   Map<String, dynamic> map = jsonDecode(response.body);
//           //   var responseNotice = ResponseNotice.fromJson(map);
//           //   SharedManager().token = userLogin.id;
//           //   userLogin.productComments = new List<ProductComment>();
//           //   userLogin.productComments = responseNotice.notices;
//           //   SharedManager().custmerDetail = userLogin;
//           //   setState(ViewState.Idle);
//           //   navigator.navigateToRemove(Pages.Home);
//           // } else {
//           //   setState(ViewState.Idle);
//           //   SharedManager().token = userLogin.id;
//           //   SharedManager().custmerDetail = userLogin;
//           // }
//           //  });
//           notifyListeners();
//         });
//       } else {
//         notifyListeners();
//         // snackBarWarningMessage(globalKey, 'Yanlış E-posta yada Şifre');
//       }
//       //   });
//     });

//     // } else {
//     //   // snackBarWarningMessage(globalKey, 'Lütfen internet bağlantınızı kontrol ediniz.');
//     // }
//     //}
//   }

//   // ignore: always_declare_return_types
//   // snackBarWarningMessage(GlobalKey<ScaffoldState> globalKey, String _message) async {
//   //   // setState(ViewState.Idle);
//   //   await UIHelper.showSnackBar(key: globalKey, child: Text(_message));
//   // }
// }

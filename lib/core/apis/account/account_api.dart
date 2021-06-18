import 'package:tadayim_bunu/core/models/user/save_customer_command.dart';
import 'package:tadayim_bunu/core/viewmodels/customer_signup_view_model.dart';

import '../../../main.dart';

import 'package:http/http.dart' as http;

class AccountApiServices {
  static Future<http.Response> createUser(SaveCustomerCommand customerLoginViewModel) async {
    var url = Uri.https(baseUrl, '/Customer/CreateCustomer');

    var headers = <String, String>{'Content-Type': 'application/json'};
    final response = await http.post(url, headers: headers, body: postToJsonUser(customerLoginViewModel));
    return response;
  }

  // static Future<http.Response> sendMail(Customer customer) async {
  //   final response = await http.post(baseUrl + 'user', headers: CoreHelper.getHeaderWithJwtToken(), body: postToJsonUser(user));
  //   return response;
  // }

  static Future<http.Response> loginCustomer(String mailAddress, String password) async {
    var url = Uri.https(baseUrl, '/Customer/GetCustomerLogin/$mailAddress/$password');
    final response = await http.get(
      url,
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> getCustomerById(String id) async {
    var url = Uri.https(baseUrl, '/Customer/GetCustomer/$id');
    final response = await http.get(url
        // headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> changePassword(int id, String oldPassword, String newPassword) async {
    var url = Uri.https(baseUrl, '/Customer/ChangePassword/$id/$oldPassword/$newPassword');
    final response = await http.put(url
        // headers: CoreHelper.getHeaderWithJwtToken(),
        );
    return response;
  }

  static Future<http.Response> changeMailAddress(int id, String password, String newEmail) async {
    var url = Uri.https(baseUrl, '/Customer/ChangeEmail/$id/$password/$newEmail');
    final response = await http.put(
      url,
      // headers: CoreHelper.getHeaderWithJwtToken(),
    );
    return response;
  }

  static Future<http.Response> updateUser(CustomerSignupViewModel userIn) async {
    var url = Uri.https(baseUrl, '/user');
    final response = await http.put(url
        //headers: CoreHelper.getHeaderWithJwtToken(),
        // body: postToJsonUser(userIn)
        );
    return response;
  }

  static Future<http.Response> successUser(int id) async {
    var url = Uri.https(baseUrl, '/Customer/UpdateUserSuccess/$id');
    final response = await http.put(url
        // headers: CoreHelper.getHeaderWithJwtToken()
        );
    return response;
  }

  static Future<http.Response> renewPassword(int id, String newPassword) async {
    var url = Uri.https(baseUrl, '/Customer/RenewPassword/$id/$newPassword');
    final response = await http.put(url
        //headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> forgotPassword(String email) async {
    var url = Uri.https(baseUrl, '/Customer/ForgotPassword/$email');
    final response = await http.get(url
        // headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }
}

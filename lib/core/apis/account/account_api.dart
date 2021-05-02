import 'package:tadayim_bunu/core/models/user/save_customer_command.dart';
import 'package:tadayim_bunu/core/viewmodels/customer_signup_view_model.dart';

import '../../../main.dart';

import 'package:http/http.dart' as http;

class AccountApiServices {
  static Future<http.Response> createUser(SaveCustomerCommand customerLoginViewModel) async {
    var headers = <String, String>{'Content-Type': 'application/json'};
    final response = await http.post(baseUrl + 'Customer/CreateCustomer', headers: headers, body: postToJsonUser(customerLoginViewModel));
    return response;
  }

  // static Future<http.Response> sendMail(Customer customer) async {
  //   final response = await http.post(baseUrl + 'user', headers: CoreHelper.getHeaderWithJwtToken(), body: postToJsonUser(user));
  //   return response;
  // }

  static Future<http.Response> loginCustomer(String mailAddress, String password) async {
    final response = await http.get(
      baseUrl + 'Customer/GetCustomerLogin/$mailAddress/$password',
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> getCustomerById(String id) async {
    final response = await http.get(
      baseUrl + 'Customer/GetCustomer/$id',
      // headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> changePassword(int id, String oldPassword, String newPassword) async {
    final response = await http.put(
      baseUrl + 'Customer/ChangePassword/$id/$oldPassword/$newPassword',
      // headers: CoreHelper.getHeaderWithJwtToken(),
    );
    return response;
  }

  static Future<http.Response> changeMailAddress(int id, String password, String newEmail) async {
    final response = await http.put(
      baseUrl + 'Customer/ChangeEmail/$id/$password/$newEmail',
      // headers: CoreHelper.getHeaderWithJwtToken(),
    );
    return response;
  }

  static Future<http.Response> updateUser(CustomerSignupViewModel userIn) async {
    final response = await http.put(
      baseUrl + 'user',
      //headers: CoreHelper.getHeaderWithJwtToken(),
      //  body: postToJsonUser(userIn)
    );
    return response;
  }

  static Future<http.Response> successUser(int id) async {
    final response = await http.put(
      baseUrl + 'Customer/UpdateUserSuccess/$id',
      // headers: CoreHelper.getHeaderWithJwtToken()
    );
    return response;
  }

  static Future<http.Response> renewPassword(int id, String newPassword) async {
    final response = await http.put(
      baseUrl + 'Customer/RenewPassword/$id/$newPassword',
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> forgotPassword(String email) async {
    final response = await http.get(
      baseUrl + 'Customer/ForgotPassword/$email',
      // headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }
}

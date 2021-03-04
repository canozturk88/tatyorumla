import 'package:http/http.dart' as http;

import '../../../main.dart';
import '../../models/user/customer.dart';
import '../../services/shared_prefernces_api.dart';

//String get base_url => Platform.environment['DEV_URL'].toString();
//String get baseUrl => "https://api.bildireyimbunu.com/";
//String get baseUrl => "http://192.168.1.60/BilireyimBunu.WebApi/";

class AccountApiServices {
// final String base_url = Platform.environment['DEV_URL'];

  //String urls= 'http://192.168.1.10/BilireyimBunu.WebApi/';

  static Future<http.Response> createUser(Customer customer) async {
    var headers = <String, String>{'Content-Type': 'application/json', 'Authorization': 'Bearer  ' + SharedManager().jwtToken};

    final response = await http.post(baseUrl + 'user', headers: headers, body: postToJsonUser(customer));
    return response;
  }

  static Future<http.Response> sendMail(Customer customer) async {
    var headers = <String, String>{'Content-Type': 'application/json', 'Authorization': 'Bearer  ' + SharedManager().jwtToken};

    final response = await http.post(baseUrl + 'user', headers: headers, body: postToJsonUser(customer));
    return response;
  }

  static Future<http.Response> loginUser(String email, String password) async {
    var headers = <String, String>{'Content-Type': 'application/json', 'Authorization': 'Bearer  ' + SharedManager().jwtToken};
    final response = await http.get(
      baseUrl + 'user/GetUserLogin/$email/$password',
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> changePassword(String userId, String oldPassword, String newPassword) async {
    var headers = <String, String>{'Content-Type': 'application/json', 'Authorization': 'Bearer  ' + SharedManager().jwtToken};
    final response = await http.get(
      baseUrl + 'user/changePassword/$userId/$oldPassword/$newPassword',
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> updateUser(Customer userIn) async {
    var headers = <String, String>{'Content-Type': 'application/json', 'Authorization': 'Bearer  ' + SharedManager().jwtToken};
    final response = await http.put(baseUrl + 'user', headers: headers, body: postToJsonUser(userIn));
    return response;
  }

  static Future<http.Response> successUser(String id) async {
    var headers = <String, String>{'Content-Type': 'application/json', 'Authorization': 'Bearer  ' + SharedManager().jwtToken};
    final response = await http.put(baseUrl + 'User/UpdateUserSuccess/' + id, headers: headers);
    return response;
  }

  static Future<http.Response> renewPassword(String userId, String newPassword) async {
    var headers = <String, String>{'Content-Type': 'application/json', 'Authorization': 'Bearer  ' + SharedManager().jwtToken};
    final response = await http.get(
      baseUrl + 'user/renewPassword/$userId/$newPassword',
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> forgotPassword(String email) async {
    var headers = <String, String>{'Content-Type': 'application/json', 'Authorization': 'Bearer  ' + SharedManager().jwtToken};
    final response = await http.get(
      baseUrl + 'user/forgotPassword/$email',
      headers: headers,
    );
    return response;
  }
}

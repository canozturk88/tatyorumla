import 'package:tadayim_bunu/core/models/comment/product_comment_command.dart';

import '../../../main.dart';

import 'package:http/http.dart' as http;

class ProductCommentApiServices {
  static Future<http.Response> getCustomerProductCommentByCustomerId(String customerId) async {
    final response = await http.get(
      baseUrl + 'ProductComment/GetProductCommentsByUserIds/$customerId',
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> getProductCommentsByProductName(String productName) async {
    final response = await http.get(
      baseUrl + 'ProductComment/GetProductCommentsByProductName/$productName',
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> getLastTenProductComments() async {
    final response = await http.get(
      baseUrl + 'ProductComment/GetLastTenProductComments',
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> saveProductComment(ProductCommentCommand productCommentCommand) async {
    var headers = <String, String>{'Content-Type': 'application/json'};
    final response = await http.post(baseUrl + 'ProductComment/CreateProductComment',
        headers: headers, body: postToJsonProductCommentCommand(productCommentCommand));
    return response;
  }
}

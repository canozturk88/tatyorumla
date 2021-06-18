import 'package:tadayim_bunu/core/models/comment/product_comment_command.dart';
import '../../../main.dart';
import 'package:http/http.dart' as http;

class ProductCommentApiServices {
  static Future<http.Response> getCustomerProductCommentByCustomerId(String customerId) async {
    var url = Uri.http(baseUrl, '/ProductComment/GetProductCommentsByUserIds/$customerId');
    final response = await http.get(url
        //headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> getProductCommentsByProductName(String productName) async {
    var url = Uri.http(baseUrl, '/ProductComment/GetProductCommentsByProductName/$productName');

    final response = await http.get(url
        //headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> getLastTenProductComments() async {
    var url = Uri.http(baseUrl, '/ProductComment/GetLastTenProductComments');
    final response = await http.get(url
        //  headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> likeComment(String productCommentId, String likedCustomerId) async {
    var url = Uri.http(baseUrl, '/ProductComment/LikeProductComment/$productCommentId/$likedCustomerId');
    final response = await http.put(url
        //  headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> UnLikeComment(String productCommentId, String likedCustomerId) async {
    var url = Uri.http(baseUrl, '/ProductComment/UnlikeProductComment/$productCommentId/$likedCustomerId');
    final response = await http.put(url
        //  headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> saveProductComment(ProductCommentCommand productCommentCommand) async {
    var url = Uri.http(baseUrl, '/ProductComment/CreateProductComment');
    var headers = <String, String>{'Content-Type': 'application/json'};
    final response = await http.post(url, headers: headers, body: postToJsonProductCommentCommand(productCommentCommand));
    return response;
  }
}

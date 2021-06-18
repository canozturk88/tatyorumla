import '../../../main.dart';
import 'package:http/http.dart' as http;

class LikeApiServices {
  static Future<http.Response> getProductCommentLikes(String productCommentId) async {
    var url = Uri.http(baseUrl, '/Like/GetProductCommentLikes/$productCommentId');
    final response = await http.get(url
        //headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }
}

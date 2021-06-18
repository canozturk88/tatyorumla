import '../../../main.dart';

import 'package:http/http.dart' as http;

class CatalogApiServices {
  static Future<http.Response> getAllMainCategory() async {
    var url = Uri.http(baseUrl, '/MainCategory/GetMainCategories');
    final response = await http.get(url
        //headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> getAllSubCategory() async {
    var url = Uri.http(baseUrl, '/SubCategory/GetSubCategories');
    final response = await http.get(url
        //headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> getAllBrands() async {
    var url = Uri.http(baseUrl, '/Brand/GetBrands');
    final response = await http.get(url
        //headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> getAllProducts() async {
    var url = Uri.http(baseUrl, '/Product/GetProducts');
    final response = await http.get(url

        //headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }

  static Future<http.Response> getProductByName(String productName) async {
    var url = Uri.http(baseUrl, '/Product/GetProductByName/' + productName);
    final response = await http.get(url
        //headers: CoreHelper.getHeaderWithNotUserToken(),
        );
    return response;
  }
}

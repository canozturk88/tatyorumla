import '../../../main.dart';

import 'package:http/http.dart' as http;

class CatalogApiServices {
  static Future<http.Response> getAllMainCategory() async {
    final response = await http.get(
      baseUrl + 'MainCategory/GetMainCategories',
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> getAllSubCategory() async {
    final response = await http.get(
      baseUrl + 'SubCategory/GetSubCategories',
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> getAllBrands() async {
    final response = await http.get(
      baseUrl + 'Brand/GetBrands',
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> getAllProducts() async {
    final response = await http.get(
      baseUrl + 'Product/GetProducts',
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }

  static Future<http.Response> getProductByName(String productName) async {
    final response = await http.get(
      baseUrl + 'Product/GetProductByName/' + productName,
      //headers: CoreHelper.getHeaderWithNotUserToken(),
    );
    return response;
  }
}

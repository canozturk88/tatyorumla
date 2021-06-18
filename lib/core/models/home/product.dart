class ProductResponseModel {
  int? responseCode;
  String? responseDescription;
  List<Product>? products;

  ProductResponseModel({this.responseCode, this.responseDescription, this.products});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    if (json['Products'] != null) {
      products = <Product>[];
      json['Products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ResponseCode'] = responseCode;
    data['ResponseDescription'] = responseDescription;
    if (products != null) {
      data['Products'] = products!.map((v) => v.toJson(v)).toList();
    }
    return data;
  }

  ProductResponseModel fromJson(Map<String, dynamic> json) {
    return ProductResponseModel.fromJson(json);
  }
}

class Product {
  String? id;
  String? brand;
  String? productName;
  String? detail;
  String? bannerImageUrl;
  String? pricePerformance;
  String? tastePoint;
  String? pricePoint;
  String? packinPoint;
  String? accessPoint;
  int? commentCount;

  Product({this.id, this.productName, this.bannerImageUrl, this.accessPoint});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    productName = json['ProductName'];
    pricePerformance = json['PricePerformance'].toString();
    tastePoint = json['TastePoint'].toString();
    pricePoint = json['PricePoint'].toString();
    packinPoint = json['PackinPoint'].toString();
    accessPoint = json['AccessPoint'].toString();
    commentCount = json['CommentCount'];
    bannerImageUrl = json['ImageUrl'];
    brand = json['Brand'];
  }

  Map<String, dynamic> toJson(Product product) {
    final data = <String, dynamic>{};
    data['Id'] = product.id;
    data['ProductName'] = product.productName;
    data['PricePerformance'] = product.pricePerformance;
    data['TastePoint'] = product.tastePoint;
    data['PricePoint'] = product.pricePoint;
    data['PackinPoint'] = product.packinPoint;
    data['AccessPoint'] = product.accessPoint;
    data['CommentCount'] = product.commentCount;
    data['ImageUrl'] = product.bannerImageUrl;
    data['Brand'] = product.brand;
    return data;
  }

  Product fromJson(Map<String, dynamic> json) {
    return Product.fromJson(json);
  }
}

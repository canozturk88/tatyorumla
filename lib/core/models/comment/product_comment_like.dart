import 'dart:convert';

String postToJsonProductCommentLike(ProductCommentLike data) {
  final dyn = data.toJson(data);
  return json.encode(dyn);
}

class ProductCommentLike {
  String? id;
  String? productCommentId;
  String? likedCustomerId;
  String? customerName;
  String? customerNick;
  String? customerImage;

  ProductCommentLike({
    this.id,
    this.productCommentId,
  });

  ProductCommentLike.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productCommentId = json['productCommentId'];
    likedCustomerId = json['likedCustomerId'];
    customerName = json['customerName'];
    customerNick = json['customerNick'];
    customerImage = json['customerImage'];
  }

  Map<String, dynamic> toJson(ProductCommentLike productCommentLike) {
    final data = <String, dynamic>{};
    // data['id'] = productCommentCommand.id;
    data['productCommentId'] = productCommentLike.productCommentId;
    data['likedCustomerId'] = productCommentLike.likedCustomerId;
    data['customerName'] = productCommentLike.customerName;
    data['customerNick'] = productCommentLike.customerNick;
    data['customerImage'] = productCommentLike.customerImage;
    return data;
  }

  ProductCommentLike fromJson(Map<String, dynamic> json) {
    return ProductCommentLike.fromJson(json);
  }
}

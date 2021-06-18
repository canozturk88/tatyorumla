import 'dart:convert';

String postToJsonProductCommentCommand(ProductCommentCommand data) {
  final dyn = data.toJson(data);
  return json.encode(dyn);
}

class ProductCommentCommand {
  String? id;
  String? productId;
  String? title;
  String? productName;
  String? comment;
  int? tastePoint;
  // Product product;
  int? pricePerformance;
  int? pricePoint;
  int? packingPoint;
  int? accessPoint;
  String? customerNameSurName;
  String? customerId;
  DateTime? createdDate;

  ProductCommentCommand({
    this.id,
    this.title,
  });

  ProductCommentCommand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    productName = json['productName'];
    comment = json['comment'];
    pricePerformance = json['pricePerformance'];
    tastePoint = json['tastePoint'];
    pricePoint = json['pricePoint'];
    packingPoint = json['packingPoint'];
    accessPoint = json['accessPoint'];
    customerNameSurName = json['customerNameSurName'];
    customerId = json['customerId'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson(ProductCommentCommand productCommentCommand) {
    final data = <String, dynamic>{};
    // data['id'] = productCommentCommand.id;
    data['title'] = productCommentCommand.title;
    data['productName'] = productCommentCommand.productName;
    data['comment'] = productCommentCommand.comment;
    data['pricePerformance'] = productCommentCommand.tastePoint;
    data['pricePoint'] = productCommentCommand.pricePoint;
    data['packingPoint'] = productCommentCommand.packingPoint;
    data['accessPoint'] = productCommentCommand.accessPoint;
    data['tastePoint'] = productCommentCommand.tastePoint;
    data['customerNameSurname'] = productCommentCommand.customerNameSurName;
    data['customerId'] = productCommentCommand.customerId;
    // data['createdDate'] = productCommentCommand.createdDate;
    return data;
  }

  ProductCommentCommand fromJson(Map<String, dynamic> json) {
    return ProductCommentCommand.fromJson(json);
  }
}

import 'package:networking/networking/serializable_object.dart';

class ProductCommentResponseModel implements SerializableObject<ProductCommentResponseModel> {
  List<ProductComment> productComments;
  int responseCode;
  String responseDescription;
  ProductCommentResponseModel({this.productComments});

  ProductCommentResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    if (json['productCommentResponses'] != null) {
      productComments = <ProductComment>[];
      json['productCommentResponses'].forEach((v) {
        productComments.add(ProductComment.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ResponseCode'] = responseCode;
    data['ResponseDescription'] = responseDescription;
    if (productComments != null) {
      data['productCommentResponses'] = productComments.map((v) => v.toJson(v)).toList();
    }
    return data;
  }

  @override
  ProductCommentResponseModel fromJson(Map<String, dynamic> json) {
    return ProductCommentResponseModel.fromJson(json);
  }
}

class ProductComment {
  String id;
  String productId;
  String title;
  String productName;
  String comment;
  int tastePoint;
  // Product product;
  int pricePerformance;
  int pricePoint;
  int packingPoint;
  int accessPoint;
  String customerNameSurName;
  String customerId;

  ProductComment({
    this.id,
    this.title,
  });

  ProductComment.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson(ProductComment productComment) {
    final data = <String, dynamic>{};
    data['id'] = productComment.id;
    data['title'] = productComment.title;
    data['productName'] = productName;
    data['comment'] = productComment.comment;
    data['pricePerformance'] = productComment.tastePoint;
    data['pricePoint'] = productComment.pricePoint;
    data['packingPoint'] = productComment.packingPoint;
    data['accessPoint'] = productComment.accessPoint;
    data['tastePoint'] = productComment.tastePoint;
    data['customerNameSurName'] = productComment.customerNameSurName;
    data['customerId'] = productComment.customerId;

    return data;
  }

  ProductComment fromJson(Map<String, dynamic> json) {
    return ProductComment.fromJson(json);
  }
}

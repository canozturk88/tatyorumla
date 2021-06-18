class ProductCommentResponseModel {
  List<ProductComment>? productComments;
  int? responseCode;
  String? responseDescription;
  ProductCommentResponseModel({this.productComments});

  ProductCommentResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    if (json['productCommentResponses'] != null) {
      productComments = <ProductComment>[];
      json['productCommentResponses'].forEach((v) {
        productComments!.add(ProductComment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ResponseCode'] = responseCode;
    data['ResponseDescription'] = responseDescription;
    if (productComments != null) {
      data['productCommentResponses'] = productComments!.map((v) => v.toJson(v)).toList();
    }
    return data;
  }

  ProductCommentResponseModel fromJson(Map<String, dynamic> json) {
    return ProductCommentResponseModel.fromJson(json);
  }
}

class ProductComment {
  String? id;
  String? productId;

  String? productName;
  String? comment;
  int? tastePoint;
  // Product product;
  int? pricePerformance;
  int? pricePoint;
  int? packingPoint;
  int? accessPoint;
  String? customerNameSurName;
  String? customerUserName;
  String? customerId;
  String? createdDate;
  bool? buyAgain;
  int likeCount = 0;
  int commentCount = 0;
  bool isLike = false;

  ProductComment({
    this.id,
    // this.title,
  });

  ProductComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    //title = json['title'];
    productName = json['productName'];
    comment = json['comment'];
    pricePerformance = json['pricePerformance'];
    tastePoint = json['tastePoint'];
    pricePoint = json['pricePoint'];
    packingPoint = json['packingPoint'];
    accessPoint = json['accessPoint'];
    customerNameSurName = json['customerNameSurname'];
    customerUserName = json['customerNameSurname'];
    customerId = json['customerId'];
    createdDate = json['createdDate'];
    buyAgain = false;
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    isLike = json['isLike'];
  }

  Map<String, dynamic> toJson(ProductComment productComment) {
    final data = <String, dynamic>{};
    data['id'] = productComment.id;
    // data['title'] = productComment.title;
    data['productName'] = productName;
    data['comment'] = productComment.comment;
    data['pricePerformance'] = productComment.tastePoint;
    data['pricePoint'] = productComment.pricePoint;
    data['packingPoint'] = productComment.packingPoint;
    data['accessPoint'] = productComment.accessPoint;
    data['tastePoint'] = productComment.tastePoint;
    data['customerNameSurName'] = productComment.customerNameSurName;
    data['customerUserName'] = productComment.customerNameSurName;
    data['customerId'] = productComment.customerId;
    data['createdDate'] = productComment.createdDate;
    data['buyAgain'] = false;
    data['likeCount'] = productComment.likeCount;
    data['commentCount'] = productComment.commentCount;
    data['isLike'] = productComment.isLike;
    return data;
  }

  ProductComment fromJson(Map<String, dynamic> json) {
    return ProductComment.fromJson(json);
  }
}

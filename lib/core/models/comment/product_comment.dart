import 'package:networking/networking/serializable_object.dart';

class ProductComment extends SerializableObject<ProductComment> {
  String id;
  String productId;
  String title;
  String description;
  String subDescription;
  String detail;
  String bannerImageUrl;
  String fullImageUrl;
  String startDate;
  String endDate;
  String targetUrl;
  int targetType;
  int targetTypeId;
  bool isAnyCampaignCode;
  bool isSentCampaignCode;
  String lastParticipationDate;
  String remainingDayCounter;
  String itemTitle;
  String point;

  ProductComment({
    this.id,
    this.title,
    this.bannerImageUrl,
  });

  ProductComment.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    productId = json['ProductId'];
    point = json['Point'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['ProductId'] = productId;
    data['Point'] = point;
    return data;
  }

  @override
  ProductComment fromJson(Map<String, dynamic> json) {
    return ProductComment.fromJson(json);
  }
}

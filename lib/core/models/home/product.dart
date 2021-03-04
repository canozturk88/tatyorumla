import 'package:networking/networking/serializable_object.dart';

class Product extends SerializableObject<Product> {
  String id;
  String brandId;
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

  Product({
    this.id,
    this.title,
    this.bannerImageUrl,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    brandId = json['BrandId'];
    point = json['Point'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['BrandId'] = brandId;
    data['Point'] = point;
    return data;
  }

  @override
  Product fromJson(Map<String, dynamic> json) {
    return Product.fromJson(json);
  }
}

import 'package:networking/networking/serializable_object.dart';

class Brand extends SerializableObject<Brand> {
  String id;
  String subCategoryId;
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

  Brand({
    this.id,
    this.title,
    this.bannerImageUrl,
  });

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    subCategoryId = json['SubCategoryId'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['SubCategoryId'] = subCategoryId;
    return data;
  }

  @override
  Brand fromJson(Map<String, dynamic> json) {
    return Brand.fromJson(json);
  }
}

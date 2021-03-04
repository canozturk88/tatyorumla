import 'package:networking/networking/serializable_object.dart';

class SubCategory extends SerializableObject<SubCategory> {
  String id;
  String mainCategoryId;
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

  SubCategory({
    this.id,
    this.title,
    this.bannerImageUrl,
  });

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    mainCategoryId = json['MainCategoryId'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['MainCategoryId'] = mainCategoryId;
    return data;
  }

  @override
  SubCategory fromJson(Map<String, dynamic> json) {
    return SubCategory.fromJson(json);
  }
}

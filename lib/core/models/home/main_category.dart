import 'package:networking/networking/serializable_object.dart';

class MainCategory extends SerializableObject<MainCategory> {
  String id;
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

  MainCategory({
    this.id,
    this.title,
    this.bannerImageUrl,
  });

  MainCategory.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    bannerImageUrl = json['BannerImageUrl'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['BannerImageUrl'] = bannerImageUrl;
    return data;
  }

  @override
  MainCategory fromJson(Map<String, dynamic> json) {
    return MainCategory.fromJson(json);
  }
}

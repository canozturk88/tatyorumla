import 'package:networking/networking/serializable_object.dart';

class Banners extends SerializableObject<Banners> {
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
  String point;

  Banners(
      {this.id,
      this.title,
      this.description,
      this.subDescription,
      this.detail,
      this.bannerImageUrl,
      this.fullImageUrl,
      this.startDate,
      this.endDate,
      this.targetUrl,
      this.targetType,
      this.targetTypeId,
      this.isAnyCampaignCode,
      this.isSentCampaignCode,
      this.lastParticipationDate,
      this.remainingDayCounter,
      this.itemTitle});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    description = json['Description'];
    subDescription = json['SubDescription'];
    detail = json['Detail'];
    bannerImageUrl = json['BannerImageUrl'];
    fullImageUrl = json['FullImageUrl'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    targetUrl = json['TargetUrl'];
    targetType = json['TargetType'];
    targetTypeId = json['TargetTypeId'];
    isAnyCampaignCode = json['IsAnyCampaignCode'];
    isSentCampaignCode = json['IsSentCampaignCode'];
    lastParticipationDate = json['LastParticipationDate'];
    remainingDayCounter = json['RemainingDayCounter'];
    itemTitle = json['ItemTitle'];
    point = json['Point'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['Description'] = description;
    data['SubDescription'] = subDescription;
    data['Detail'] = detail;
    data['BannerImageUrl'] = bannerImageUrl;
    data['FullImageUrl'] = fullImageUrl;
    data['StartDate'] = startDate;
    data['EndDate'] = endDate;
    data['TargetUrl'] = targetUrl;
    data['TargetType'] = targetType;
    data['TargetTypeId'] = targetTypeId;
    data['IsAnyCampaignCode'] = isAnyCampaignCode;
    data['IsSentCampaignCode'] = isSentCampaignCode;
    data['LastParticipationDate'] = lastParticipationDate;
    data['RemainingDayCounter'] = remainingDayCounter;
    data['ItemTitle'] = itemTitle;
    data['Point'] = point;
    return data;
  }

  @override
  Banners fromJson(Map<String, dynamic> json) {
    return Banners.fromJson(json);
  }
}

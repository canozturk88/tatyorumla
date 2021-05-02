import 'package:networking/networking/serializable_object.dart';

class MainCategoryResponseModel implements SerializableObject<MainCategoryResponseModel> {
  int responseCode;
  String responseDescription;
  List<MainCategory> mainCategories;

  MainCategoryResponseModel({this.responseCode, this.responseDescription, this.mainCategories});

  MainCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    if (json['MainCategories'] != null) {
      mainCategories = <MainCategory>[];
      json['MainCategories'].forEach((v) {
        mainCategories.add(MainCategory.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ResponseCode'] = responseCode;
    data['ResponseDescription'] = responseDescription;
    if (mainCategories != null) {
      data['MainCategories'] = mainCategories.map((v) => v.toJson(v)).toList();
    }
    return data;
  }

  @override
  MainCategoryResponseModel fromJson(Map<String, dynamic> json) {
    return MainCategoryResponseModel.fromJson(json);
  }
}

class MainCategory {
  String id;
  String categoryName;
  String bannerImageUrl;

  MainCategory({
    this.id,
    this.categoryName,
    this.bannerImageUrl,
  });

  MainCategory.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    categoryName = json['CategoryName'];
    bannerImageUrl = json['BannerImageUrl'];
  }

  Map<String, dynamic> toJson(MainCategory mainCategory) {
    final data = <String, dynamic>{};
    data['Id'] = mainCategory.id;
    data['CategoryName'] = mainCategory.categoryName;
    data['BannerImageUrl'] = mainCategory.bannerImageUrl;
    return data;
  }
}

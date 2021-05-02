import 'package:networking/networking/serializable_object.dart';

class SubCategoryResponseModel implements SerializableObject<SubCategoryResponseModel> {
  int responseCode;
  String responseDescription;
  List<SubCategory> subCategories;

  SubCategoryResponseModel({this.responseCode, this.responseDescription, this.subCategories});

  SubCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    if (json['SubCategories'] != null) {
      subCategories = <SubCategory>[];
      json['SubCategories'].forEach((v) {
        subCategories.add(SubCategory.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ResponseCode'] = responseCode;
    data['ResponseDescription'] = responseDescription;
    if (subCategories != null) {
      data['SubCategories'] = subCategories.map((v) => v.toJson(v)).toList();
    }
    return data;
  }

  @override
  SubCategoryResponseModel fromJson(Map<String, dynamic> json) {
    return SubCategoryResponseModel.fromJson(json);
  }
}

class SubCategory {
  String id;
  String subCategoryName;
  String mainCategory;

  SubCategory({
    this.id,
    this.subCategoryName,
    this.mainCategory,
  });

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    subCategoryName = json['SubCategoryName'];
    mainCategory = json['MainCategory'];
  }

  Map<String, dynamic> toJson(SubCategory subCategory) {
    final data = <String, dynamic>{};
    data['Id'] = subCategory.id;
    data['SubCategoryName'] = subCategory.subCategoryName;
    data['MainCategory'] = subCategory.mainCategory;
    return data;
  }
}

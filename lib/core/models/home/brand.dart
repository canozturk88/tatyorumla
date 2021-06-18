class BrandResponseModel {
  int? responseCode;
  String? responseDescription;
  List<Brand>? brands;

  BrandResponseModel({this.responseCode, this.responseDescription, this.brands});

  BrandResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    if (json['Brands'] != null) {
      brands = <Brand>[];
      json['Brands'].forEach((v) {
        brands!.add(Brand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ResponseCode'] = responseCode;
    data['ResponseDescription'] = responseDescription;
    if (brands != null) {
      data['Brands'] = brands!.map((v) => v.toJson(v)).toList();
    }
    return data;
  }

  BrandResponseModel fromJson(Map<String, dynamic> json) {
    return BrandResponseModel.fromJson(json);
  }
}

class Brand {
  String? id;
  String? brandName;
  String? brandPoint;
  String? subCategory;

  Brand({
    this.id,
    this.brandName,
    this.subCategory,
  });

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    brandName = json['BrandName'];
    brandPoint = json['BrandPoint'].toString();
    subCategory = json['SubCategory'];
  }

  Map<String, dynamic> toJson(Brand brand) {
    final data = <String, dynamic>{};
    data['Id'] = brand.id;
    data['BrandName'] = brand.brandName;
    data['BrandPoint'] = brand.brandPoint;
    data['SubCategory'] = brand.subCategory;
    return data;
  }
}

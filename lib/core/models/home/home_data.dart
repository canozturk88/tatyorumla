import 'package:networking/networking.dart';
import '../banner/banners.dart';
import 'brand.dart';
import 'main_category.dart';
import 'product.dart';
import 'sub_category.dart';

class HomeData extends SerializableObject<HomeData> {
  List<MainCategory> mainCategory;
  List<SubCategory> subcategory;
  List<Brand> brand;
  List<Product> product;
  List<Banners> banners;
  HomeData({this.mainCategory, this.subcategory, this.brand});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['MainCategory'] != null) {
      mainCategory = <MainCategory>[];
      json['MainCategory'].forEach((v) {
        mainCategory.add(MainCategory.fromJson(v));
      });
    }
    if (json['SubCategory'] != null) {
      subcategory = <SubCategory>[];
      json['SubCategory'].forEach((v) {
        subcategory.add(SubCategory.fromJson(v));
      });
    }

    if (json['Brand'] != null) {
      brand = <Brand>[];
      json['Brand'].forEach((v) {
        brand.add(Brand.fromJson(v));
      });
    }

    if (json['Product'] != null) {
      product = <Product>[];
      json['Product'].forEach((v) {
        product.add(Product().fromJson(v));
      });
    }

    if (json['Banners'] != null) {
      banners = <Banners>[];
      json['Banners'].forEach((v) {
        banners.add(Banners.fromJson(v));
      });
    }
  }

  @override
  // ignore: missing_return
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (mainCategory != null) {
      data['MainCategory'] = mainCategory.map((v) => v.toJson(v)).toList();
    }

    if (subcategory != null) {
      data['SubCategory'] = subcategory.map((v) => v.toJson(v)).toList();
    }

    if (brand != null) {
      data['Brand'] = brand.map((v) => v.toJson(v)).toList();
    }

    if (product != null) {
      data['Product'] = product.map((v) => v.toJson(v)).toList();
    }

    if (banners != null) {
      data['Banners'] = banners.map((v) => v.toJson()).toList();
    }
  }

  @override
  HomeData fromJson(Map<String, dynamic> json) {
    return HomeData.fromJson(json);
  }
}

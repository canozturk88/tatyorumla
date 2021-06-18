import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment.dart';
import 'package:tadayim_bunu/core/models/home/brand.dart';
import 'package:tadayim_bunu/core/models/home/product.dart';
import 'package:tadayim_bunu/core/models/home/main_category.dart';
import 'package:tadayim_bunu/core/models/home/sub_category.dart';
import 'package:tadayim_bunu/core/models/user/customer_detail_response.dart';
import '../enums/shared_data.dart';

class SharedManager {
  /// [factory] init.
  SharedManager._privateConstructor() {
    SharedPreferences.getInstance().then((prefs) {
      this.prefs = prefs;
    });
  }

  static final SharedManager _instance = SharedManager._privateConstructor();

  factory SharedManager() {
    if (_instance.prefs == null) SharedManager._privateConstructor();
    return _instance;
  }

  SharedPreferences? prefs;

  Future initInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  // ignore: always_declare_return_types
  logOut() async {
    await prefs!.remove(ClientSharedEnum.loginRequestTatYorumla.toString());
    // await prefs.remove(ClientSharedEnum.userToken.toString());
    // await prefs.remove(ClientSharedEnum.customerDetail.toString());
    // await prefs.remove(ClientSharedEnum.cardList.toString());
  }

  // ignore: always_declare_return_types
  removeFirstCustomizeData() async {
    await prefs!.remove(ClientSharedEnum.selectedFuelType.toString());
    await prefs!.remove(ClientSharedEnum.selectedVehicleType.toString());
  }

  Future<bool> removePlates() async => await prefs!.remove(ClientSharedEnum.plates.toString());

  Future<bool> removeHomeData() async => await prefs!.remove(ClientSharedEnum.homeDatas.toString());

  Future<bool> removeNews() async => await prefs!.remove(ClientSharedEnum.news.toString());

  Future<bool> removeCities() async => await prefs!.remove(ClientSharedEnum.cities.toString());

  // ignore: always_declare_return_types
  removeNotifications() async {
    await prefs!.remove(ClientSharedEnum.notificationCount.toString());
    await prefs!.remove(ClientSharedEnum.notifications.toString());
  }

  Future<bool> removeHomeDataLastUpdatedTime() async => await prefs!.remove(ClientSharedEnum.homeDatasLastUpdated.toString());

  // ignore: always_declare_return_types
  removeFaq() {
    prefs!.remove(ClientSharedEnum.faq.toString());
  }

  // ignore: always_declare_return_types
  removeCardList() async => prefs!.remove(ClientSharedEnum.news.toString());

  // ignore: always_declare_return_types
  removeUserPlates() {
    prefs!.remove(ClientSharedEnum.userPlates.toString());
  }

  String? jwtToken() => prefs!.getString(ClientSharedEnum.jwtToken.toString());

  set setJwtToken(String jwtToken) {
    prefs!.setString(ClientSharedEnum.jwtToken.toString(), jwtToken);
  }

  String? token() => prefs!.getString(ClientSharedEnum.userToken.toString());

  set setToken(String token) {
    prefs!.setString(ClientSharedEnum.userToken.toString(), token);
  }

//maincategory
  MainCategoryResponseModel? get mainCategoryResponseModel {
    var mainCategoriesJson = _getFromDisk(ClientSharedEnum.mainCategoriesTatYorumla.toString());
    if (mainCategoriesJson == null) {
      return null;
    }

    return MainCategoryResponseModel.fromJson(json.decode(mainCategoriesJson));
  }

//
  set setMainCategoryResponseModel(MainCategoryResponseModel mainCategoryResponseModel) {
    saveStringToDisk(ClientSharedEnum.mainCategoriesTatYorumla.toString(), json.encode(mainCategoryResponseModel.toJson()));
  }

//sub category
  SubCategoryResponseModel? get subCategoryResponseModel {
    var subCategoriesJson = _getFromDisk(ClientSharedEnum.subCategoriesTatYorumla.toString());
    if (subCategoriesJson == null) {
      return null;
    }

    return SubCategoryResponseModel.fromJson(json.decode(subCategoriesJson));
  }

  set setSubCategoryResponseModel(SubCategoryResponseModel subCategoryResponseModel) {
    saveStringToDisk(ClientSharedEnum.subCategoriesTatYorumla.toString(), json.encode(subCategoryResponseModel.toJson()));
  }

//brand
  BrandResponseModel? get brandResponseModel {
    var brandsJson = _getFromDisk(ClientSharedEnum.brandsTatYorumla.toString());
    if (brandsJson == null) {
      return null;
    }

    return BrandResponseModel.fromJson(json.decode(brandsJson));
  }

  set setBrandResponseModel(BrandResponseModel brandResponseModel) {
    saveStringToDisk(ClientSharedEnum.brandsTatYorumla.toString(), json.encode(brandResponseModel.toJson()));
  }

//product
  ProductResponseModel? get productResponseModel {
    var productsJson = _getFromDisk(ClientSharedEnum.productsTatYorumla.toString());
    if (productsJson == null) {
      return null;
    }

    return ProductResponseModel.fromJson(json.decode(productsJson));
  }

  set setProductResponseModel(ProductResponseModel productResponseModel) {
    saveStringToDisk(ClientSharedEnum.productsTatYorumla.toString(), json.encode(productResponseModel.toJson()));
  }

  //last Product comment
  ProductCommentResponseModel? get lastProducCommentResponseModel {
    var productsCommentJson = _getFromDisk(ClientSharedEnum.lasProductComment.toString());
    if (productsCommentJson == null) {
      return null;
    }

    return ProductCommentResponseModel.fromJson(json.decode(productsCommentJson));
  }

  set setLastProducCommentResponseModel(ProductCommentResponseModel productCommentResponseModel) {
    saveStringToDisk(ClientSharedEnum.lasProductComment.toString(), json.encode(productCommentResponseModel.toJson()));
  }

// open page
  bool get isFirstOpenHomePage => prefs!.getBool(ClientSharedEnum.isFirstOpenHomePage.toString()) ?? true;

  set isFirstOpenHomePage(bool _val) {
    prefs!.setBool(ClientSharedEnum.isFirstOpenHomePage.toString(), _val);
  }

  List<String>? fuelType() => prefs!.getStringList(ClientSharedEnum.fuelType.toString());

  CustomerResponse? get custmerDetail {
    var userJson = _getFromDisk(ClientSharedEnum.loginRequestTatYorumla.toString());
    if (userJson == 'null' || userJson == null) {
      return null;
    }

    return CustomerResponse.fromJson(json.decode(userJson));
  }

  set setCustmerDetail(CustomerResponse loginRequest) {
    saveStringToDisk(ClientSharedEnum.loginRequestTatYorumla.toString(), json.encode(loginRequest.toJson(loginRequest)));
  }

  int get notificationCount => prefs!.getInt(ClientSharedEnum.notificationCount.toString()) ?? 0;

  set notificationCount(int notificationCount) {
    prefs!.setInt(ClientSharedEnum.notificationCount.toString(), notificationCount);
  }

  String get currentLanguage => 'tr-TR';

  set setCurrentLanguage(String currentLanguage) {
    prefs!.setString(ClientSharedEnum.currentLanguage.toString(), currentLanguage);
  }

  dynamic _getFromDisk(String key) {
    var value = prefs!.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void saveStringToDisk(String key, String content) {
    print('(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    prefs!.setString(key, content);
  }
}

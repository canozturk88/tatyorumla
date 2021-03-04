import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../enums/shared_data.dart';
import '../models/user/customer.dart';

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

  SharedPreferences prefs;

  Future initInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  // ignore: always_declare_return_types
  logOut() async {
    await prefs.remove(ClientSharedEnum.loginRequest.toString());
    await prefs.remove(ClientSharedEnum.userToken.toString());
    await prefs.remove(ClientSharedEnum.customerDetail.toString());
    await prefs.remove(ClientSharedEnum.cardList.toString());
  }

  // ignore: always_declare_return_types
  removeFirstCustomizeData() async {
    await prefs.remove(ClientSharedEnum.selectedFuelType.toString());
    await prefs.remove(ClientSharedEnum.selectedVehicleType.toString());
  }

  Future<bool> removePlates() async => await prefs.remove(ClientSharedEnum.plates.toString());

  Future<bool> removeHomeData() async => await prefs.remove(ClientSharedEnum.homeDatas.toString());

  Future<bool> removeNews() async => await prefs.remove(ClientSharedEnum.news.toString());

  Future<bool> removeCities() async => await prefs.remove(ClientSharedEnum.cities.toString());

  // ignore: always_declare_return_types
  removeNotifications() async {
    await prefs.remove(ClientSharedEnum.notificationCount.toString());
    await prefs.remove(ClientSharedEnum.notifications.toString());
  }

  Future<bool> removeHomeDataLastUpdatedTime() async => await prefs.remove(ClientSharedEnum.homeDatasLastUpdated.toString());

  // ignore: always_declare_return_types
  removeFaq() {
    prefs.remove(ClientSharedEnum.faq.toString());
  }

  // ignore: always_declare_return_types
  removeCardList() async => prefs.remove(ClientSharedEnum.news.toString());

  // ignore: always_declare_return_types
  removeUserPlates() {
    prefs.remove(ClientSharedEnum.userPlates.toString());
  }

  String get jwtToken => prefs.getString(ClientSharedEnum.jwtToken.toString());
  set jwtToken(String jwtToken) {
    prefs.setString(ClientSharedEnum.jwtToken.toString(), jwtToken);
  }

  String get token => prefs.getString(ClientSharedEnum.userToken.toString());

  set token(String token) {
    prefs.setString(ClientSharedEnum.userToken.toString(), token);
  }

  bool get isFirstOpenHomePage => prefs.getBool(ClientSharedEnum.isFirstOpenHomePage.toString()) ?? true;

  set isFirstOpenHomePage(bool _val) {
    prefs.setBool(ClientSharedEnum.isFirstOpenHomePage.toString(), _val);
  }

  List<String> get fuelType => prefs.getStringList(ClientSharedEnum.fuelType.toString());

  set fuelType(List<String> fuelType) {
    prefs.setStringList(ClientSharedEnum.fuelType.toString(), fuelType);
  }

  int get selectedVehicleType => prefs.get(ClientSharedEnum.selectedVehicleType.toString()) ?? -1;

  set selectedVehicleType(int selectedVehicleType) {
    prefs.setInt(ClientSharedEnum.selectedVehicleType.toString(), selectedVehicleType);
  }

  double get userMoney => prefs.get(ClientSharedEnum.userMoney.toString()) ?? 0;

  set userMoney(double userMoney) {
    prefs.setDouble(ClientSharedEnum.userMoney.toString(), userMoney);
  }

  int get selectedFuelType => prefs.get(ClientSharedEnum.selectedFuelType.toString()) ?? -1;

  set selectedFuelType(int selectedFuelType) {
    prefs.setInt(ClientSharedEnum.selectedFuelType.toString(), selectedFuelType);
  }

  int get openSurveyID => prefs.get(ClientSharedEnum.surveyId.toString()) ?? -1;

  set openSurveyID(int openSurveyID) {
    prefs.setInt(ClientSharedEnum.surveyId.toString(), openSurveyID);
  }

  int get selectedHomeDataFilterIndex => prefs.get(ClientSharedEnum.selectedHomeDataFilterIndex.toString()) ?? 0;

  set selectedHomeDataFilterIndex(int selectedHomeDataFilterIndex) {
    prefs.setInt(ClientSharedEnum.selectedHomeDataFilterIndex.toString(), selectedHomeDataFilterIndex);
  }

  int get notificationCount => prefs.get(ClientSharedEnum.notificationCount.toString()) ?? 0;

  set notificationCount(int notificationCount) {
    prefs.setInt(ClientSharedEnum.notificationCount.toString(), notificationCount);
  }

  bool get isShowOnBoarding => prefs.get(ClientSharedEnum.isShowOnBoarding.toString()) ?? false;

  set isShowOnBoarding(bool isShowOnBoarding) {
    prefs.setBool(ClientSharedEnum.isShowOnBoarding.toString(), isShowOnBoarding);
  }

  bool get isShowCustomize => prefs.get(ClientSharedEnum.isShowCustomize.toString()) ?? false;

  set isShowCustomize(bool isShowCustomize) {
    prefs.setBool(ClientSharedEnum.isShowCustomize.toString(), isShowCustomize);
  }

  bool get isHomeToStationPageRoute => prefs.get(ClientSharedEnum.isHomeToStationPageRoute.toString()) ?? false;

  set isHomeToStationPageRoute(bool isHomeToStationPageRoute) {
    prefs.setBool(ClientSharedEnum.isHomeToStationPageRoute.toString(), isHomeToStationPageRoute);
  }

  bool get isVaayActive => prefs.get(ClientSharedEnum.isVaayActive.toString()) ?? false;

  set isVaayActive(bool isVaayActive) {
    prefs.setBool(ClientSharedEnum.isVaayActive.toString(), isVaayActive);
  }

  bool get isMobilePaymentAccepted => prefs.get(ClientSharedEnum.isMobilePaymentAccepted.toString()) ?? true;

  set isMobilePaymentAccepted(bool isMobilePaymentAccepted) {
    prefs.setBool(ClientSharedEnum.isMobilePaymentAccepted.toString(), isMobilePaymentAccepted);
  }

  bool get isVaayOnBoardingShow => prefs.get(ClientSharedEnum.isVaayOnBoardingShow.toString()) ?? true;

  set isVaayOnBoardingShow(bool isVaayOnBoardingShow) {
    prefs.setBool(ClientSharedEnum.isVaayOnBoardingShow.toString(), isVaayOnBoardingShow);
  }

  Customer get custmerDetail {
    var userJson = _getFromDisk(ClientSharedEnum.loginRequest.toString());
    if (userJson == 'null' || userJson == null) {
      return null;
    }

    return Customer.fromJson(json.decode(userJson));
  }

  set custmerDetail(Customer loginRequest) {
    saveStringToDisk(ClientSharedEnum.loginRequest.toString(), json.encode(loginRequest.toJson(loginRequest)));
  }

  // LoginRequest get loginRequest {
  //   var userJson = _getFromDisk(ClientSharedEnum.loginRequest.toString());
  //   if (userJson == null) {
  //     return null;
  //   }

  //   return LoginRequest.fromJson(json.decode(userJson));
  // }

  // set loginRequest(LoginRequest loginRequest) {
  //   saveStringToDisk(ClientSharedEnum.loginRequest.toString(),
  //       json.encode(loginRequest.toJson()));
  // }

  // HomeLocationModel get homeLocation {
  //   var homeLocation = _getFromDisk(ClientSharedEnum.homeLocation.toString());
  //   if (homeLocation == null) {
  //     return new HomeLocationModel(lat: 40.9801401, lng: 29.0735152);
  //   }

  //   return HomeLocationModel.fromJson(json.decode(homeLocation));
  // }

  // set homeLocation(HomeLocationModel homeLocation) {
  //   saveStringToDisk(ClientSharedEnum.homeLocation.toString(),
  //       json.encode(homeLocation.toJson()));
  // }

  // CustomerDetail get customerDetail {
  //   var customerDetailJson =
  //       _getFromDisk(ClientSharedEnum.customerDetail.toString());
  //   if (customerDetailJson == null) {
  //     return null;
  //   }

  //   return CustomerDetail.fromJson(json.decode(customerDetailJson));
  // }

  // set customerDetail(CustomerDetail customerDetail) {
  //   saveStringToDisk(ClientSharedEnum.customerDetail.toString(),
  //       json.encode(customerDetail.toJson()));
  // }

  // String get homeDatasLastUpdated =>
  //     prefs.get(ClientSharedEnum.homeDatasLastUpdated.toString()) ??
  //     (DateTime.now().add(Duration(minutes: -10))).toString();

  // set homeDatasLastUpdated(String homeDatasLastUpdated) {
  //   prefs.setString(
  //       ClientSharedEnum.homeDatasLastUpdated.toString(), homeDatasLastUpdated);
  // }

  String get currentLanguage => prefs.get(ClientSharedEnum.currentLanguage.toString()) ?? 'tr-TR';

  set currentLanguage(String currentLanguage) {
    prefs.setString(ClientSharedEnum.currentLanguage.toString(), currentLanguage);
  }

  // HomeData get homeDatas {
  //   var homeDatasJson = _getFromDisk(ClientSharedEnum.homeDatas.toString());
  //   if (homeDatasJson == null) {
  //     return null;
  //   }

  //   return HomeData.fromJson(json.decode(homeDatasJson));
  // }

  // set homeDatas(HomeData homeDatas) {
  //   saveStringToDisk(
  //       ClientSharedEnum.homeDatas.toString(), json.encode(homeDatas.toJson()));
  // }

  // CampaignResponseModel get campaign {
  //   var campaignJson = _getFromDisk(ClientSharedEnum.campaign.toString());
  //   if (campaignJson == null) {
  //     return null;
  //   }

  //   return CampaignResponseModel.fromJson(json.decode(campaignJson));
  // }

  // set campaign(CampaignResponseModel campaign) {
  //   saveStringToDisk(
  //       ClientSharedEnum.campaign.toString(), json.encode(campaign.toJson()));
  // }

  // CampaignResponseModel get vaayCampaign {
  //   var campaignJson = _getFromDisk(ClientSharedEnum.vaayCampaign.toString());
  //   if (campaignJson == null) {
  //     return null;
  //   }

  //   return CampaignResponseModel.fromJson(json.decode(campaignJson));
  // }

  // set vaayCampaign(CampaignResponseModel vaayCampaign) {
  //   saveStringToDisk(ClientSharedEnum.vaayCampaign.toString(),
  //       json.encode(vaayCampaign.toJson()));
  // }

  // NotificationListResponseModel get notifications {
  //   var notificationsJson =
  //       _getFromDisk(ClientSharedEnum.notifications.toString());
  //   if (notificationsJson == null) {
  //     return null;
  //   }

  //   return NotificationListResponseModel.fromJson(
  //       json.decode(notificationsJson));
  // }

  // set notifications(NotificationListResponseModel notifications) {
  //   saveStringToDisk(ClientSharedEnum.notifications.toString(),
  //       json.encode(notifications.toJson()));
  // }

  // FaqResponseModel get faq {
  //   var faqJson = _getFromDisk(ClientSharedEnum.faq.toString());
  //   if (faqJson == null) {
  //     return null;
  //   }

  //   return FaqResponseModel.fromJson(json.decode(faqJson));
  // }

  // set faq(FaqResponseModel faq) {
  //   saveStringToDisk(
  //       ClientSharedEnum.faq.toString(), json.encode(faq.toJson()));
  // }

  // NewsModel get news {
  //   var newsJson = _getFromDisk(ClientSharedEnum.news.toString());
  //   if (newsJson == null) {
  //     return null;
  //   }

  //   return NewsModel.fromJson(json.decode(newsJson));
  // }

  // set news(NewsModel news) {
  //   saveStringToDisk(
  //       ClientSharedEnum.news.toString(), json.encode(news.toJson()));
  // }

  // double get getMaxAmount =>
  //     prefs.get(ClientSharedEnum.getMaxAmount.toString()) ?? 0.0;

  // set getMaxAmount(double maxAmount) {
  //   prefs.setDouble(ClientSharedEnum.getMaxAmount.toString(), maxAmount);
  // }

  // List<CardList> get cardList {
  //   var cardListJson = _getFromDisk(ClientSharedEnum.cardList.toString());
  //   if (cardListJson == null || cardListJson.toString().contains("null")) {
  //     return null;
  //   }
  //   Iterable l = json.decode(cardListJson);
  //   var cardList = l.map((model) => CardList.fromJson(model)).toList();
  //   return cardList;
  // }

  // set cardList(List<CardList> cardList) {
  //   saveStringToDisk(
  //       ClientSharedEnum.cardList.toString(), json.encode(cardList));
  // }

  // List<Stations> get stationList {
  //   var stationsListJson =
  //       _getFromDisk(ClientSharedEnum.stationsList.toString());
  //   if (stationsListJson == null ||
  //       stationsListJson.toString().contains("null")) {
  //     return null;
  //   }
  //   Iterable l = json.decode(stationsListJson);
  //   var cardList = l.map((model) => Stations.fromJson(model)).toList();
  //   return cardList;
  // }

  // set stationList(List<Stations> stationsListJson) {
  //   saveStringToDisk(ClientSharedEnum.stationsList.toString(),
  //       json.encode(stationsListJson));
  // }

  // List<City> get cities {
  //   var cityListJson = _getFromDisk(ClientSharedEnum.cities.toString());
  //   if (cityListJson == null || cityListJson.toString().contains("null")) {
  //     return null;
  //   }
  //   Iterable l = json.decode(cityListJson);
  //   var cities = l.map((model) => City.fromJson(model)).toList();
  //   return cities;
  // }

  // set cities(List<City> stationsListJson) {
  //   saveStringToDisk(
  //       ClientSharedEnum.cities.toString(), json.encode(stationsListJson));
  // }

  // List<MobilePaymentPlates> get plates {
  //   var platesListJson = _getFromDisk(ClientSharedEnum.plates.toString());
  //   if (platesListJson == null) {
  //     return List();
  //   }
  //   Iterable l = json.decode(platesListJson);
  //   var plates = l.map((model) => MobilePaymentPlates.fromJson(model)).toList();
  //   return plates;
  // }

  // set plates(List<MobilePaymentPlates> platesListJson) {
  //   saveStringToDisk(
  //       ClientSharedEnum.plates.toString(), json.encode(platesListJson));
  // }

  dynamic _getFromDisk(String key) {
    var value = prefs.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void saveStringToDisk(String key, String content) {
    print('(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    prefs.setString(key, content);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../enums/page_named.dart';
import '../models/home/brand.dart';
import '../models/home/home_data.dart';
import '../models/home/main_category.dart';
import '../models/home/product.dart';
import '../models/home/sub_category.dart';
import '../services/shared_prefernces_api.dart';
import 'base_model.dart';
import 'main_view_model.dart';

class WriteCommentViewodel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  PageController bannerPageController;
  PageController pricesPageController;

  int currentPosition = 0;
  int currentBannerPosition = 0;
  int bannerListSize = 0;

  // HomeRequestModel _homeRequestModel;

  // ApiServices apiService;

  HomeData homeData;

  // FilterModel filterModel;
  // List<HomeFilterImageModel> homeFilterImageData;
  List<MainCategory> _mainCategories;
  List<SubCategory> _subCategory;
  List<Brand> _brand;
  List<Product> _product;

  SharedManager sharedManager = SharedManager();

  bool pointVisibility = false;

  List<Widget> imageList = [];
  Function goToStationView;

  // ignore: always_declare_return_types
  WriteCommentView() {
    _mainCategories = <MainCategory>[];
    _subCategory = <SubCategory>[];
    _brand = <Brand>[];
    _product = <Product>[];
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
    // Future.delayed(Duration(milliseconds: 500),() async {
    //   await OneSignal.shared.promptUserForPushNotificationPermission(fallbackToSettings: true);
    // });
  }

  /*
  void _animateBannerSlider() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      try {
        int nextPage = bannerPageController.page.round() + 1;

        if (nextPage == banners.length) {
          nextPage = 0;
        }

        bannerPageController.animateToPage(nextPage, duration: Duration(seconds: 1), curve: Curves.linear).then((_) => _animateBannerSlider());
      } catch (e) {
        print("Sayfa değişti sorun yok devam.");
      }
    });
  }

   */

  // ignore: always_declare_return_types
  navigateToStation(int index, Function goToStationView) async {
    sharedManager.selectedHomeDataFilterIndex = index;
    sharedManager.isHomeToStationPageRoute = true;
    goToStationView();
  }

  void animatePricesSlider() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      try {
        var nextPage = pricesPageController.page.round() + 1;

        // if (nextPage == dailyPrices.length) {
        //   nextPage = 0;
        // }

        pricesPageController.animateToPage(nextPage, duration: Duration(seconds: 1), curve: Curves.linear).then((_) => animatePricesSlider());
      } catch (e) {
        print('Sayfa değişti sorun yok devam.');
      }
    });
  }

  Future getHomeData() async {
    try {
      var mainCategory = MainCategory();
      mainCategory.id = '1';
      mainCategory.title = 'Temel Gida';
      mainCategory.bannerImageUrl = 'temel_gida';

      var mainCategory1 = MainCategory();
      mainCategory1.id = '2';
      mainCategory1.title = 'Sut Urunleri';
      mainCategory1.bannerImageUrl = 'sut_urunleri';

      var mainCategory2 = MainCategory();
      mainCategory2.id = '3';
      mainCategory2.title = 'Kahvalti';
      mainCategory2.bannerImageUrl = 'kahvaltilik';

      var mainCategory3 = MainCategory();
      mainCategory3.id = '4';
      mainCategory3.title = 'Dondurma';
      mainCategory3.bannerImageUrl = 'dondurma';

      var mainCategory4 = MainCategory();
      mainCategory4.id = '5';
      mainCategory4.title = 'Atistirmalik';
      mainCategory4.bannerImageUrl = 'atistirmalik';

      _mainCategories.add(mainCategory);
      _mainCategories.add(mainCategory1);
      _mainCategories.add(mainCategory2);
      _mainCategories.add(mainCategory3);
      _mainCategories.add(mainCategory4);

      var subCategory = SubCategory();
      subCategory.id = '1';
      subCategory.title = 'Et, Balik & Tavuk';
      subCategory.mainCategoryId = '1';

      var subCategor1 = SubCategory();
      subCategor1.id = '2';
      subCategor1.title = 'Makarna';
      subCategor1.mainCategoryId = '1';

      var subCategor3 = SubCategory();
      subCategor3.id = '3';
      subCategor3.title = 'Sut';
      subCategor3.mainCategoryId = '2';

      var subCategor4 = SubCategory();
      subCategor4.id = '4';
      subCategor4.title = 'Peynir';
      subCategor4.mainCategoryId = '2';

      var subCategor5 = SubCategory();
      subCategor5.id = '5';
      subCategor5.title = 'Yumurta';
      subCategor5.mainCategoryId = '3';

      var subCategory10 = SubCategory();
      subCategory10.id = '6';
      subCategory10.title = 'Yogurt';
      subCategory10.mainCategoryId = '3';

      var subCategor54 = SubCategory();
      subCategor54.id = '7';
      subCategor54.title = 'Vegan';
      subCategor54.mainCategoryId = '3';

      var subCategor11 = SubCategory();
      subCategor11.id = '8';
      subCategor11.title = 'Sarkuteri';
      subCategor11.mainCategoryId = '3';

      var subCategor43 = SubCategory();
      subCategor43.id = '9';
      subCategor43.title = 'Bal & Recel';
      subCategor43.mainCategoryId = '3';

      var subCategor32 = SubCategory();
      subCategor32.id = '10';
      subCategor32.title = 'Zeytin';
      subCategor32.mainCategoryId = '3';

      _subCategory.add(subCategory);
      _subCategory.add(subCategor1);
      _subCategory.add(subCategor3);
      _subCategory.add(subCategor4);
      _subCategory.add(subCategor5);
      _subCategory.add(subCategory10);
      _subCategory.add(subCategor11);
      _subCategory.add(subCategor32);
      _subCategory.add(subCategor43);
      _subCategory.add(subCategor54);

      var brand1 = Brand();
      brand1.id = '1';
      brand1.title = 'Besler';
      brand1.subCategoryId = '1';

      var brand2 = Brand();
      brand2.id = '2';
      brand2.title = 'Erpilic';
      brand2.subCategoryId = '1';

      var brand3 = Brand();
      brand3.id = '3';
      brand3.title = 'Ankara';
      brand3.subCategoryId = '2';

      var brand4 = Brand();
      brand4.id = '4';
      brand4.title = 'Filiz';
      brand4.subCategoryId = '2';

      _brand.add(brand1);
      _brand.add(brand2);
      _brand.add(brand3);
      _brand.add(brand4);

      var product = Product();
      product.id = '1';
      product.title = 'Besler Tavuk 1';
      product.brandId = '1';
      product.bannerImageUrl = 'temel_gida';

      var product1 = Product();
      product1.id = '2';
      product1.title = 'Besler Et 2';
      product1.brandId = '1';
      product1.bannerImageUrl = 'temel_gida';

      var product2 = Product();
      product2.id = '3';
      product2.title = 'Besler Et 3';
      product2.brandId = '1';
      product2.bannerImageUrl = 'temel_gida';

      var product3 = Product();
      product3.id = '4';
      product3.title = 'Besler Tavuk 5';
      product3.brandId = '1';
      product3.bannerImageUrl = 'temel_gida';

      var product4 = Product();
      product4.id = '5';
      product4.title = 'Besler Et 5';
      product4.brandId = '1';
      product4.bannerImageUrl = 'temel_gida';

      var product5 = Product();
      product5.id = '6';
      product5.title = 'Besler Et 6';
      product5.brandId = '1';
      product5.bannerImageUrl = 'temel_gida';

      _product.add(product);
      _product.add(product1);
      _product.add(product2);
      _product.add(product3);
      _product.add(product4);
      _product.add(product5);

      setData();
    } catch (e) {
      setData();
    }

    notifyListeners();
  }

  // ignore: always_declare_return_types
  setData({double lat, double lng}) async {
    // _homeRequestModel.token = SharedManager().token;

    // _homeRequestModel.isVaayUser = sharedManager.customerDetail == null
    //     ? false
    //     : sharedManager.customerDetail.isLCardApproved;
    // final homeDataResponse =
    //     await apiService.getHomeDatas(homeRequestModel: _homeRequestModel);

    // if (homeDataResponse.data.data is HomeData) {
    //   homeData = homeDataResponse.data.data as HomeData;
    //   banners = homeData.banners;
    //   campaigns = homeData.campaigns;
    //   weatherForecast = homeData.weatherForecast;
    //   dailyPrices = homeData.dailyPrices;

    homeData = HomeData();
    homeData.mainCategory = _mainCategories;
    homeData.subcategory = _subCategory;
    homeData.brand = _brand;
    homeData.product = _product;
    //   sharedManager.homeDatas = homeData;
    //   try {
    //     notifyListeners();
    //   } catch (e) {}
    //   Logger().d("Anasayfa Data Kaynağı Service");
    // } else {
    //   Logger().d("Anasayfa Data Yüklenemedi");
    // }
  }

  bool getPointVisibility() {
    // if (sharedManager.loginRequest != null) {
    //   if (sharedManager.loginRequest.cardType != 0) {
    //     pointVisibility = false;
    //   } else {
    //     pointVisibility = true;
    //   }
    // } else {
    //   pointVisibility = true;
    // }

    return pointVisibility;
  }

  // ignore: always_declare_return_types
  setHomeDataShared() async {
    // if (sharedManager.homeDatas != null) {
    //   homeData = sharedManager.homeDatas;
    //   banners = homeData.banners;
    //   campaigns = homeData.campaigns;
    //   weatherForecast = homeData.weatherForecast;
    //   dailyPrices = homeData.dailyPrices;
    // }
  }

  // getRemainingText(int _position) {
  //   Campaigns campaign = campaigns[_position];
  //   if (campaign.remainingDayCounter != null) {
  //     return "${campaign.remainingDayCounter}";
  //   } else {
  //     return "";
  //     //return "Son Katılım: ${DateTimeUtils.convertDate(campaign.lastParticipationDate)}";
  //   }
  // }

  // ignore: always_declare_return_types
  nextBannerPage() async => Future.delayed(Duration(seconds: 2), () {
        if (bannerPageController.hasClients) {
          bannerPageController.nextPage(duration: Duration(milliseconds: 1500), curve: Curves.easeInOut);
        }
      });

  // ignore: always_declare_return_types
  buttonClick() async {
    SharedManager().isShowOnBoarding = true;
    await navigator.navigateToRemove(Pages.Home);
  }

  // ignore: always_declare_return_types
  changePage(int currentPage) async {
    currentPosition = currentPage;
    notifyListeners();
  }

  // ignore: always_declare_return_types
  changeBanner(int currentBanner) async {
    if (currentBanner > 4) {
      currentBannerPosition = 4;
    } else {
      currentBannerPosition = currentBanner;
    }

    notifyListeners();
  }

  // ignore: missing_return
  Future<String> getPointVal() async {
    // if (sharedManager.token == null) {
    //   return null;
    // } else if (homeData == null || homeData.pointAmount == null) {
    //   return null;
    // } else {
    //   return homeData.pointAmount.toString();
    // }
  }

  // openAnnouncementDetail(Campaigns campaign) {
  //   navigator.navigateTo(Pages.AnnouncementDetail, campaign);
  // }

  Future<void> snackBarWarningMessage(String _message) async => print('asdasd');

  Future<void> openLeftDrawer() async => await MainViewModel.openLeftMenu();

  Future<void> updateHomeDataPoint() async => notifyListeners();

  // ignore: always_declare_return_types
  launchBannerURL(int bannerIndex) async {
    // String url = banners[bannerIndex].targetUrl;
    // if (await canLaunch(url)) {
    //   await launch(url, forceSafariVC: false);
    // } else {
    //   print("Geçersiz url");
    // }
  }

  @override
  void dispose() {
    bannerPageController.dispose();
    pricesPageController.dispose();
    // newLocationManager.stopService();
    // newLocationManager = null;
    super.dispose();
  }
}

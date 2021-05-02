import 'package:flutter/cupertino.dart';
import '../enums/page_named.dart';
import '../models/banner/banners.dart';
import '../models/home/brand.dart';
import '../models/home/home_data.dart';
import '../models/home/main_category.dart';
import '../models/home/product.dart';
import '../models/home/sub_category.dart';
import '../services/shared_prefernces_api.dart';
// import 'package:geolocator/geolocator.dart';

import 'package:tadayim_bunu/core/viewmodels/base_model.dart';
import 'package:tadayim_bunu/core/viewmodels/main_view_model.dart';

class FilterPageViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  int currentPosition = 0;
  int bannerListSize = 0;
  SharedManager sharedManager = SharedManager();
  PageController bannerPageController;
  String commentCount;
  //HomeRequestModel _homeRequestModel;

  // List<Notice> customerNotice = null;
  //ApiServices apiService;
  int currentBannerPosition = 0;

  HomeData homeData;
  List<Banners> banners;

  List<MainCategory> _mainCategories;
  List<SubCategory> _subCategory;
  List<Brand> _brand;
  List<Product> _product;

  bool pointVisibility = false;

  FilterPageViewModel() {
    // bannerPageController = PageController();
    _mainCategories = <MainCategory>[];
    _subCategory = <SubCategory>[];
    _brand = <Brand>[];
    _product = <Product>[];
    banners = <Banners>[];
    commentCount = '5';
    // bannerPageController = new PageController();
    // pricesPageController = new PageController();
    // customerNotice = new List<Notice>();
    // _homeRequestModel = new HomeRequestModel();

    // apiService = new ApiServices();
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  // ignore: always_declare_return_types
  clickBanner(int bannerIndex) async {
    var clickedBanner = banners[bannerIndex];
    var _product = Product();
    _product.bannerImageUrl = clickedBanner.bannerImageUrl;
    _product.id = clickedBanner.id;
    _product.productName = clickedBanner.itemTitle;

    await navigator.navigateTo(Pages.ProductDetail, _product);
    // } else {}
  }

  // ignore: always_declare_return_types
  setHomeDataShared() async {
    // if (sharedManager.homeDatas != null) {
    //   homeData = sharedManager.homeDatas;
    //   // banners = homeData.banners;
    //   // campaigns = homeData.campaigns;
    //   // weatherForecast = homeData.weatherForecast;
    //   // dailyPrices = homeData.dailyPrices;
    // }
  }

  Future openLeftDrawer() async => MainViewModel.openLeftMenu();

  Future<void> updateHomeDataPoint() async => notifyListeners();

  // ignore: always_declare_return_types
  changeBanner(int currentBanner) async {
    if (currentBanner > 4) {
      currentBannerPosition = 4;
    } else {
      currentBannerPosition = currentBanner;
    }

    notifyListeners();
  }

  Future getHomeData() async {
    try {
      // var mainCategory = MainCategory();
      // mainCategory.id = '1';
      // mainCategory.categoryName = 'Temel Gida';
      // mainCategory.bannerImageUrl = 'temel_gida';

      // var mainCategory1 = MainCategory();
      // mainCategory1.id = '2';
      // mainCategory1.categoryName = 'Sut Urunleri';
      // mainCategory1.bannerImageUrl = 'sut_urunleri';

      // var mainCategory2 = MainCategory();
      // mainCategory2.id = '3';
      // mainCategory2.categoryName = 'Kahvalti';
      // mainCategory2.bannerImageUrl = 'kahvaltilik';

      // var mainCategory3 = MainCategory();
      // mainCategory3.id = '4';
      // mainCategory3.categoryName = 'Dondurma';
      // mainCategory3.bannerImageUrl = 'dondurma';

      // var mainCategory4 = MainCategory();
      // mainCategory4.id = '5';
      // mainCategory4.categoryName = 'Atistirmalik';
      // mainCategory4.bannerImageUrl = 'atistirmalik';

      // _mainCategories.add(mainCategory);
      // _mainCategories.add(mainCategory1);
      // _mainCategories.add(mainCategory2);
      // _mainCategories.add(mainCategory3);
      // _mainCategories.add(mainCategory4);

      _mainCategories = SharedManager().mainCategoryResponseModel.mainCategories;
      _subCategory = SharedManager().subCategoryResponseModel.subCategories;
      _brand = SharedManager().brandResponseModel.brands;
      _product = SharedManager().productResponseModel.products;
      // var subCategory = SubCategory();
      // subCategory.id = '1';
      // subCategory.title = 'Et, Balik & Tavuk';
      // subCategory.mainCategoryId = '1';

      // var subCategor1 = SubCategory();
      // subCategor1.id = '2';
      // subCategor1.title = 'Makarna';
      // subCategor1.mainCategoryId = '1';

      // var subCategor3 = SubCategory();
      // subCategor3.id = '3';
      // subCategor3.title = 'Sut';
      // subCategor3.mainCategoryId = '2';

      // var subCategor4 = SubCategory();
      // subCategor4.id = '4';
      // subCategor4.title = 'Peynir';
      // subCategor4.mainCategoryId = '2';

      // var subCategor5 = SubCategory();
      // subCategor5.id = '5';
      // subCategor5.title = 'Yumurta';
      // subCategor5.mainCategoryId = '3';

      // var subCategory10 = SubCategory();
      // subCategory10.id = '6';
      // subCategory10.title = 'Yogurt';
      // subCategory10.mainCategoryId = '3';

      // var subCategor54 = SubCategory();
      // subCategor54.id = '7';
      // subCategor54.title = 'Vegan';
      // subCategor54.mainCategoryId = '3';

      // var subCategor11 = SubCategory();
      // subCategor11.id = '8';
      // subCategor11.title = 'Sarkuteri';
      // subCategor11.mainCategoryId = '3';

      // var subCategor43 = SubCategory();
      // subCategor43.id = '9';
      // subCategor43.title = 'Bal & Recel';
      // subCategor43.mainCategoryId = '3';

      // var subCategor32 = SubCategory();
      // subCategor32.id = '10';
      // subCategor32.title = 'Zeytin';
      // subCategor32.mainCategoryId = '3';

      // _subCategory.add(subCategory);
      // _subCategory.add(subCategor1);
      // _subCategory.add(subCategor3);
      // _subCategory.add(subCategor4);
      // _subCategory.add(subCategor5);
      // _subCategory.add(subCategory10);
      // _subCategory.add(subCategor11);
      // _subCategory.add(subCategor32);
      // _subCategory.add(subCategor43);
      // _subCategory.add(subCategor54);

      // var brand1 = Brand();
      // brand1.id = '1';
      // brand1.title = 'Besler';
      // brand1.subCategoryId = '1';

      // var brand2 = Brand();
      // brand2.id = '2';
      // brand2.title = 'Erpilic';
      // brand2.subCategoryId = '1';

      // var brand3 = Brand();
      // brand3.id = '3';
      // brand3.title = 'Ankara';
      // brand3.subCategoryId = '2';

      // var brand4 = Brand();
      // brand4.id = '4';
      // brand4.title = 'Filiz';
      // brand4.subCategoryId = '2';

      // _brand.add(brand1);
      // _brand.add(brand2);
      // _brand.add(brand3);
      // _brand.add(brand4);

      // var product = Product();
      // product.bannerImageUrl = '1607580523214';
      // product.id = '1';
      // product.title = 'Besler Tavuk 1';
      // product.brandId = '606c80368b56e297e11bef76';
      // product..pricePerformance = 4.4;
      // // product.bannerImageUrl = 'temel_gida';

      // var product1 = Product();
      // product1.bannerImageUrl = '1607580523214';
      // product1.id = '2';
      // product1.title = 'Besler Et 2';
      // product1.brandId = '606c80368b56e297e11bef76';
      // // product1.bannerImageUrl = 'temel_gida';
      // product.detail = 'deneme';
      // product1.pricePerformance = 4.0;

      // var product2 = Product();
      // product2.bannerImageUrl = '1607580523214';
      // product2.id = '3';
      // product2.title = 'Besler Et 3';
      // product2.brandId = '606c80368b56e297e11bef76';
      // // product2.bannerImageUrl = 'temel_gida';
      // product2.detail = 'deneme';
      // product2..pricePerformance = 4.0;

      // var product3 = Product();
      // product3.bannerImageUrl = '1607580523214';
      // product3.id = '4';
      // product3.title = 'Besler Tavuk 5';
      // product3.brandId = '606c80368b56e297e11bef76';
      // // product3.bannerImageUrl = 'temel_gida';
      // product3.detail = 'deneme';
      // product3..pricePerformance = 4.0;

      // var product4 = Product();
      // product4.bannerImageUrl = '1607580523214';
      // product4.id = '5';
      // product4.title = 'Besler Et 5';
      // product4.brandId = '606c80368b56e297e11bef76';
      // // product4.bannerImageUrl = 'temel_gida';
      // product4.detail = 'deneme';
      // product4..pricePerformance = 4.0;

      // var product5 = Product();
      // product5.bannerImageUrl = '1607580523214';
      // product5.id = '6';
      // product5.title = 'Besler Et 6';
      // product5.brandId = '606c80368b56e297e11bef76';
      // product5.detail = 'deneme';
      // product5..pricePerformance = 4.0;
      // product5.bannerImageUrl = 'temel_gida';

      // _product.add(product);
      // _product.add(product1);
      // _product.add(product2);
      // _product.add(product3);
      // _product.add(product4);
      // _product.add(product5);

      var banner = Banners();
      banner.id = '1';
      banner.bannerImageUrl = 'http://api.bildireyimbunu.com/UploadFile/1607580523214.jpg';
      banner.title = 'Ulker Cikolata';
      banner.itemTitle = 'Ulker Cikolata';
      banner.point = '7,8';

      var banner1 = Banners();
      banner.id = '2';
      banner1.bannerImageUrl = 'http://api.bildireyimbunu.com/UploadFile/1608791928990.jpg';
      banner1.title = 'Ulker Cikolata';
      banner1.itemTitle = 'Ulker Cikolata';
      banner1.point = '7,8';

      banners.add(banner);
      banners.add(banner);

      setData();
    } catch (e) {
      setData();
    }
    notifyListeners();
  }

  Future<Future> gotoMyNoticeView() async => navigator.navigateToRemove(Pages.SignIn);

  Future<Future> gotoCommentPage(Product product) async => navigator.navigateToRemove(Pages.MyAccount);

  // ignore: always_declare_return_types
  setData() async {
    homeData = HomeData();
    homeData.mainCategory = _mainCategories;
    homeData.subcategory = _subCategory;
    homeData.brand = _brand;
    homeData.product = _product;
    homeData.banners = banners;
  }

  @override
  void dispose() {
    // bannerPageController.dispose();
    // pricesPageController.dispose();
    super.dispose();
  }
}

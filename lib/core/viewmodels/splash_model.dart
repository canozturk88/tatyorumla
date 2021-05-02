import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tadayim_bunu/core/apis/catalog/catalog_api.dart';
import 'package:tadayim_bunu/core/apis/productComment/product_comment_api.dart';
// import 'package:logger/logger.dart';
// import 'package:preference/pref_manager.dart';
import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment.dart';
import 'package:tadayim_bunu/core/models/home/brand.dart';
import 'package:tadayim_bunu/core/models/home/product.dart';
import 'package:tadayim_bunu/core/models/home/main_category.dart';
import 'package:tadayim_bunu/core/models/home/sub_category.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'package:tadayim_bunu/core/viewmodels/base_model.dart';

class SplashViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;
  // ApiServices _apiService;
  // TokenRequestModel tokenRequestModel;

  // HomeRequestModel _homeRequestModel;

  // CampaignRequestModel campaignRequestModel;

  // PrefManager prefs = PrefManager();

  final SharedManager _sharedManager = SharedManager();
  // NotificationListRequestModel notificationListRequestModel =
  //     new NotificationListRequestModel();
  // RemoteConfig remoteConfig;

  SplashViewModel() {
    // _apiService = new ApiServices();
    // tokenRequestModel = new TokenRequestModel();
    // _homeRequestModel = new HomeRequestModel();
    // campaignRequestModel = new CampaignRequestModel();

    _sharedManager.isFirstOpenHomePage = true;
    _sharedManager.removeNews();
    _sharedManager.removeCities();
    _sharedManager.removePlates();
    _sharedManager.removeUserPlates();
  }

  Future login() async {
//----ggetMostCity
    await CatalogApiServices.getAllMainCategory().then((response) {
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        var responseMainCategory = MainCategoryResponseModel.fromJson(map);
        _sharedManager.mainCategoryResponseModel = responseMainCategory;
      }
    });

    await CatalogApiServices.getAllSubCategory().then((response) {
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        var responseSubCategory = SubCategoryResponseModel.fromJson(map);
        _sharedManager.subCategoryResponseModel = responseSubCategory;
      }
    });

    await CatalogApiServices.getAllBrands().then((response) {
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        var responseBRands = BrandResponseModel.fromJson(map);
        _sharedManager.brandResponseModel = responseBRands;
      }
    });

    await CatalogApiServices.getAllProducts().then((response) {
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        var responseProduct = ProductResponseModel.fromJson(map);
        _sharedManager.productResponseModel = responseProduct;
      }
    });

    await ProductCommentApiServices.getLastTenProductComments().then((response) {
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        var responseProductComment = ProductCommentResponseModel.fromJson(map);
        _sharedManager.lastProducCommentResponseModel = responseProductComment;
      }
    });

    // if (_sharedManager.loginRequest != null && _sharedManager.token != null) {
    //   var loginResponse = await _apiService.loginUser(
    //       loginRequest: _sharedManager.loginRequest);

    //   if (loginResponse.data is LoginResponse) {
    //     _sharedManager.token = loginResponse.data.tokenValue;

    //     tokenRequestModel.token = loginResponse.data.tokenValue;
    //     var customerDetailResponse = await _apiService.getCustomerDetail(
    //         tokenRequestModel: tokenRequestModel);
    //     if (customerDetailResponse.data is CustomerDetailResponse) {
    //       if (customerDetailResponse.data.customerDetail.avatarUrl != null) {
    //         await precacheImage(
    //             Image.network(
    //                     customerDetailResponse.data.customerDetail.avatarUrl)
    //                 .image,
    //             _context);
    //       }
    //       _sharedManager.customerDetail =
    //           customerDetailResponse.data.customerDetail;
    //     }
    //   } else {
    //     SharedManager().logOut();
    //   }
    // }

    // remoteConfig = await RemoteConfig.instance;
    // final defaults = <String, dynamic>{'isVaayActive': false};

    // try {
    //   await remoteConfig.setDefaults(defaults);
    //   await remoteConfig.fetch(expiration: Duration(milliseconds: 100));
    //   await remoteConfig.activateFetched();
    // } catch (e) {
    //   print("fr");
    // }
    // _sharedManager.isVaayActive = remoteConfig.getBool("isVaayActive");

    // campaignRequestModel.categoryId = 1;
    // var campaigns = await _apiService.getCampaigns(
    //     campaignRequestModel: campaignRequestModel);
    // if (campaigns.data is CampaignResponseModel) {
    //   _sharedManager.campaign = campaigns.data;
    //   await PhotoFetch.fetch(campaigns.data.campaigns, context);
    // }

    // if (_sharedManager.customerDetail != null &&
    //     _sharedManager.customerDetail.isLCardApproved) {
    //   var vaayCampaign = await _apiService.getVaayCampaigns(
    //       campaignRequestModel: campaignRequestModel);
    //   if (vaayCampaign.data is CampaignResponseModel) {
    //     _sharedManager.vaayCampaign = vaayCampaign.data;
    //     await PhotoFetch.fetch(vaayCampaign.data.campaigns, context);
    //   }
    // }

    // if (_sharedManager.homeDatas == null) {
    //   _homeRequestModel.token = _sharedManager.token;
    //   _homeRequestModel.latitude = null;
    //   _homeRequestModel.longitude = null;
    //   _homeRequestModel.isVaayUser = _sharedManager.customerDetail == null
    //       ? false
    //       : _sharedManager.customerDetail.isLCardApproved;

    //   var homeDataResponse =
    //       await _apiService.getHomeDatas(homeRequestModel: _homeRequestModel);
    //   if (homeDataResponse.data is HomeResponse) {
    //     _sharedManager.removeHomeData();
    //     _sharedManager.homeDatas = homeDataResponse.data.data;
    //     Logger().d("Splash HomeData success");
    //   } else {
    //     Logger().d("Splash HomeData ERROR");
    //   }
    // }

    // var faqResponse = await _apiService.getFaq();

    // if (faqResponse.data is FaqResponseModel) {
    //   _sharedManager.removeFaq();
    //   _sharedManager.faq = faqResponse.data;
    // }

    // // GET ALL NOTIFICATIONS
    // _sharedManager.removeNotifications();
    // if (_sharedManager.token != null) {
    //   notificationListRequestModel.token = _sharedManager.token;
    //   notificationListRequestModel.currentPage = 0.toString();
    //   notificationListRequestModel.pageSize = 25.toString();
    //   final response = await _apiService.getNotificationList(
    //       notificationListRequestModel: notificationListRequestModel);

    //   if (response.data is NotificationListResponseModel) {
    //     _sharedManager.notifications = response.data;
    //     _sharedManager.notificationCount =
    //         _sharedManager.notifications.totalUnreadNotificationCount;
    //   } else {
    //     print("Bir Hata meydana geldi");
    //   }
    // }
  }

  @override
  void setContext(BuildContext context) {
    _context = context;

    login().whenComplete(() {
      Future.delayed(Duration(milliseconds: 1200), () {
        // if (!SharedManager().isShowOnBoarding) {
        //   Future.delayed(Duration(milliseconds: 1500), () {
        //     navigator.navigateToRemove(Pages.Onboarding);
        //   });
        // } else if (!SharedManager().isShowCustomize) {
        //   Future.delayed(Duration(milliseconds: 1500), () {
        //     navigator.navigateToRemove(Pages.Customize);
        //   });
        // } else {
        navigator.navigateToRemove(Pages.Home);
        //}
      });
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'base_model.dart';
import '../../ui/views/home/home_view.dart';
import '../../ui/views/left_drawer_widget.dart';

class MainViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  static GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey();

  // ApiServices _apiService;
  // CampaignRequestModel campaignRequestModel;
  // SharedManager _sharedManager = new SharedManager();

  // Campaigns campaignDetail;
  // List<News> news = new List();
  // News newsDetail;

  HomeView homeView;
  // CreditView creditView;
  int currentIndex = 0;
  LeftDrawerWidget leftDrawerWidget;
  // NotificationListRequestModel notificationListRequestModel =
  //     new NotificationListRequestModel();

  List<Widget> bottomBarChildren = [
    // StationsView(),
    // AnnouncementView(),
  ];

  void goToCampaignList() {
    currentIndex = 2;
    notifyListeners();
  }

  void goToStationView() {
    currentIndex = 1;
    notifyListeners();
  }

  MainViewModel() {
    // _apiService = new ApiServices();
    // campaignRequestModel = new CampaignRequestModel();

    homeView = HomeView(
        // goToCampaignList: goToCampaignList,
        // goToStationView: goToStationView,
        );

    //creditView = CreditView();
    bottomBarChildren.insert(0, homeView);
    // bottomBarChildren.insert(3, creditView);
    leftDrawerWidget = LeftDrawerWidget(
      onChangeTokenStatus: () {
        //TODO başka sayfadaysa burayı kapat
        if (currentIndex == 0) {
          homeView.homeViewModel.getHomeData();
        } else if (currentIndex == 3) {
          //   creditView.creditViewModel.notifyListeners();
        }
      },
      returnMain: () {
        notifyListeners();
      },
      returnMainConverted: () {
        homeView.homeViewModel.updateHomeDataPoint();
      },
    );
  }

  void onTabTapped(int index) async {
    // if (index == 0) {
    //   await CoreHelper.analyticsScreenLog(
    //       screen: AnalyticsConstants.ANALYTICS_HOME_VIEW);
    // } else if (index == 1) {
    //   await CoreHelper.analyticsScreenLog(
    //       screen: AnalyticsConstants.ANALYTICS_STATION_VIEW);
    // } else if (index == 2) {
    //   await CoreHelper.analyticsScreenLog(
    //       screen: AnalyticsConstants.ANALYTICS_ANNOUNCEMENT_VIEW);
    // } else if (index == 3) {
    //   await CoreHelper.analyticsScreenLog(
    //       screen: AnalyticsConstants.ANALYTICS_PAYMENT_SELECTION_VIEW);
    // }
    currentIndex = index;
    notifyListeners();
  }

  static Future<void> openLeftMenu() async => mainScaffoldKey.currentState.openDrawer();

  @override
  void setContext(BuildContext context) {
    _context = context;

    // QuickActions quickActions = QuickActions();
    // quickActions.initialize((shortcutType) {
    //   if (shortcutType == 'station') {
    //     onTabTapped(1);
    //   } else if (shortcutType == 'campaigns') {
    //     onTabTapped(2);
    //   } else if (shortcutType == 'paymentSelection') {
    //     onTabTapped(3);
    //   } else if (shortcutType == 'dailiyPrice') {
    //     navigator.navigateTo(Pages.Home);
    //   } else if (shortcutType == 'customCode') {
    //     navigator.navigateTo(Pages.Home);
    //   }
    // });

    // quickActions.setShortcutItems(<ShortcutItem>[
    //   ShortcutItem(type: 'station', localizedTitle: translate(context, LanguageConstants.of(context).stations), icon: "station"),
    //   ShortcutItem(type: 'campaigns', localizedTitle: translate(context, LanguageConstants.of(context).campaigns), icon: "campaign"),
    //   ShortcutItem(
    //       type: 'paymentSelection', localizedTitle: translate(context, LanguageConstants.of(context).paymentSelection), icon: "payment_selection"),
    //   ShortcutItem(type: 'dailiyPrice', localizedTitle: translate(context, LanguageConstants.of(context).fuelPrices), icon: "price"),
    // ]);
  }

  // getCampaigns(OSNotification notification,
  //     {bool isClickNotify = false}) async {
  //   campaignDetail = new Campaigns();
  //   campaignRequestModel.categoryId = 1;
  //   setState(ViewState.Busy);
  //   var campaigns = await _apiService.getCampaigns(
  //       campaignRequestModel: campaignRequestModel);
  //   setState(ViewState.Idle);
  //   if (campaigns.data is CampaignResponseModel) {
  //     _sharedManager.campaign = campaigns.data;
  //     try {
  //       campaignDetail = _sharedManager.campaign.campaigns.firstWhere(
  //           (element) =>
  //               element.id ==
  //               notification.payload.additionalData["notificationValueId"]);
  //     } catch (e) {
  //       campaignDetail = null;
  //     }
  //     notifyListeners();

  //     if (isClickNotify) {
  //       navigator.navigateTo(Pages.AnnouncementDetail, campaignDetail);
  //     } else {
  //       if (campaignDetail != null) {
  //         UIHelper.showSnackBar(
  //           key: mainScaffoldKey,
  //           duration: 4,
  //           child: Text(translate(context,
  //               LanguageConstants.of(context).infoReceivedNewCampaign)),
  //           action: SnackBarAction(
  //             label: translate(
  //                 context, LanguageConstants.of(context).infoViewDetail),
  //             onPressed: () {
  //               navigator.navigateTo(Pages.AnnouncementDetail, campaignDetail);
  //             },
  //           ),
  //         );
  //       }
  //     }
  //   }
  // }

  // getNews(OSNotification notification, {bool isClickNotify = false}) async {
  //   newsDetail = new News();
  //   setState(ViewState.Busy);
  //   final response = await _apiService.getNews();
  //   setState(ViewState.Idle);
  //   if (response.data is NewsModel) {
  //     news = response.data.news;

  //     try {
  //       newsDetail = news.firstWhere((element) =>
  //           element.id ==
  //           notification.payload.additionalData["notificationValueId"]);
  //     } catch (e) {
  //       newsDetail = null;
  //     }

  //     if (isClickNotify) {
  //       navigator.navigateTo(Pages.NewsDetail, newsDetail);
  //     } else {
  //       if (newsDetail != null) {
  //         UIHelper.showSnackBar(
  //           key: mainScaffoldKey,
  //           child: Text(translate(
  //               context, LanguageConstants.of(context).infoReceivedNews)),
  //           duration: 4,
  //           action: SnackBarAction(
  //             label: translate(
  //                 context, LanguageConstants.of(context).infoViewNewDetail),
  //             onPressed: () {
  //               navigator.navigateTo(Pages.NewsDetail, newsDetail);
  //             },
  //           ),
  //         );
  //       }
  //     }
  //   }
  // }
}

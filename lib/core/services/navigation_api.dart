import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../enums/page_named.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final _removeAllOldRoutes = (Route<dynamic> route) => false;

  Future<dynamic> navigateTo(Pages routeType, [Object arguments = '', int extraVal]) async {
    return await navigatorKey.currentState.pushNamed(_named(routeType), arguments: arguments);
  }

  void pop() {
    if (isPop()) {
      return navigatorKey.currentState.pop();
    }
    return null;
  }

  bool isPop() {
    return navigatorKey.currentState.canPop();
  }

  Future<dynamic> navigateToRemove(Pages routeType, [Object arguments = '']) async {
    return await navigatorKey.currentState.pushNamedAndRemoveUntil(_named(routeType), _removeAllOldRoutes, arguments: arguments);
  }

  void fullScreenPopup() {
    // ignore: unnecessary_new
    navigatorKey.currentState.push(new MaterialPageRoute<Null>(builder: newMethod, fullscreenDialog: true));
  }

  Widget newMethod(BuildContext context) {
    return Container();
  }

  // ignore: always_declare_return_types
  analyticsLog(String screenName) async {
    //await CoreHelper.analyticsScreenLog(screen: screenName);
  }

  String _named(Pages page) {
    switch (page) {
      case Pages.Splash:
        return '/splash';

      case Pages.Login:
        return '/login';

      case Pages.Signin:
        return '/signin';

      case Pages.MyAccount:
        return '/myAccount';

      case Pages.Onboarding:
        return '/onboarding';

      case Pages.Home:
        return '/main';

      case Pages.DoNotice:
        return '/doNotice';

      case Pages.MyNotice:
        return '/myNotice';

      case Pages.ProductDetail:
        return '/productDetail';

      case Pages.News:
        // analyticsLog(AnalyticsConstants.ANALYTICS_NEWS_VIEW);
        return '/newsRoute';

      // case Pages.FuelPrices:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_FUEL_PRICE_VIEW);
      //   return "/fuelPrices";

      // case Pages.Announcement:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_ANNOUNCEMENT_VIEW);
      //   return "/announcement";

      // case Pages.VaayAnnouncement:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_VAAY_ANNOUNCEMENT_VIEW);
      //   return "/vaayAnnouncement";

      // case Pages.CreateVirtualCard:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_CREATE_VIRTUAL_CARD_VIEW);
      //   return "/createVirtualCard";

      // case Pages.AnnouncementDetail:
      //   return "/announcementDetail";

      // case Pages.Customize:
      // return "/customize";

      // case Pages.Profile:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_ACCOUNT_VIEW);
      //   return "/profile";

      // case Pages.VehicleInfo:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_VEHICLE_INFO_VIEW);
      //   return "/vehicleInfo";

      // case Pages.SuggestionsAndComplaints:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_SUGGESTION_VIEW);
      //   return "/suggestionsAndComplaints";

      // case Pages.CustomCode:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_CUSTOM_CODE_VIEW);
      //   return "/customCodeRoute";

      // case Pages.CardListRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_CARD_LIST_VIEW);
      //   return "/cardListRoute";

      // case Pages.AddCardRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_ADD_CARD_VIEW);
      //   return "/addCardRoute";

      // case Pages.UpdatePasswordRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_UPDATE_PASSWORD_VIEW);
      //   return "/updatePasswordRoute";

      // case Pages.ProfileInfoRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_PROFILE_VIEW);
      //   return "/profileInfoRoute";

      // case Pages.MobilePaymentRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_MOBILE_PAYMENT_VIEW);
      //   return "/mobilePaymentRoute";

      // case Pages.Contact:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_CONTACT_VIEW);
      //   return "/contactRoute";

      // case Pages.News:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_NEWS_VIEW);
      //   return "/newsRoute";

      // case Pages.NewsDetail:
      //   return "/newsDetailRoute";

      // case Pages.CodesDetailRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_CODES_DETAIL_VIEW);
      //   return "/codesDetailRoute";

      // case Pages.PaycellCardListRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_PAYCELL_CARD_LIST_VIEW);
      //   return "/paycellCardListRoute";

      // case Pages.PaycellAddCardRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_PAYCELL_ADD_CARD_VIEW);
      //   return "/paycellAddCardRoute";

      // case Pages.UpdateCardRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_UPDATE_CARD_VIEW);
      //   return "/updateCardRoute";

      // case Pages.VehicleInfoDetail:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_VEHICLE_INFO_DETAIL_VIEW);
      //   return "/vehicleInfoDetail";

      // case Pages.FuelTypeDetail:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_FUEL_TYPE_INFO_DETAIL_VIEW);
      //   return "/fuelTypeDetailRoute";

      // case Pages.RoadSongsCardRoute:
      //   return "/roadSongsCardRoute";

      // case Pages.Web3dViewRoute:
      //   return "/web3dViewRoute";

      // case Pages.AllTransactionRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_ALL_TRANSACTION_VIEW);
      //   return "/allTransactionRoute";

      // case Pages.AllTransactionsDetailRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_ALL_TRANSACTION_DETAIL_VIEW);
      //   return "/allTransactionsDetailRoute";

      // case Pages.AytemizBot:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_AYTEMIZ_BOT_VIEW);
      //   return "/aytemizBotRoute";

      // case Pages.QrCode:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_QR_CODE_VIEW);
      //   return "/qrCodeRoute";

      // case Pages.CampaignQrCode:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_CAMPAIGN_QR_CODE_VIEW);
      //   return "/campaignQrCodeRoute";

      // case Pages.Faq:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_MOBILE_FAQ_VIEW);
      //   return "/faqRoute";

      // case Pages.Surveys:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_MOBILE_SURVEYS_VIEW);
      //   return "/surveysRoute";

      // case Pages.SurveyDetail:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_MOBILE_SURVEY_DETAIL_VIEW);
      //   return "/surveyDetailRoute";

      // case Pages.NotificationConfigRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_NOTIFICATION_CONFIG_VIEW);
      //   return "/notificationConfigRoute";

      // case Pages.NotificationsRoute:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_NOTIFICATIONS_VIEW);
      //   return "/notificationsRoute";

      // case Pages.VaayFormViewModel:
      //   analyticsLog(AnalyticsConstants.AYT_FORM_VIEW);
      //   return "/vaayFormViewModel";

      // case Pages.VaayOnboardingViewModel:
      //   analyticsLog(AnalyticsConstants.ANALYTICS_VAAY_ONBOARDING);
      //   return "/vaayOnboardingViewModel";

      default:
        return '/';
    }
  }
}

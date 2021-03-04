import 'package:flutter/material.dart';
import 'views/main_view.dart';
import 'views/product/product_detail.dart';
import 'views/splash/splash_view.dart';

import 'views/customer/customer_login_view.dart';

class Router {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
  static const String createVirtualCardRoute = '/createVirtualCard';
  static const String onboardingRoute = '/onboarding';
  static const String fuelPrices = '/fuelPrices';
  static const String announcement = '/announcement';
  static const String vaayAnnouncement = '/vaayAnnouncement';
  static const String announcementDetail = '/announcementDetail';
  static const String customizeRoute = '/customize';
  static const String profileRoute = '/profile';
  static const String vehicleInfoRoute = '/vehicleInfo';
  static const String vehicleInfDetailoRoute = '/vehicleInfoDetail';
  static const String fuelTypeDetailRoute = '/fuelTypeDetailRoute';
  static const String customCodeRoute = '/customCodeRoute';
  static const String suggestionsAndComplaints = '/suggestionsAndComplaints';
  static const String cardListRoute = '/cardListRoute';
  static const String addCardRoute = '/addCardRoute';
  static const String updateCardRoute = '/updateCardRoute';
  static const String updatePasswordRoute = '/updatePasswordRoute';
  static const String profileInfoRoute = '/profileInfoRoute';
  static const String mobilePaymentRoute = '/mobilePaymentRoute';
  static const String contactRoute = '/contactRoute';
  static const String newsRoute = '/newsRoute';
  static const String newsDetailRoute = '/newsDetailRoute';
  static const String codesDetailRoute = '/codesDetailRoute';
  static const String paycellCardListRoute = '/paycellCardListRoute';
  static const String paycellAddCardRoute = '/paycellAddCardRoute';
  static const String roadSongsCardRoute = '/roadSongsCardRoute';
  static const String web3dViewRoute = '/web3dViewRoute';
  static const String allTransactionRoute = '/allTransactionRoute';
  static const String allTransactionsDetailRoute = '/allTransactionsDetailRoute';
  static const String aytemizBotRoute = '/aytemizBotRoute';
  static const String qrCodeRoute = '/qrCodeRoute';
  static const String campaignQrCodeRoute = '/campaignQrCodeRoute';
  static const String notificationConfigRoute = '/notificationConfigRoute';
  static const String faqRoute = '/faqRoute';
  static const String surveysRoute = '/surveysRoute';
  static const String surveyDetailRoute = '/surveyDetailRoute';
  static const String notificationsRoute = '/notificationsRoute';
  static const String vaayFormViewModel = '/vaayFormViewModel';
  static const String vaayOnboardingViewModel = '/vaayOnboardingViewModel';
  static const String customerLogin = '/login';
  static const String productDetail = '/productDetail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      // case loginRoute:
      //   return MaterialPageRoute(builder: (_) => LoginView());
      case mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case customerLogin:
        return MaterialPageRoute(builder: (_) => CustomerLoginView());
      case productDetail:
        return MaterialPageRoute(builder: (_) => ProductDetailView(), settings: settings);
      // case onboardingRoute:
      //   return MaterialPageRoute(builder: (_) => OnboardingView());
      // case fuelPrices:
      //   return MaterialPageRoute(builder: (_) => FuelPricesView());
      // case announcement:
      //   return MaterialPageRoute(builder: (_) => AnnouncementView());
      // case vaayAnnouncement:
      //   return MaterialPageRoute(builder: (_) => VaayAnnouncementView());
      // case createVirtualCardRoute:
      //   return MaterialPageRoute(builder: (_) => CreateVirtualCardView(), settings: settings);
      // case announcementDetail:
      //   return MaterialPageRoute(builder: (_) => AnnouncementDetailView(), settings: settings);
      // case customizeRoute:
      //   return MaterialPageRoute(builder: (_) => CustomizeView());
      // case profileRoute:
      //   return MaterialPageRoute(builder: (_) => ProfileView());
      // case vehicleInfoRoute:
      //   return MaterialPageRoute(builder: (_) => VehicleInfoView());
      // case customCodeRoute:
      //   return MaterialPageRoute(builder: (_) => CustomCodeView());
      // case suggestionsAndComplaints:
      //   return MaterialPageRoute(builder: (_) => SuggestionsAndComplaintsView());
      // case cardListRoute:
      //   return MaterialPageRoute(builder: (_) => CardListView());
      // case addCardRoute:
      //   return MaterialPageRoute(builder: (_) => AddCardView());
      // case updatePasswordRoute:
      //   return MaterialPageRoute(builder: (_) => UpdatePasswordView());
      // case profileInfoRoute:
      //   return MaterialPageRoute(builder: (_) => ProfileInfoView(), settings: settings);
      // case mobilePaymentRoute:
      //   return MaterialPageRoute(builder: (_) => MobilePaymentView());
      // case contactRoute:
      //   return MaterialPageRoute(builder: (_) => ContactView());
      // case newsRoute:
      //   return MaterialPageRoute(builder: (_) => NewsView());
      // case newsDetailRoute:
      //   return MaterialPageRoute(builder: (_) => NewsDetailView(), settings: settings);
      // case codesDetailRoute:
      //   return MaterialPageRoute(builder: (_) => CodesDetailView(), settings: settings);
      // case paycellCardListRoute:
      //   return MaterialPageRoute(builder: (_) => PaycellCardListView());
      // case paycellAddCardRoute:
      //   return MaterialPageRoute(builder: (_) => PaycellAddCardView(), settings: settings);
      // case updateCardRoute:
      //   return MaterialPageRoute(builder: (_) => UpdateCardView(), settings: settings);
      // case vehicleInfDetailoRoute:
      //   return MaterialPageRoute(builder: (_) => VehicleInfoDetailView(), settings: settings);
      // case fuelTypeDetailRoute:
      //   return MaterialPageRoute(builder: (_) => FuelTypeDetailView(), settings: settings);
      // case roadSongsCardRoute:
      //   return MaterialPageRoute(builder: (_) => RoadSongsView());
      // case web3dViewRoute:
      //   return MaterialPageRoute(builder: (_) => Web3dView(), settings: settings);
      // case allTransactionRoute:
      //   return MaterialPageRoute(builder: (_) => AllTransactionView());
      // case allTransactionsDetailRoute:
      //   return MaterialPageRoute(builder: (_) => AllTransactionsDetailView(), settings: settings);
      // case aytemizBotRoute:
      //   return MaterialPageRoute(builder: (_) => AytemizBotView());
      // case qrCodeRoute:
      //   return MaterialPageRoute(builder: (_) => QrCodeView());
      // case campaignQrCodeRoute:
      //   return MaterialPageRoute(builder: (_) => CampaignQrCodeView(), settings: settings);
      // case faqRoute:
      //   return MaterialPageRoute(builder: (_) => FaqView());
      // case notificationConfigRoute:
      //   return MaterialPageRoute(builder: (_) => NotificationConfigView());

      // case surveysRoute:
      //   return MaterialPageRoute(builder: (_) => SurveysView());

      // case surveyDetailRoute:
      //   return MaterialPageRoute(builder: (_) => SurveyDetailView());

      // case notificationsRoute:
      //   return MaterialPageRoute(builder: (_) => NotificationsView());
      // case vaayFormViewModel:
      //   return MaterialPageRoute(builder: (_) => AytFormView());
      // case vaayOnboardingViewModel:
      //   return MaterialPageRoute(builder: (_) => VaayOnboardingView());

      //TODO
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

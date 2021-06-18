import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'router/router.gr.dart';
import 'ui/shared/language/app_localizations.dart';
import 'ui/shared/styles/colors.dart';
import 'core/services/shared_prefernces_api.dart';
import 'locator.dart';
import 'ui/shared/language/app_language.dart';

String get baseUrl => 'localhost:7000';
//String get baseUrl => '0ae62e11d474.ngrok.io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _applicationConfigure();
  HttpOverrides.global = MyHttpOverrides();
  var appLanguage = AppLanguage();
  await appLanguage.fetchLocale();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ProviderScope(
    child: TadayimBunuApp(),
  ));
}

final _appRouter = AppRouter();

class TadayimBunuApp extends StatelessWidget {
  // final AppLanguage appLanguage;
  // TadayimBunuApp();

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: Size(900, 1920),
      builder: () => MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        title: 'Tadayim Bunu',
        debugShowCheckedModeBanner: false,
        // navigatorKey: locator<NavigationService>().navigatorKey,

        theme: ThemeData(
          platform: TargetPlatform.android,
          primaryColor: mainColor,
          accentColor: Colors.grey,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          fontFamily: 'Lato',
        ),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('tr', ''),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}

Future _applicationConfigure() async {
  initLocator();
  //FlutterError.onError = Crashlytics.instance.recordFlutterError;
  await FlutterConfig.loadEnvVariables();
  await SharedManager().initInstance();
}

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
    _safeAreaHorizontal = _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical = _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
  }
}

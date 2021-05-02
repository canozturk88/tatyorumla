import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'ui/shared/language/app_localizations.dart';
import 'ui/shared/language/language_constants.dart';
import 'ui/router.dart' as rt;
import 'ui/shared/styles/colors.dart';
import 'core/services/navigation_api.dart';
import 'core/services/shared_prefernces_api.dart';
import 'locator.dart';
import 'ui/shared/language/app_language.dart';

String get baseUrl => 'http://4128afce0549.ngrok.io/';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  notificationConfig();
  await _applicationConfigure();

  var appLanguage = AppLanguage();
  await appLanguage.fetchLocale();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(LanguageConstants(child: TadayimBunuApp())); // TODO runZoned
}

class TadayimBunuApp extends StatelessWidget {
  final AppLanguage appLanguage;
  TadayimBunuApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp;
  }

  Widget get _buildMaterialApp {
    return MaterialApp(
      title: 'Tadayim Bunu',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: rt.Router.generateRoute,
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
    );
  }
}

Future _applicationConfigure() async {
  initLocator();
  //FlutterError.onError = Crashlytics.instance.recordFlutterError;
  await FlutterConfig.loadEnvVariables();
  await SharedManager().initInstance();
}

// ignore: always_declare_return_types
notificationConfig() async {
  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  // OneSignal.shared.init("d48672d9-2fbb-4dfd-b3d3-30758889057b", iOSSettings: {OSiOSSettings.autoPrompt: false, OSiOSSettings.inAppLaunchUrl: true});
  // OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
  //await OneSignal.shared.promptUserForPushNotificationPermission(fallbackToSettings: true);
}

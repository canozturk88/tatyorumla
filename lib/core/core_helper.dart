import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoreHelper {
//   static final validCharacters = RegExp(r'^[a-zA-Z]+$');

//   static const String kGoogleApiKey = "AIzaSyDS2f8wvdKE1V2f3PLzxtnnG40HNGJp004";

//   int getAmountMoney(String currentMoney) {
//     return int.parse(currentMoney.replaceAll("₺", "").split(",")[0]);
//   }

//   int getAmountDoubleToInt(String currentMoney) {
//     return double.parse(currentMoney).toInt();
//   }

//   double getAmountDoubleMoney(String currentMoney) {
//     return double.parse(currentMoney.replaceAll("${Constants.TL_SYMBOL}", "").replaceAll(",", "."));
//   }

//   static String dateTimeParser(DateTime date) {
//     return "${date.day}/${date.month}/${date.year}";
//   }

//   static DateTime stringToDate(String strDate) {
//     if (strDate != null || strDate.length > 0) {
//       if (strDate.contains("-")) {
//         return DateFormat("yyyy-MM-dd").parse(strDate);
//       }
//       return DateFormat("dd.MM.yyyy").parse(strDate);
//     } else {
//       return null;
//     }
//   }

//   static String stringToDate2(DateTime _date) {
//     if (_date == null) {
//       return null;
//     }
//     return DateFormat("dd.MM.yyyy").format(_date);
//   }

//   /// Servise giderken
//   static String stringToDate3(DateTime _date) {
//     if (_date == null) {
//       return null;
//     }
//     return DateFormat("yyyy-MM-dd hh:mm").format(_date);
//   }

//   /// Servise giderken
//   static String stringToDate4(String _date) {
//     if (_date == null || _date.length < 1) {
//       return null;
//     }
//     return DateFormat("yyyy-MM-dd").format(stringToDate(_date));
//   }

//   static bool isFuelTypeOK(String selectedFuelTypes) {
//     bool isOk = true;

//     if (selectedFuelTypes.contains("2") && selectedFuelTypes.contains("3")) {
//       // Benzin kontrolü
//       isOk = false;
//     } else if (selectedFuelTypes.contains("3") && selectedFuelTypes.length > 1) {
//       // Motorin kontrolü
//       isOk = false;
//     } else if ((selectedFuelTypes.contains("4") && selectedFuelTypes.contains("3")) || (selectedFuelTypes.contains("4") && selectedFuelTypes.contains("1"))) {
//       // Elektrik kontrolü
//       isOk = false;
//     } else if (selectedFuelTypes.contains("1") && selectedFuelTypes.length == 1) {
//       isOk = false;
//     }

//     return isOk;
//   }

//   static LatLngBounds boundsFromLatLngList(List<LatLng> list) {
//     double x0, x1, y0, y1;
//     for (LatLng latLng in list) {
//       if (x0 == null) {
//         x0 = x1 = latLng.latitude;
//         y0 = y1 = latLng.longitude;
//       } else {
//         if (latLng.latitude > x1) x1 = latLng.latitude;
//         if (latLng.latitude < x0) x0 = latLng.latitude;
//         if (latLng.longitude > y1) y1 = latLng.longitude;
//         if (latLng.longitude < y0) y0 = latLng.longitude;
//       }
//     }
//     return LatLngBounds(northeast: LatLng(x1, y1), southwest: LatLng(x0, y0));
//   }

//   static launchCaller(String phoneNumber) async {
//     String url = "tel:$phoneNumber";
//     if (await canLaunch(url.replaceAll(" ", ""))) {
//       await launch(url.replaceAll(" ", ""));
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   static launchSms({String phone, String body}) async {
//     final separator = Platform.isIOS ? '&' : '?';
//     String urlStart = 'sms:$phone';
//     String urlEnd = '${separator}body=$body';
//     String url = "$urlStart";
//     if (body != null) {
//       url = url + "$urlEnd";
//     } else {
//       if(Platform.isAndroid){
//         url = url + "${separator}body=${" "}";
//       }

//     }

//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
  static String parseDateData(String dateData) {
    var formater = DateFormat('yyy-MM-dd hh:mm');
    return formater.format(DateTime.parse(dateData));
  }

  static Duration timeBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    var diff = (to.difference(from));
    return diff;
    //return (to.difference(from).inHours / 24).round();
  }

  // static int mounthBetween(DateTime from, DateTime to) {
  //   from = DateTime(from.year, from.month, from.day);
  //   to = DateTime(to.year, to.month, to.day);
  //   var asd = (to.difference(from));
  //   return (to.difference(from).inHours / 24).round();
  // }

  static String calculatepassedTime(String dateData) {
    final createdDate = DateTime.parse(dateData);
    final dateNow = DateTime.now();

    final difference = timeBetween(createdDate, dateNow);

    if (difference.inSeconds < 60) {
      return difference.inSeconds.toString() + ' sn';
    } else if (difference.inMinutes < 60) {
      return difference.inMinutes.toString() + ' dk';
    } else if (difference.inHours < 24) {
      return difference.inHours.toString() + ' sa';
    } else if (difference.inDays < 8) {
      return difference.inDays.toString() + ' gün';
    } else {
      return (difference.inDays / 7).round().toString() + ' h';
    }

    // var formater = DateFormat('yyy-MM-dd hh:mm');
    // return formater.format(DateTime.parse(dateData));
  }

  static Color getColor(status) {
    if (status) {
      return Colors.red;
    } else {
      return CupertinoColors.systemGrey;
    }
  }
//   static launchSocial(String _url) async {
//     String url = _url;
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   static launchMail(String _url) async {
//     String url = "mailto:$_url";
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   static String getUniqValue() {
//     return "${new Random().nextInt(500000)}${new DateTime.now().millisecondsSinceEpoch}${new Random().nextInt(500000)}";
//   }

//   static unFocus(context) {
//     FocusScope.of(context).requestFocus(FocusNode());
//   }

//   static analyticsScreenLog({String screen}) async {
//     await FirebaseAnalytics().logEvent(
//       name: '$screen',
//     );
//     print("AnalyticsLOGGG: $screen");
//   }

//   static analyticsHomeEventLog({String screen, String parameters}) async {
//     await FirebaseAnalytics().logEvent(
//       name: '$screen',
//       parameters: <String, dynamic>{
//         'Gidilen_Icerik': '$parameters',
//       },
//     );
//     print("AnalyticsLOGGG: $screen");
//   }

//   static analyticsNewsEventLog({String screen, String parameters}) async {
//     await FirebaseAnalytics().logEvent(
//       name: '$screen',
//       parameters: <String, dynamic>{
//         'AcilanHaber_Adi': '$parameters',
//       },
//     );
//     print("AnalyticsLOGGG: $screen");
//   }

//   static analyticsCampaignEventLog({String screen, String parameters}) async {
//     await FirebaseAnalytics().logEvent(
//       name: '$screen',
//       parameters: <String, dynamic>{
//         'AcilanKampanya_Adi': '$parameters',
//       },
//     );
//     print("AnalyticsLOGGG: $screen");
//   }

//   static analyticsDailyPriceEventLog({String screen, String county}) async {
//     await FirebaseAnalytics().logEvent(
//       name: '$screen',
//       parameters: <String, dynamic>{
//         'Ilce': '$county',
//       },
//     );

//     print("AnalyticsLOGGG: $screen");
//   }
}

// import 'package:aytemiz_mobile/core/models/stations/station_detail_response_model.dart';
// import 'package:aytemiz_mobile/ui/shared/language/app_localizations.dart';
// import 'package:aytemiz_mobile/ui/shared/language/language_constants.dart';
// import 'package:aytemiz_mobile/ui/shared/my_flutter_app_icons.dart';
// import 'package:aytemiz_mobile/ui/shared/styles/colors.dart';
// import 'package:aytemiz_mobile/ui/shared/viewhelper/ui_helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:tadayim_bunu/ui/shared/language/app_localizations.dart';
// import 'package:tadayim_bunu/ui/shared/language/language_constants.dart';
// import 'package:tadayim_bunu/ui/shared/styles/colors.dart';
// import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';

// class MapsBottomModalView extends StatelessWidget {
//   final VoidCallback onRoutePress;
//   final VoidCallback onCallPress;
//   // final Station station;

//   const MapsBottomModalView({
//     Key key,
//     this.onRoutePress,
//     this.onCallPress,
//     // this.station,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black,
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//         child: Container(
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               SizedBox(
//                 height: UIHelper.dynamicHeight(30),
//               ),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     flex: 3,
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 18),
//                       child: station.subTitle != null
//                           ? buildSubTitleColumn
//                           : buildJustTitleColumn,
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       children: <Widget>[
//                         InkWell(
//                           onTap: () {
//                             onRoutePress();
//                           },
//                           child: Column(
//                             children: <Widget>[
//                               FloatingActionButton(
//                                 child: Icon(
//                                   Icons.keyboard,
//                                   color: Colors.white,
//                                   size: 20,
//                                 ),
//                                 backgroundColor: red,
//                                 mini: true,
//                               ),
//                               Text(
//                                 AppLocalizations.of(context).translate(
//                                     LanguageConstants.of(context).direction),
//                                 style: TextStyle(
//                                   color: red,
//                                   fontSize: UIHelper.dynamicSp(32),
//                                   fontWeight: FontWeight.w900,
//                                   fontStyle: FontStyle.normal,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: UIHelper.dynamicHeight(48),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             onCallPress();
//                           },
//                           child: Column(
//                             children: <Widget>[
//                               FloatingActionButton(
//                                 child: Icon(
//                                   MyFlutterAppIcon.icon62,
//                                   color: Colors.white,
//                                   size: 20,
//                                 ),
//                                 mini: true,
//                                 backgroundColor: red,
//                               ),
//                               Text(
//                                 AppLocalizations.of(context).translate(
//                                     LanguageConstants.of(context).search2),
//                                 style: TextStyle(
//                                   color: red,
//                                   fontSize: UIHelper.dynamicSp(32),
//                                   fontWeight: FontWeight.w900,
//                                   fontStyle: FontStyle.normal,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: UIHelper.dynamicHeight(30),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget get buildSubTitleColumn {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(station.newTitle ?? "",
//             style: TextStyle(
//               color: spaceBlack,
//               fontSize: UIHelper.dynamicSp(60),
//               fontWeight: FontWeight.w900,
//               fontStyle: FontStyle.normal,
//             )),
//         SizedBox(
//           height: UIHelper.dynamicHeight(24),
//         ),
//         Text(station.subTitle ?? "Aytemiz",
//             style: TextStyle(
//               color: red,
//               fontSize: UIHelper.dynamicSp(48),
//               fontWeight: FontWeight.w900,
//               fontStyle: FontStyle.normal,
//             )),
//         SizedBox(
//           height: UIHelper.dynamicHeight(24),
//         ),
//         Text(station.address ?? "",
//             style: TextStyle(
//               color: Color(0xff454749),
//               fontSize: UIHelper.dynamicSp(36),
//               fontWeight: FontWeight.w600,
//               fontStyle: FontStyle.normal,
//             )),
//         SizedBox(
//           height: UIHelper.dynamicHeight(40),
//         ),
//         Row(
//           children: <Widget>[
//             station.gas
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_gas.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.aytCard
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_aytemiz_card.png",
//                         height: UIHelper.dynamicHeight(50)))
//                 : Container(),
//             station.motorbikerFriend
//                 ? buildStationDetailImage(
//                     image: Image.asset(
//                         "assets/images/filter_biker_friendly.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.castrol
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_castrol.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.charging
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_charge.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.freeWifi
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_free_wifi.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.aYTRecognize
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_ayt.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.selfService
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_self_service.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//           ],
//         )
//       ],
//     );
//   }

//   Widget get buildJustTitleColumn {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(station.title ?? "",
//             style: TextStyle(
//               color: red,
//               fontSize: UIHelper.dynamicSp(48),
//               fontWeight: FontWeight.w900,
//               fontStyle: FontStyle.normal,
//             )),
//         SizedBox(
//           height: UIHelper.dynamicHeight(24),
//         ),
//         Text(station.address ?? "",
//             style: TextStyle(
//               color: Color(0xff454749),
//               fontSize: UIHelper.dynamicSp(36),
//               fontWeight: FontWeight.w600,
//               fontStyle: FontStyle.normal,
//             )),
//         SizedBox(
//           height: UIHelper.dynamicHeight(40),
//         ),
//         Row(
//           children: <Widget>[
//             station.gas
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_gas.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.aytCard
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_aytemiz_card.png",
//                         height: UIHelper.dynamicHeight(50)))
//                 : Container(),
//             station.motorbikerFriend
//                 ? buildStationDetailImage(
//                     image: Image.asset(
//                         "assets/images/filter_biker_friendly.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.castrol
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_castrol.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.charging
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_charge.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.freeWifi
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_free_wifi.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.aYTRecognize
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_ayt.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//             station.selfService
//                 ? buildStationDetailImage(
//                     image: Image.asset("assets/images/filter_self_service.png",
//                         height: UIHelper.dynamicHeight(60)))
//                 : Container(),
//           ],
//         )
//       ],
//     );
//   }

//   Padding buildStationDetailImage({Widget image}) {
//     return Padding(
//       padding: EdgeInsets.only(right: UIHelper.dynamicSp(12)),
//       child: image,
//     );
//   }
// }

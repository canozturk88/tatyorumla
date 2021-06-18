// import 'package:flutter/material.dart';
// import '../../../core/models/home/brand.dart';
// import '../../../core/models/home/main_category.dart';
// import '../../../core/models/home/product.dart';
// import '../../../core/models/home/sub_category.dart';
// import '../../../core/viewmodels/write_comment_view_models.dart';
// import '../../shared/styles/colors.dart';
// import '../../shared/view_helper/ui_helper.dart';
// import '../baseview.dart';

// import '../../../main.dart';

// // ignore: must_be_immutable
// class WriteCommentView extends StatefulWidget {
//   WriteCommentViewodel? writeCommentViewodel;

//   Function? goToCampaignList;
//   Function? goToStationView;

//   WriteCommentView({this.writeCommentViewodel, this.goToCampaignList, this.goToStationView});

//   @override
//   _WriteCommentViewState createState() => _WriteCommentViewState();
// }

// class _WriteCommentViewState extends State<WriteCommentView> {
//   late WriteCommentViewodel _homeViewModel;
//   bool subcategory = false;
//   bool brand = false;
//   bool product = false;
//   String mainCategoryId = '0';
//   String subCategoryId = '0';
//   String selectBrandId = '0';
//   String selectProductId = '0';
//   int selectProductCount = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BaseView<WriteCommentViewodel>(
//       onModelReady: (model) {
//         model.setContext(context);
//         _homeViewModel = model;
//         widget.writeCommentViewodel = model;
//       },
//       builder: (context, model, child) => Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               ClipPath(
//                 clipper: MyClip(),
//                 child: Container(
//                   height: 80.0,
//                   color: mainColor,
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[SizedBox(height: 10.0)],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: UIHelper.dynamicHeight(192),
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: <Widget>[
//                     for (var item in _homeViewModel.writeCommentViewodel.mainCategory!) getMainCategoryImage(item),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(5.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       '',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.blueGrey),
//                     ),
//                   ],
//                 ),
//               ),
//               Visibility(
//                 child: Container(
//                   height: UIHelper.dynamicHeight(100),
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: <Widget>[
//                       for (var item in _homeViewModel.homeData.subcategory!.where((element) => element.mainCategory == mainCategoryId))
//                         getsubCategory(item),
//                     ],
//                   ),
//                 ),
//                 visible: subcategory,
//                 maintainSize: true,
//                 maintainAnimation: true,
//                 maintainState: true,
//               ),
//               Visibility(
//                 child: Container(
//                   height: UIHelper.dynamicHeight(100),
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: <Widget>[
//                       for (var item in _homeViewModel.homeData.brand!.where((element) => element.subCategory == subCategoryId)) getBrand(item),
//                     ],
//                   ),
//                 ),
//                 visible: brand,
//                 maintainSize: true,
//                 maintainAnimation: true,
//                 maintainState: true,
//               ),
//               Visibility(
//                 child: Container(
//                   height: UIHelper.dynamicHeight(400),
//                   child: ListView(
//                     scrollDirection: Axis.vertical,
//                     children: <Widget>[
//                       if (product)
//                         for (var i = 0; i < 1; i++)
//                           getProduct(
//                               _homeViewModel.homeData.product!.where((element) => element.brand == selectBrandId).toList()[i],
//                               _homeViewModel.homeData.product!.where((element) => element.brand == selectBrandId).toList()[i + 1],
//                               _homeViewModel.homeData.product!.where((element) => element.brand == selectBrandId).toList()[i + 2])
//                     ],
//                   ),
//                 ),
//                 visible: product,
//                 maintainSize: true,
//                 maintainAnimation: true,
//                 maintainState: true,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   InkWell getMainCategoryImage(MainCategory mainCategory) {
//     return InkWell(
//         onTap: () {
//           setState(() {
//             subcategory = true;
//             brand = false;
//             product = false;
//             mainCategoryId = mainCategory.id!;
//             subCategoryId = '0';
//             selectBrandId = '0';
//             selectProductId = '0';
//           });
//         },
//         child: Container(
//           margin: EdgeInsets.all(2.0),
//           width: UIHelper.dynamicHeight(192),
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(baseUrl + 'UploadFile/' + mainCategory.bannerImageUrl! + '.jpg'),
//                 fit: BoxFit.cover,
//               ),
//               border: Border.all(
//                 color: mainColor,
//                 width: 1,
//               ),
//               // borderRadius: BorderRadius.circular(12),
//               borderRadius: BorderRadius.circular(12.0)),
//         ));
//   }

//   InkWell getsubCategory(SubCategory subCategory) {
//     return InkWell(
//         onTap: () {
//           setState(() {
//             brand = true;
//             subCategoryId = subCategory.id!;
//             product = false;
//             selectProductId = '0';
//           });
//         },
//         child: Container(
//           child: Text(
//             subCategory.subCategoryName!,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: mainColor),
//           ),
//           margin: EdgeInsets.all(10.0),
//         ));
//   }

//   InkWell getBrand(Brand brand) {
//     return InkWell(
//         onTap: () {
//           product = true;
//           setState(() {
//             product = true;
//             selectBrandId = brand.id!;

//             var totalcount = _homeViewModel.homeData.product!.where((element) => element.brand == selectBrandId).length;

//             if (totalcount % 3 == 0) {
//               selectProductCount = totalcount ~/ 3;
//             } else {
//               selectProductCount = (totalcount ~/ 3) + 1;
//             }
//           });
//         },
//         child: Container(
//           child: Text(
//             brand.brandName!,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: mainColor),
//           ),
//           margin: EdgeInsets.all(10.0),
//         ));
//   }

//   // getProduct(Product product) {
//   //   return InkWell(
//   //       onTap: () {
//   //         setState(() {
//   //           selectProductId = product.id;
//   //         });
//   //       },
//   //       child: Container(
//   //         margin: EdgeInsets.all(2.0),
//   //         width: UIHelper.dynamicHeight(192),
//   //         decoration: BoxDecoration(
//   //             image: DecorationImage(
//   //               image: NetworkImage(
//   //                   baseUrl + 'UploadFile/' + product.bannerImageUrl + '.jpg'),
//   //               fit: BoxFit.cover,
//   //             ),
//   //             border: Border.all(
//   //               color: mainColor,
//   //               width: 1,
//   //             ),
//   //             // borderRadius: BorderRadius.circular(12),
//   //             borderRadius: BorderRadius.circular(12.0)),
//   //       ));
//   // }

//   Widget getProduct(Product product1, Product product2, Product product3) {
//     return Row(
//       children: [
//         Expanded(
//           // flex: 3,
//           child: Container(
//             margin: EdgeInsets.all(2.0),
//             width: UIHelper.dynamicHeight(192),
//             height: UIHelper.dynamicHeight(192),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(baseUrl + 'UploadFile/' + product1.bannerImageUrl! + '.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//                 border: Border.all(
//                   color: mainColor,
//                   width: 1,
//                 ),
//                 // borderRadius: BorderRadius.circular(12),
//                 borderRadius: BorderRadius.circular(12.0)),
//           ),
//         ),
//         Expanded(
//           // flex: 3,
//           child: Container(
//             margin: EdgeInsets.all(2.0),
//             width: UIHelper.dynamicHeight(192),
//             height: UIHelper.dynamicHeight(192),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(baseUrl + 'UploadFile/' + product2.bannerImageUrl! + '.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//                 border: Border.all(
//                   color: mainColor,
//                   width: 1,
//                 ),
//                 // borderRadius: BorderRadius.circular(12),
//                 borderRadius: BorderRadius.circular(12.0)),
//           ),
//         ),
//         Expanded(
//           // flex: 3,
//           child: Container(
//             margin: EdgeInsets.all(2.0),
//             width: UIHelper.dynamicHeight(192),
//             height: UIHelper.dynamicHeight(192),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(baseUrl + 'UploadFile/' + product3.bannerImageUrl! + '.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//                 border: Border.all(
//                   color: mainColor,
//                   width: 1,
//                 ),
//                 // borderRadius: BorderRadius.circular(12),
//                 borderRadius: BorderRadius.circular(12.0)),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MyClip extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height - 50.0);
//     path.quadraticBezierTo(size.width - 70.0, size.height, size.width / 2, size.height - 20);
//     path.quadraticBezierTo(size.width / 3.0, size.height - 32, 0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }

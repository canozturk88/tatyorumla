import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import '../../../core/viewmodels/home_view_model.dart';
import '../../shared/language/language_constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';
import '../baseview.dart';
import '../../widgets/badge_menu.dart';
import '../../widgets/dots_decarator.dart';
import '../../widgets/dots_indicator.dart';
import '../../widgets/header_item_widget.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  HomeViewModel homeViewModel;

  Function goToProductCommentList;
  Function goToProductList;
  Function goToDoComment;

  HomeView({Key key, this.homeViewModel, this.goToProductCommentList, this.goToDoComment, this.goToProductList}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  Future _future;
  HomeViewModel _homeViewModel;
  bool subcategory = false;
  bool brand = false;
  bool product = false;
  String mainCategoryId = '0';
  String subCategoryId = '0';
  String selectBrandId = '0';
  String selectProductId = '0';
  int selectProductCount = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        _homeViewModel = model;
        widget.homeViewModel = model;
        _future = _homeViewModel.getHomeData();
      },
      builder: (context, model, child) {
        return FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              _homeViewModel.setHomeDataShared();
              return _buildMainContent();
            } else if (snapshot.hasError) {
              return Container(
                  color: Colors.white,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.all(UIHelper.dynamicHeight(30)),
                    child: Text(
                      _homeViewModel.translate(context, LanguageConstants.of(context).errorText),
                      style: TextStyle(fontSize: UIHelper.dynamicScaleSp(44)),
                      textAlign: TextAlign.center,
                    ),
                  )));
            } else {
              return _buildMainContent();
            }
          },
        );
      },
    );
  }

  Widget _buildMainContent() {
    return NestedScrollView(
        key: UniqueKey(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: BadgeMenuView(
                onPress: () {
                  _homeViewModel.openLeftDrawer();
                },
              ),
              expandedHeight: UIHelper.dynamicHeight(850),
              floating: true,
              pinned: true,
              centerTitle: true,
              title: Container(
                padding: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  // child: Image.asset(
                  //   'assets/icons/appicon.png',
                  //   scale: 5,
                  // ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(collapseMode: CollapseMode.parallax, background: _buildBannerContent),
            ),
          ];
        },
        body: Container(
            child: ListView.builder(
                padding: EdgeInsets.all(2.0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    width: double.maxFinite,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 10,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await _homeViewModel.gotoProductDetail(_homeViewModel.productComments[index].productName);
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(color: mainColor, fontSize: 15.0, fontWeight: FontWeight.bold),
                                          children: [TextSpan(text: _homeViewModel.productComments[index].productName)]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 10,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(color: mainColor, fontSize: 14.0),
                                        children: [TextSpan(text: _homeViewModel.productComments[index].title)]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                flex: 10,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                        children: [TextSpan(text: _homeViewModel.productComments[index].comment)]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 10,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                  child: InkWell(
                                    onTap: () {
                                      _homeViewModel.gotoCommentatorNavigate(_homeViewModel.productComments[index].customerId);
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(color: mainColor, fontSize: 15.0, fontWeight: FontWeight.bold),
                                          children: [TextSpan(text: _homeViewModel.productComments[index].customerNameSurName)]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                  child: RichText(
                                    text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold), children: [
                                      TextSpan(text: 'FİYAT / PERFORMANS: ' + _homeViewModel.productComments[index].pricePerformance.toString())
                                    ]),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                  child: RatingBar.readOnly(
                                    initialRating: double.parse(_homeViewModel.productComments[index].pricePerformance.toString()),
                                    isHalfAllowed: true,
                                    halfFilledIcon: Icons.star_half,
                                    filledIcon: Icons.star,
                                    emptyIcon: Icons.star_border,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                    child: CircularPercentIndicator(
                                      radius: 40.0,
                                      lineWidth: 4.0,
                                      percent: double.parse(((_homeViewModel.productComments[index].tastePoint / 10) * 2).toString()),
                                      header: Text('Lezzet'),
                                      center: Icon(
                                        Icons.food_bank,
                                        size: 20.0,
                                        color: Colors.blue,
                                      ),
                                      backgroundColor: Colors.grey,
                                      progressColor: Colors.blue,
                                    )),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                                    child: CircularPercentIndicator(
                                      radius: 40.0,
                                      lineWidth: 4.0,
                                      percent: double.parse(((_homeViewModel.productComments[index].pricePoint / 10) * 2).toString()),
                                      header: Text('Fiyat '),
                                      center: Icon(
                                        Icons.money,
                                        size: 20.0,
                                        color: Colors.blue,
                                      ),
                                      backgroundColor: Colors.grey,
                                      progressColor: Colors.blue,
                                    )),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                                  child: CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 4.0,
                                    percent: double.parse(((_homeViewModel.productComments[index].packingPoint / 10) * 2).toString()),
                                    header: Text('Ambalaj'),
                                    center: Icon(
                                      Icons.ac_unit,
                                      size: 20.0,
                                      color: Colors.blue,
                                    ),
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.blue,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                                  child: CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 4.0,
                                    percent: double.parse(((_homeViewModel.productComments[index].accessPoint / 10) * 2).toString()),
                                    header: Text('Erisim'),
                                    center: Icon(
                                      Icons.find_in_page,
                                      size: 20.0,
                                      color: Colors.blue,
                                    ),
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.blue,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 40, 10, 0),
                                  child: InkWell(
                                    onTap: () {
                                      if (SharedManager().custmerDetail != null) {
                                        _homeViewModel.addNewCommentNavigate(_homeViewModel.productComments[index]);
                                      } else {
                                        _homeViewModel.goToLogin();
                                      }
                                    },
                                    child: Text(
                                      'Yorumla',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 14.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }

  Widget get _buildBannerContent {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  PageView.builder(
                      onPageChanged: ((f) {
                        _homeViewModel.changeBanner(f);
                      }),
                      itemCount: _homeViewModel.banners == null ? 0 : _homeViewModel.banners.length,
                      physics: ClampingScrollPhysics(),
                      controller: _homeViewModel.bannerPageController,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return InkWell(
                            onTap: () {
                              _homeViewModel.clickBanner(itemIndex);
                            },
                            child: _buildBannerItem(itemIndex));
                      }),
                  _homeViewModel.banners != null && _homeViewModel.banners.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: UIHelper.dynamicHeight(10)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                DotsIndicator(
                                  dotsCount: _homeViewModel.banners.length,
                                  position: _homeViewModel.currentBannerPosition.toDouble(),
                                  decorator: DotsDecorator(
                                      spacing: EdgeInsets.all((2)),
                                      size: Size(UIHelper.dynamicHeight(16), UIHelper.dynamicHeight(16)),
                                      activeSize: Size(UIHelper.dynamicHeight(24), UIHelper.dynamicHeight(24))),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Container(
              color: mainColor,
              height: UIHelper.dynamicHeight(240),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: HeaderItemWidget(
                      title: 'Yorum Sayısı',
                      bigSubTitle: _homeViewModel.commentCount,
                      smallSubTitle: '',
                    ),
                  ),
                  Expanded(
                    child: HeaderItemWidget(
                      title: 'Ürün Sayısı',
                      bigSubTitle: _homeViewModel.commentCount,
                      smallSubTitle: '',
                    ),
                  ),
                  Expanded(
                    child: HeaderItemWidget(
                      title: 'Fotoğraf Sayısı',
                      bigSubTitle: _homeViewModel.commentCount,
                      smallSubTitle: '',
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildBannerItem(int itemIndex) {
    return Hero(
      tag: _homeViewModel.banners[itemIndex].id,
      child: Container(
        padding: EdgeInsets.only(left: UIHelper.dynamicHeight(45), bottom: UIHelper.dynamicHeight(30)),
        decoration: BoxDecoration(
          image: DecorationImage(
            //image: Image.network(_homeViewModel.banners[itemIndex].bannerImageUrl ?? "").image,
            image: CachedNetworkImageProvider(_homeViewModel.banners[itemIndex].bannerImageUrl ?? ''),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: UIHelper.dynamicHeight(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_homeViewModel.banners[itemIndex].title ?? '',
                  style: TextStyle(
                    color: white,
                    decoration: TextDecoration.none,
                    fontSize: UIHelper.dynamicHeight(55),
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  // InkWell getMainCategoryImage(MainCategory mainCategory) {
  //   return InkWell(
  //       onTap: () {
  //         setState(() {
  //           subcategory = true;
  //           brand = false;
  //           product = false;
  //           mainCategoryId = mainCategory.id;
  //           subCategoryId = '0';
  //           selectBrandId = '0';
  //           selectProductId = '0';
  //         });
  //       },
  //       child: Container(
  //         margin: EdgeInsets.all(2.0),
  //         width: UIHelper.dynamicHeight(192),
  //         decoration: BoxDecoration(
  //             image: DecorationImage(
  //               image: NetworkImage('https://api.bildireyimbunu.com/UploadFile/' + mainCategory.bannerImageUrl + '.jpg'),
  //               fit: BoxFit.cover,
  //             ),
  //             border: Border.all(
  //               color: mainColor,
  //               width: 1,
  //             ),
  //             // borderRadius: BorderRadius.circular(12),
  //             borderRadius: BorderRadius.circular(12.0)),
  //       ));
  // }

  // InkWell getsubCategory(SubCategory subCategory) {
  //   return InkWell(
  //       onTap: () {
  //         setState(() {
  //           brand = true;
  //           subCategoryId = subCategory.id;
  //           product = false;
  //           selectProductId = '0';
  //         });
  //       },
  //       child: Container(
  //         child: Text(
  //           subCategory.subCategoryName,
  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: mainColor),
  //         ),
  //         margin: EdgeInsets.all(10.0),
  //       ));
  // }

  // InkWell getBrand(Brand brand) {
  //   return InkWell(
  //       onTap: () {
  //         // product = true;
  //         setState(() {
  //           product = true;
  //           selectBrandId = brand.id;
  //         });
  //       },
  //       child: Container(
  //         child: Text(
  //           brand.brandName,
  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: mainColor),
  //         ),
  //         margin: EdgeInsets.all(10.0),
  //       ));
  // }

}

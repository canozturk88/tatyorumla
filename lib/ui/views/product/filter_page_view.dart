import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:tadayim_bunu/core/models/home/product.dart';
import 'package:tadayim_bunu/core/viewmodels/filter_page_view_model.dart';
import '../../../core/models/home/brand.dart';
import '../../../core/models/home/main_category.dart';
import '../../../core/models/home/sub_category.dart';
import '../../shared/language/language_constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';
import '../baseview.dart';
import '../../widgets/dots_decarator.dart';
import '../../widgets/dots_indicator.dart';
import '../../widgets/header_item_widget.dart';
import '../custom_button.dart';

// ignore: must_be_immutable
class FilterPageView extends StatefulWidget {
  // FilterPageViewModel homeViewModel;

  Function goToProductCommentList;
  Function goToProductList;
  Function goToDoComment;

  FilterPageView();

  @override
  _FilterPageViewState createState() => _FilterPageViewState();
}

class _FilterPageViewState extends State<FilterPageView> {
  Future _future;
  FilterPageViewModel filterPageViewModel;
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
    return BaseView<FilterPageViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        filterPageViewModel = model;
        //  widget.homeViewModel = model;
        _future = filterPageViewModel.getHomeData();
      },
      builder: (context, model, child) {
        return FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              filterPageViewModel.setHomeDataShared();
              return _buildMainContent();
            } else if (snapshot.hasError) {
              return Container(
                  color: Colors.white,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.all(UIHelper.dynamicHeight(30)),
                    child: Text(
                      filterPageViewModel.translate(context, LanguageConstants.of(context).errorText),
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Container(
                height: UIHelper.dynamicHeight(192),
                padding: EdgeInsets.only(left: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (var item in filterPageViewModel.homeData.mainCategory) getMainCategoryImage(item),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Visibility(
                child: Container(
                  height: UIHelper.dynamicHeight(100),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      for (var item in filterPageViewModel.homeData.subcategory.where((element) => element.mainCategory == mainCategoryId))
                        getsubCategory(item),
                    ],
                  ),
                ),
                visible: subcategory,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
              ),
              Visibility(
                child: Container(
                  height: UIHelper.dynamicHeight(100),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      for (var item in filterPageViewModel.homeData.brand.where((element) => element.subCategory == subCategoryId)) getBrand(item),
                    ],
                  ),
                ),
                visible: brand,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
              ),
              Visibility(
                child: Container(
                  height: UIHelper.dynamicHeight(1200),
                  child: GridView.builder(
                      padding: const EdgeInsets.all(10.0),
                      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      //     maxCrossAxisExtent: 200, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: filterPageViewModel.homeData.product.where((element) => element.brand == selectBrandId).toList().length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GridTile(
                              header: Container(
                                color: Colors.black45,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                    filterPageViewModel.homeData.product
                                        .where((element) => element.brand == selectBrandId)
                                        .toList()[index]
                                        .productName,
                                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  //  Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id,);
                                },
                                child: Hero(
                                  tag: product,
                                  child: FadeInImage(
                                    placeholder: AssetImage('https://api.bildireyimbunu.com/UploadFile/' +
                                        filterPageViewModel.homeData.product
                                            .where((element) => element.brand == selectBrandId)
                                            .toList()[index]
                                            .bannerImageUrl +
                                        '.jpg'),
                                    image: NetworkImage('https://api.bildireyimbunu.com/UploadFile/' +
                                        filterPageViewModel.homeData.product
                                            .where((element) => element.brand == selectBrandId)
                                            .toList()[index]
                                            .bannerImageUrl +
                                        '.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              footer: Container(
                                padding: EdgeInsets.only(left: UIHelper.dynamicHeight(45), bottom: UIHelper.dynamicHeight(20)),
                                color: Colors.purple,
                                child: Column(children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          filterPageViewModel.homeData.product
                                                  .where((element) => element.brand == selectBrandId)
                                                  .toList()[index]
                                                  .commentCount
                                                  .toString() +
                                              ' Yorum',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
                                          child: RatingBar.readOnly(
                                            initialRating: double.parse(filterPageViewModel.homeData.product
                                                .where((element) => element.brand == selectBrandId)
                                                .toList()[index]
                                                .pricePerformance),
                                            isHalfAllowed: true,
                                            halfFilledIcon: Icons.star_half,
                                            filledIcon: Icons.star,
                                            emptyIcon: Icons.star_border,
                                            size: 14,
                                            filledColor: Colors.yellow.shade900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 10,
                                          child: _commentButton(filterPageViewModel.homeData.product
                                              .where((element) => element.brand == selectBrandId)
                                              .toList()[index])),
                                    ],
                                  )
                                ]),
                              )),
                        );
                      }),
                ),
                visible: product,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
              ),
            ],
          ),
        ));
  }

  Widget _commentButton(Product product) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: InkWell(
          borderRadius: loginButtonBorderStyle,
          onTap: () {
            // if (formKey.currentState.validate()) {
            //   formKey.currentState.save();
            filterPageViewModel.gotoCommentPage(product);
            // }
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.purple, borderRadius: loginButtonBorderStyle),
            height: UIHelper.dynamicHeight(100),
            width: UIHelper.dynamicWidth(500),
            child: Center(
              child: Text(
                'Yorumla',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: UIHelper.dynamicSp(40),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
                        filterPageViewModel.changeBanner(f);
                      }),
                      itemCount: filterPageViewModel.banners == null ? 0 : filterPageViewModel.banners.length,
                      physics: ClampingScrollPhysics(),
                      controller: filterPageViewModel.bannerPageController,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return InkWell(
                            onTap: () {
                              filterPageViewModel.clickBanner(itemIndex);
                            },
                            child: _buildBannerItem(itemIndex));
                      }),
                  filterPageViewModel.banners != null && filterPageViewModel.banners.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: UIHelper.dynamicHeight(10)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                DotsIndicator(
                                  dotsCount: filterPageViewModel.banners.length,
                                  position: filterPageViewModel.currentBannerPosition.toDouble(),
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
                      bigSubTitle: filterPageViewModel.commentCount,
                      smallSubTitle: '',
                    ),
                  ),
                  Expanded(
                    child: HeaderItemWidget(
                      title: 'Ürün Sayısı',
                      bigSubTitle: filterPageViewModel.commentCount,
                      smallSubTitle: '',
                    ),
                  ),
                  Expanded(
                    child: HeaderItemWidget(
                      title: 'Fotoğraf Sayısı',
                      bigSubTitle: filterPageViewModel.commentCount,
                      smallSubTitle: '',
                    ),
                  ),
                ],
              ),
            ),
            //_buildHeaderContainer,
          ],
        )
      ],
    );
  }

  Widget _buildBannerItem(int itemIndex) {
    return Hero(
      tag: filterPageViewModel.banners[itemIndex].id,
      child: Container(
        //color: Colors.red,
        padding: EdgeInsets.only(left: UIHelper.dynamicHeight(45), bottom: UIHelper.dynamicHeight(30)),
        decoration: BoxDecoration(
          image: DecorationImage(
            //image: Image.network(filterPageViewModel.banners[itemIndex].bannerImageUrl ?? "").image,
            image: CachedNetworkImageProvider(filterPageViewModel.banners[itemIndex].bannerImageUrl ?? ''),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: UIHelper.dynamicHeight(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(filterPageViewModel.banners[itemIndex].title ?? '',
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

  InkWell getMainCategoryImage(MainCategory mainCategory) {
    return InkWell(
        onTap: () {
          setState(() {
            subcategory = true;
            brand = false;
            product = false;
            mainCategoryId = mainCategory.id;
            subCategoryId = '0';
            selectBrandId = '0';
            selectProductId = '0';
          });
        },
        child: Container(
          margin: EdgeInsets.all(2.0),
          width: UIHelper.dynamicHeight(192),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://api.bildireyimbunu.com/UploadFile/' + mainCategory.bannerImageUrl + '.jpg'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: mainColor,
                width: 1,
              ),
              // borderRadius: BorderRadius.circular(12),
              borderRadius: BorderRadius.circular(12.0)),
        ));
  }

  InkWell getsubCategory(SubCategory subCategory) {
    return InkWell(
        onTap: () {
          setState(() {
            brand = true;
            subCategoryId = subCategory.id;
            product = false;
            selectProductId = '0';
          });
        },
        child: Container(
          child: Text(
            subCategory.subCategoryName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: mainColor),
          ),
          margin: EdgeInsets.all(10.0),
        ));
  }

  InkWell getBrand(Brand brand) {
    return InkWell(
        onTap: () {
          // product = true;
          setState(() {
            product = true;
            selectBrandId = brand.id;
          });
        },
        child: Container(
          child: Text(
            brand.brandName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: mainColor),
          ),
          margin: EdgeInsets.all(10.0),
        ));
  }
}

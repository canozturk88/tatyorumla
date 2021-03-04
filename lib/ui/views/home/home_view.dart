import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/models/home/brand.dart';
import '../../../core/models/home/main_category.dart';
import '../../../core/models/home/product.dart';
import '../../../core/models/home/sub_category.dart';
import '../../../core/services/shared_prefernces_api.dart';
import '../../../core/viewmodels/home_view_model.dart';
import '../../../main.dart';
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

  Function goToNoticeList;
  Function goToMapNoticeView;
  Function goToDoNotice;

  HomeView({Key key, this.homeViewModel, this.goToNoticeList, this.goToMapNoticeView, this.goToDoNotice}) : super(key: key);

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
                  child: Image.asset(
                    'assets/icons/appicon.png',
                    scale: 5,
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(collapseMode: CollapseMode.parallax, background: _buildBannerContent),
            ),
          ];
        },
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
                    for (var item in _homeViewModel.homeData.mainCategory) getMainCategoryImage(item),
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
                      for (var item in _homeViewModel.homeData.subcategory.where((element) => element.mainCategoryId == mainCategoryId))
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
                      for (var item in _homeViewModel.homeData.brand.where((element) => element.subCategoryId == subCategoryId)) getBrand(item),
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
                  height: UIHelper.dynamicHeight(400),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      if (product)
                        for (var i = 0; i < 1; i++)
                          getProduct(
                              _homeViewModel.homeData.product.where((element) => element.brandId == selectBrandId).toList()[i],
                              _homeViewModel.homeData.product.where((element) => element.brandId == selectBrandId).toList()[i + 1],
                              _homeViewModel.homeData.product.where((element) => element.brandId == selectBrandId).toList()[i + 2])
                    ],
                  ),
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
            //_buildHeaderContainer,
          ],
        )
      ],
    );
  }

  void getLocationData() {
    if (SharedManager().custmerDetail == null) {
      _getCurrentLocation;
    }
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

  Widget getProduct(Product product1, Product product2, Product product3) {
    return Row(
      children: [
        Expanded(
          // flex: 3,
          child: Container(
            margin: EdgeInsets.all(2.0),
            width: UIHelper.dynamicHeight(192),
            height: UIHelper.dynamicHeight(192),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(baseUrl + 'UploadFile/' + product1.bannerImageUrl + '.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: mainColor,
                  width: 1,
                ),
                // borderRadius: BorderRadius.circular(12),
                borderRadius: BorderRadius.circular(12.0)),
          ),
        ),
        Expanded(
          // flex: 3,
          child: Container(
            margin: EdgeInsets.all(2.0),
            width: UIHelper.dynamicHeight(192),
            height: UIHelper.dynamicHeight(192),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(baseUrl + 'UploadFile/' + product2.bannerImageUrl + '.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: mainColor,
                  width: 1,
                ),
                // borderRadius: BorderRadius.circular(12),
                borderRadius: BorderRadius.circular(12.0)),
          ),
        ),
        Expanded(
          // flex: 3,
          child: Container(
            margin: EdgeInsets.all(2.0),
            width: UIHelper.dynamicHeight(192),
            height: UIHelper.dynamicHeight(192),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(baseUrl + 'UploadFile/' + product3.bannerImageUrl + '.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: mainColor,
                  width: 1,
                ),
                // borderRadius: BorderRadius.circular(12),
                borderRadius: BorderRadius.circular(12.0)),
          ),
        ),
      ],
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
                image: NetworkImage(baseUrl + 'UploadFile/' + mainCategory.bannerImageUrl + '.jpg'),
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
            subCategory.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: mainColor),
          ),
          margin: EdgeInsets.all(10.0),
        ));
  }

  InkWell getBrand(Brand brand) {
    return InkWell(
        onTap: () {
          product = true;
          setState(() {
            product = true;
            selectBrandId = brand.id;

            var totalcount = _homeViewModel.homeData.product.where((element) => element.brandId == selectBrandId).length;

            if (totalcount % 3 == 0) {
              selectProductCount = totalcount ~/ 3;
            } else {
              selectProductCount = (totalcount ~/ 3) + 1;
            }
          });
        },
        child: Container(
          child: Text(
            brand.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: mainColor),
          ),
          margin: EdgeInsets.all(10.0),
        ));
  }

  // ignore: missing_return
  Future<String> get _getCurrentLocation async {
    // Position position = await Geolocator()
    //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(
    //     double.parse(position.latitude.toStringAsFixed(7)),
    //     double.parse(position.longitude.toStringAsFixed(7)));

    // SharedManager().homeLocation.lat = position.latitude;
    // SharedManager().homeLocation.lng = position.longitude;

    // HomeLocationModel aa = new HomeLocationModel();
    // aa.lat = position.latitude;
    // aa.lng = position.longitude;

    // _sharedManager.homeLocation = HomeLocationModel(
    //     lat: position.latitude, lng: position.longitude, city: "");
    // setData(
    //     lat: position.latitude,
    //     lng: position.longitude);

    // Placemark place = placemark[0];
    // controllerCity.text = place.administrativeArea.toString();
    // controllerDisctirct.text = place.subAdministrativeArea.toString();
    // controllerNeighborhood.text = place.subLocality.toString();
    // controllerStreet.text = place.thoroughfare.toString();
    // controllerStreetNo.text = place.subThoroughfare.toString();

    // if (controllerCity.text != "") {
    //   setState(() {
    //     isVisible = true;
    //   });
    // }
    // controllerSubStreet.text = place.thoroughfare.toString();
  }
}

InkWell getItem(img) {
  return InkWell(
      child: Container(
    margin: EdgeInsets.all(2.0),
    width: 150.0,
    decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(baseUrl + 'UploadFile/' + img + '.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0)),
  ));
}

Padding getSmallItem(count, name, flavor) {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Card(
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$name',
                style: TextStyle(fontSize: 20.0, color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text(
                '$flavor',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              )
            ],
          )),
          Column(
            children: <Widget>[
              Icon(
                Icons.upgrade_sharp,
                color: Colors.grey,
              ),
              // Text(
              //   "$time min",
              //   style: TextStyle(
              //       fontSize: 14.0,
              //       color: Colors.grey,
              //       fontWeight: FontWeight.bold),
              // )
            ],
          ),
          SizedBox(width: 20.0),
          ClipPath(
            clipper: MyClip2(),
            child: Container(
              width: 70.0,
              height: 70.0,
              color: Color(0xff1f2226),
              child: Center(
                child: Text(
                  '$count',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 60.0);
    path.quadraticBezierTo(size.width - 70.0, size.height, size.width / 2, size.height - 20);
    path.quadraticBezierTo(size.width / 3.0, size.height - 32, 0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(10, size.height / 2 + 20, 5, size.height / 2);
    path.quadraticBezierTo(0, size.height / 3, 10, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:tadayim_bunu/core/apis/productComment/product_comment_api.dart';
import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment.dart';
import 'package:tadayim_bunu/core/services/navigation_api.dart';
import '../../locator.dart';
import '../../main.dart';
import '../models/banner/banners.dart';
import '../models/home/home_data.dart';
import '../models/home/product.dart';
import '../services/shared_prefernces_api.dart';
import 'package:tadayim_bunu/core/viewmodels/main_view_model.dart';
import 'package:openid_client/openid_client.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

final homeViewProvider = ChangeNotifierProvider((_) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  // final StreamController<List<ProductComment>> _eventData = StreamController<List<ProductComment>>();

  //Sink<List<ProductComment>> get _inEventData => _eventData.sink;
  //StreamSink<List<ProductComment>> get eventStream => _eventData.sink;

  final _todoStateController = StreamController<List<ProductComment>>.broadcast();
  StreamSink<List<ProductComment>> get _inTodoSink => _todoStateController.sink;

  Stream<List<ProductComment>> get streamProductComment => _todoStateController.stream;

  // final _todoEventController = StreamController<ProductComment>();
  // Sink<ProductComment> get todoEventSink => _todoEventController.sink;

  // int currentPosition = 0;
  int bannerListSize = 0;
  SharedManager sharedManager = SharedManager();
  PageController? bannerPageController;
  String? commentCount;
  //HomeRequestModel _homeRequestModel;

  // List<Notice> customerNotice = null;
  //ApiServices apiService;
  int currentBannerPosition = 0;
  TokenResponse? tokenResponse;
  HomeData? homeData;
  List<Banners>? banners;
  List<ProductComment>? productComments;

  bool pointVisibility = false;

  HomeViewModel() {
    bannerPageController = PageController();
    getHomeData();
    _auth();
    //initPlatformState();
    banners = <Banners>[];
    commentCount = '5';
  }
  NavigationService get navigator {
    return locator<NavigationService>();
  }

  void _auth() async {
    // create the client

    var uri = Uri(scheme: 'https', host: 'localhost', port: 8005);

    var issuer = await Issuer.discover(uri);

    var client = Client(
      issuer,
      'flutter',
    );

    // create a function to open a browser with an url
    // ignore: always_declare_return_types
    urlLauncher(String url) async {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }

    // create an authenticator
    var authenticator = Authenticator(client, scopes: ['openid', 'productcommentAPI'], port: 4000, urlLancher: urlLauncher);

    //var authenticator = new Authenticator(client, scopes: ["openid", "ApiOne"], port: 4000);

    // starts the authentication
    var c = await authenticator.authorize();
    tokenResponse = await c.getTokenResponse();
    print(tokenResponse!.accessToken);

    // close the webview when finished
    closeWebView();
  }

  Future<void> initPlatformState() async {
    final connection = HubConnectionBuilder()
        .withUrl(
            'http://localhost:8001/chatHub',
            HttpConnectionOptions(
              client: IOClient(HttpClient()..badCertificateCallback = (x, y, z) => true),
              logging: (level, message) => print(message),
            ))
        .build();

    await connection.start();

    connection.on('ReceiveMessage', (message) {
      var receiveMessage = message![1].toString();

      var comments = List<ProductComment>.from(json.decode(receiveMessage).map((x) => ProductComment.fromJson(x)));
      _inTodoSink.add(comments);
      print(message.toString());
    });

    var productCommentsList = '';
    productComments!.forEach((element) => productCommentsList += element.id.toString() + '-');

    await connection.invoke('AddToProductCommentGroup', args: ['2']);
  }

  // ignore: always_declare_return_types
  clickBanner(int bannerIndex) async {
    var clickedBanner = banners![bannerIndex];
    var _product = Product();
    _product.bannerImageUrl = clickedBanner.bannerImageUrl;
    _product.id = clickedBanner.id;
    _product.productName = clickedBanner.itemTitle;

    //await navigator.navigateTo(Pages.ProductDetail, _product);
    // } else {}
  }

  // ignore: always_declare_return_types
  setHomeDataShared() async {
    // if (sharedManager.homeDatas != null) {
    //   homeData = sharedManager.homeDatas;
    //   // banners = homeData.banners;
    //   // campaigns = homeData.campaigns;
    //   // weatherForecast = homeData.weatherForecast;
    //   // dailyPrices = homeData.dailyPrices;
    // }
  }

  Future openLeftDrawer() async => MainViewModel.openLeftMenu();

  Future<void> updateHomeDataPoint() async => notifyListeners();

  Future gotoCommentatorNavigate(String customerId) async {
    // navigator.navigateToRemove(Pages.Home);
    await navigator.navigateTo(Pages.CommentatorProfile, customerId);
  }

  // ignore: always_declare_return_types
  changeBanner(int currentBanner) async {
    if (currentBanner > 4) {
      currentBannerPosition = 4;
    } else {
      currentBannerPosition = currentBanner;
    }

    notifyListeners();
  }

  Future getHomeData() async {
    try {
      productComments = <ProductComment>[];
      productComments = SharedManager().lastProducCommentResponseModel!.productComments;

      var banner = Banners();
      banner.id = '1';
      banner.bannerImageUrl = 'http://api.bildireyimbunu.com/UploadFile/0114125_ulker-cikolatali-gofret-36-gr_320.jpeg';
      banner.title = 'Ulker Cikolata';
      banner.itemTitle = 'Ulker Cikolata';
      banner.point = '7,8';

      var banner1 = Banners();
      banner1.id = '2';
      banner1.bannerImageUrl = 'http://api.bildireyimbunu.com/UploadFile/2447e24b-68df-436b-aea4-f20e1db3e50f.jpeg';
      banner1.title = 'Ulker Cikolata';
      banner1.itemTitle = 'Ulker Cikolata';
      banner1.point = '7,8';

      var banner11 = Banners();
      banner11.id = '2';
      banner11.bannerImageUrl = 'http://api.bildireyimbunu.com/UploadFile/2447e24b-68df-436b-aea4-f20e1db3e50f.jpeg';
      banner11.title = 'Ulker Cikolata';
      banner11.itemTitle = 'Ulker Cikolata';
      banner11.point = '7,8';

      banners!.add(banner);
      banners!.add(banner1);
      banners!.add(banner11);
      setData();
    } catch (e) {
      setData();
    }
    notifyListeners();
  }

  Future addNewCommentNavigate(ProductComment productComment) async {
    // await navigator.navigateTo(Pages.AddNewComment, productComment);
  }

  Future goToLogin() async {
    //  await navigator.navigateTo(Pages.SignIn);
  }

  Future goToLikeDetail(String id) async {
    await navigator.navigateTo(Pages.likeDetail, id);
  }

  Future likeComment(ProductComment productComment) async {
    if (productComment.isLike) {
      final connection = HubConnectionBuilder()
          .withUrl(
              'http://localhost:8001/chatHub',
              HttpConnectionOptions(
                client: IOClient(HttpClient()..badCertificateCallback = (x, y, z) => true),
                logging: (level, message) => print(message),
              ))
          .build();

      await connection.start();
      await connection.invoke('UnlikeComment', args: ['2', productComment.id]);
    } else {
      final connection = HubConnectionBuilder()
          .withUrl(
              'http://localhost:8001/chatHub',
              HttpConnectionOptions(
                client: IOClient(HttpClient()..badCertificateCallback = (x, y, z) => true),
                logging: (level, message) => print(message),
              ))
          .build();
      await connection.start();
      await connection.invoke('likeComment', args: ['2', 'can ozturk', 'cabbuli', 'canozturkImage', productComment.id]);
    }
  }

  // ignore: always_declare_return_types
  setData() async {
    homeData = HomeData();
    homeData!.banners = banners;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

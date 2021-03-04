import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../enums/page_named.dart';
import '../models/comment/product_comment.dart';
import '../models/home/product.dart';
import '../services/shared_prefernces_api.dart';
import 'base_model.dart';
import '../../ui/shared/view_helper/ui_helper.dart';

class ProductDetailViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  final ScrollController scrollController = ScrollController();

  bool appBarTransparent = true;

  double backAppBarHeight = UIHelper.dynamicHeight(900);
  double backAppBarHeightConst = UIHelper.dynamicHeight(900);

  double frontAppBarHeight = UIHelper.dynamicHeight(500);

  SharedManager _sharedManager;

  Product selectProdcut = Product();
  List<ProductComment> productComments;

  ProductDetailViewModel() {
    _sharedManager = SharedManager();
    getProductComment();
  }

  void getProductComment() {
    productComments = <ProductComment>[];
    var productComment = ProductComment();
    productComment.id = '1';
    productComment.detail = 'Her gun yemek istedigim bir tat';
    productComment.title = 'Harika Bir LEzzet';
    productComments.add(productComment);

    var productComment1 = ProductComment();
    productComment1.id = '1';
    productComment1.detail = 'Her gun yemek istedigim bir tat';
    productComment1.title = 'Harika Bir LEzzet';
    productComments.add(productComment1);

    var productComment2 = ProductComment();
    productComment2.id = '1';
    productComment2.detail = 'Her gun yemek istedigim bir tat';
    productComment2.title = 'Harika Bir LEzzet';
    productComments.add(productComment2);

    // ProductComment productComment3 = new ProductComment();
    // productComment3.id = '1';
    // productComment3.detail = 'Her gun yemek istedigim bir tat';
    // productComment3.title = 'Harika Bir LEzzet';
    // productComments.add(productComment3);

    // ProductComment productComment4 = new ProductComment();
    // productComment4.id = '1';
    // productComment4.detail = 'Her gun yemek istedigim bir tat';
    // productComment4.title = 'Harika Bir LEzzet';
    // productComments.add(productComment4);

    // ProductComment productComment5 = new ProductComment();
    // productComment5.id = '1';
    // productComment5.detail = 'Her gun yemek istedigim bir tat';
    // productComment5.title = 'Harika Bir LEzzet';
    // productComments.add(productComment5);

    // ProductComment productComment6 = new ProductComment();
    // productComment6.id = '1';
    // productComment6.detail = 'Her gun yemek istedigim bir tat';
    // productComment6.title = 'Harika Bir LEzzet';
    // productComments.add(productComment6);

    // ProductComment productComment7 = new ProductComment();
    // productComment7.id = '1';
    // productComment7.detail = 'Her gun yemek istedigim bir tat';
    // productComment7.title = 'Harika Bir LEzzet';
    // productComments.add(productComment7);

    // ProductComment productComment8 = new ProductComment();
    // productComment8.id = '1';
    // productComment8.detail = 'Her gun yemek istedigim bir tat';
    // productComment8.title = 'Harika Bir LEzzet';
    // productComments.add(productComment8);

    // if (SharedManager().openNotice != null) {
    //   noticies = SharedManager().openNotice;
    // } else {
    //   NoticeApiServices.instance.getAllNoticeNoPage().then((response) {
    //     //    setState(() {
    //     if (response.statusCode == 200) {
    //       Map<String, dynamic> map = jsonDecode(response.body);
    //       var responseNotice = ResponseNotice.fromJson(map);
    //       SharedManager().openNotice = responseNotice.notices;
    //       noticies = responseNotice.notices;
    //     }
    //   });
    // }
  }

  // ignore: always_declare_return_types
  getCode() async {
    if (_sharedManager.token != null) {
      notifyListeners();
    } else {
      await navigator.navigateTo(Pages.Login);
    }
  }

  @override
  void setContext(BuildContext context) {
    _context = context;

    selectProdcut = ModalRoute.of(context).settings.arguments;
    logEvent();
    scrollController.addListener(() {
      if (scrollController.hasClients && scrollController.offset > (frontAppBarHeight - 1)) {
        appBarTransparent = false;
      } else {
        appBarTransparent = true;
      }
      notifyListeners();
    });
  }

  // ignore: always_declare_return_types
  logEvent() async {
    //  await CoreHelper.analyticsNewsEventLog(screen: AnalyticsConstants.ANALYTICS_PARAMETER_NEWS_DETAIL_NAME, parameters: selectedNews.title);
  }
}

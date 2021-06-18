import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tadayim_bunu/core/apis/catalog/catalog_api.dart';
import 'package:tadayim_bunu/core/apis/productComment/product_comment_api.dart';
import 'package:tadayim_bunu/core/enums/viewstate.dart';
import '../enums/page_named.dart';
import '../models/comment/product_comment.dart';
import '../models/home/product.dart';
import 'base_model.dart';
import '../../ui/shared/view_helper/ui_helper.dart';

class ProductDetailViewModel extends BaseModel {
  late BuildContext _context;

  BuildContext get context => _context;

  final ScrollController scrollController = ScrollController();

  bool appBarTransparent = true;

  double backAppBarHeight = UIHelper.dynamicHeight(900);
  double backAppBarHeightConst = UIHelper.dynamicHeight(900);

  double frontAppBarHeight = UIHelper.dynamicHeight(500);

  Product? selectProdcuct = Product();
  List<ProductComment>? productComments;

  ProductDetailViewModel() {
    // getProductComment();
  }

  Future<void> getProduct(String productName) async {
    setState(ViewState.Busy);

    await CatalogApiServices.getProductByName(productName).then((response) {
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        selectProdcuct = Product.fromJson(map);
      }
    });

    await ProductCommentApiServices.getProductCommentsByProductName(productName).then((response) {
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        var responseProductComment = ProductCommentResponseModel.fromJson(map);
        productComments = responseProductComment.productComments!;
      }
    });
    setState(ViewState.Idle);
  }

  Future addNewCommentNavigate(String productId, String productName) async {
    var product = Product();
    product.id = productId;
    product.productName = productName;
    await navigator.navigateTo(Pages.AddNewComment, product);
  }

  @override
  void setContext(BuildContext context) {
    _context = context;

//can
    //selectProdcuct = ModalRoute.of(context).settings.arguments;
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

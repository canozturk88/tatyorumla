import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment.dart';
import 'package:tadayim_bunu/core/models/home/product.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'base_model.dart';
import 'main_view_model.dart';
import 'package:flutter/material.dart';

class ProductCommentViewModel extends BaseModel {
  final noticeScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: '_productCommentViewModel');

  BuildContext _context;

  BuildContext get context => _context;

  List<ProductComment> productComments;

  ProductCommentViewModel() {
    getProductComment(0);
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  Future addNewCommentNavigate(ProductComment productComment) async {
    await navigator.navigateTo(Pages.AddNewComment, productComment);
  }

  Future gotoCommentatorNavigate(String customerId) async {
    await navigator.navigateTo(Pages.CommentatorProfile, customerId);
  }

  void getProductComment(int page) {
    productComments = <ProductComment>[];
    productComments = SharedManager().lastProducCommentResponseModel.productComments;
  }

  // ignore: always_declare_return_types
  openLeftDrawer() {
    MainViewModel.openLeftMenu();
  }

  void gotoEditNotice(ProductComment notice) async {
    //  await navigator.navigateTo(Pages.NoticeDetail, notice);
    //  await Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeDetail(notice)));
  }

  Future gotoProductDetail(Product product) async => await navigator.navigateTo(Pages.ProductDetail, product);
}

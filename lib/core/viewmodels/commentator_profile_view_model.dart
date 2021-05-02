import 'package:flutter/material.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';

import 'base_model.dart';

class CommentatorProfileViewModel extends BaseModel {
  final commentatorProfileViewModelScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: '_commentatorProfileViewModelScaffoldKey');

  BuildContext _context;

  BuildContext get context => _context;

  List<ProductComment> productComments;

  CommentatorProfileViewModel() {
    getProductComment(0);
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  void getProductComment(int page) {
    productComments = <ProductComment>[];
    productComments = SharedManager().lastProducCommentResponseModel.productComments;
  }
}

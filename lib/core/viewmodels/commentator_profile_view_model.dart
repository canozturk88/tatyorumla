import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment.dart';

final commentatorProfileViewProvider = ChangeNotifierProvider((_) => CommentatorProfileViewModel());

class CommentatorProfileViewModel extends ChangeNotifier {
  List<ProductComment>? productComments;

  CommentatorProfileViewModel() {
    // getProductComment(0);
  }

  void getProductComment(int page) {
    productComments = <ProductComment>[];
  }
}

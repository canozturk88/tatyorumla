import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadayim_bunu/core/apis/like/like_api_services.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment_like.dart';

final commetLikeViewViewModelProvider = ChangeNotifierProvider((_) => CommetLikeViewViewModel());

class CommetLikeViewViewModel extends ChangeNotifier {
  List<ProductCommentLike>? productCommentLikes;

  final _todoStateController = StreamController<List<ProductCommentLike>>.broadcast();
  StreamSink<List<ProductCommentLike>> get _inTodoSink => _todoStateController.sink;

  Stream<List<ProductCommentLike>> get streamProductComment => _todoStateController.stream;

  CommetLikeViewViewModel() {
    getproductLikes('60a628e04d6dbeae23bf82fe');
  }

  Future<void> getproductLikes(String productCommentId) async {
    productCommentLikes = <ProductCommentLike>[];

    await LikeApiServices.getProductCommentLikes(productCommentId).then((response) {
      if (response.statusCode == 200) {
        productCommentLikes = List<ProductCommentLike>.from(json.decode(response.body).map((x) => ProductCommentLike.fromJson(x)));
        _inTodoSink.add(productCommentLikes!);
      }
    });
  }
}

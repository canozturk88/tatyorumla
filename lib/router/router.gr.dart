// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../ui/views/home/home_view.dart' as _i5;
import '../ui/views/like/commend_like_view.dart' as _i4;
import '../ui/views/main_view.dart' as _i3;
import '../ui/views/product/product_search_view.dart' as _i6;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MainRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.MainPage();
        }),
    CommentLikeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<CommentLikeRouteArgs>(
              orElse: () => CommentLikeRouteArgs(
                  productCommentId: pathParams.getString('productCommentId')));
          return _i4.CommentLikePage(productCommentId: args.productCommentId);
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.HomePage();
        }),
    ProductSearchRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.ProductSearchPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MainRoute.name, path: '/', children: [
          _i1.RouteConfig(HomeRoute.name, path: ''),
          _i1.RouteConfig(ProductSearchRoute.name, path: '')
        ]),
        _i1.RouteConfig(CommentLikeRoute.name, path: ':productCommentId')
      ];
}

class MainRoute extends _i1.PageRouteInfo {
  const MainRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

class CommentLikeRoute extends _i1.PageRouteInfo<CommentLikeRouteArgs> {
  CommentLikeRoute({required String productCommentId})
      : super(name,
            path: ':productCommentId',
            args: CommentLikeRouteArgs(productCommentId: productCommentId),
            rawPathParams: {'productCommentId': productCommentId});

  static const String name = 'CommentLikeRoute';
}

class CommentLikeRouteArgs {
  const CommentLikeRouteArgs({required this.productCommentId});

  final String productCommentId;
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '');

  static const String name = 'HomeRoute';
}

class ProductSearchRoute extends _i1.PageRouteInfo {
  const ProductSearchRoute() : super(name, path: '');

  static const String name = 'ProductSearchRoute';
}

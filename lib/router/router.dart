import 'package:auto_route/auto_route.dart';

import 'package:tadayim_bunu/ui/views/home/home_view.dart';
import 'package:tadayim_bunu/ui/views/like/commend_like_view.dart';
import 'package:tadayim_bunu/ui/views/main_view.dart';
import 'package:tadayim_bunu/ui/views/product/product_search_view.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: MainPage,
      initial: true,
      children: [
        AutoRoute(path: '', page: HomePage),
        AutoRoute(path: '', page: ProductSearchPage),
        // our BooksRouter has been moved into the children field
      ],
    ),
    AutoRoute(
      path: ":productCommentId",
      page: CommentLikePage,
    ),
    // AutoRoute(path: '/commentLikePage/:productCommentId', page: CommentLikePage),
    //AutoRoute(path: 'productSearchPage', page: ProductSearchPage),
    //  AutoRoute(path: 'homePage', page: HomePage),
  ],
)
class $AppRouter {}

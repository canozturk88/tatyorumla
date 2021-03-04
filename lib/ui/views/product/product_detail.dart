import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/models/comment/product_comment.dart';
import '../../../core/viewmodels/product_detail_view_model.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';
import '../baseview.dart';

class ProductDetailView extends StatefulWidget {
  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  ProductDetailViewModel _newsDetailViewModel;

  List<ProductComment> productComment;

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        _newsDetailViewModel = model;
      },
      builder: (context, model, child) {
        return Scaffold(
          body: _buildMainContent(),
        );

        //_oldBuildStack();
      },
    );
  }

  Widget _buildMainContent() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: UIHelper.dynamicHeight(500),
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
      body: mainContent(),
    );
  }

  Widget get _buildBannerContent {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.black.withOpacity(0.1), Color(0xFF00000)],
              stops: [0, 1],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: _newsDetailViewModel.selectProdcut.id,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(_newsDetailViewModel.selectProdcut.bannerImageUrl ?? ''),
                        //image: Image.network(_newsDetailViewModel.selectedNews.bannerImageUrl ?? "").image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                _newsDetailViewModel.selectProdcut.title ?? '',
                style: TextStyle(fontSize: UIHelper.dynamicHeight(48), fontWeight: FontWeight.bold),
              ),
              Text(
                _newsDetailViewModel.selectProdcut.point ?? '',
                style: TextStyle(fontSize: UIHelper.dynamicHeight(48), fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: UIHelper.dynamicHeight(48),
              ),
            ],
          ),
        )
      ],
    );
  }

  // Stack _oldBuildStack() {
  //   return Stack(
  //     children: <Widget>[
  //       Hero(
  //         tag: _newsDetailViewModel.selectProdcut.id,
  //         child: AnimatedContainer(
  //           duration: Duration(milliseconds: 100),
  //           height: _newsDetailViewModel.backAppBarHeight,
  //           width: double.infinity,
  //           decoration: BoxDecoration(
  //             image: DecorationImage(
  //               image: NetworkImage(
  //                   _newsDetailViewModel.selectProdcut.bannerImageUrl),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Scaffold(
  //         backgroundColor: _newsDetailViewModel.appBarTransparent
  //             ? Colors.transparent
  //             : Colors.black,
  //         appBar: new AppBar(
  //           title: new Text(""),
  //           backgroundColor: Colors.transparent,
  //           centerTitle: true,
  //           elevation: 0.0,
  //         ),
  //         body: NestedScrollView(
  //             controller: _newsDetailViewModel.scrollController,
  //             headerSliverBuilder:
  //                 (BuildContext context, bool innerBoxIsScrolled) {
  //               return <Widget>[
  //                 SliverAppBar(
  //                   expandedHeight: UIHelper.dynamicHeight(500),
  //                   floating: true,
  //                   pinned: false,
  //                   automaticallyImplyLeading: false,
  //                   backgroundColor: Colors.transparent,
  //                   centerTitle: true,
  //                   flexibleSpace: FlexibleSpaceBar(
  //                     collapseMode: CollapseMode.parallax,
  //                   ),
  //                 ),
  //               ];
  //             },
  //             body: mainContent()),
  //       ),
  //     ],
  //   );
  // }

  Container mainContent() {
    return Container(
      child: Expanded(
          child: ListView.builder(
              itemCount: _newsDetailViewModel.productComments == null ? 0 : _newsDetailViewModel.productComments.length,
              padding: EdgeInsets.all(0.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: double.maxFinite,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: mainColor, fontSize: 14.0, fontWeight: FontWeight.bold),
                                    children: [TextSpan(text: _newsDetailViewModel.productComments[index].title)]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    children: [TextSpan(text: _newsDetailViewModel.productComments[index].detail)]),
                              ),
                            ),
                          ],
                        ),
                      ],
                      //),
                      //    );
                      // }),
                    ),
                  ),
                );
              })),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadayim_bunu/core/core_helper.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment_like.dart';
import 'package:tadayim_bunu/core/viewmodels/commet_like_view_model.dart';
import '../../../core/viewmodels/home_view_model.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';
import '../../widgets/dots_decarator.dart';
import '../../widgets/dots_indicator.dart';
import '../../widgets/header_item_widget.dart';
import '../custom_button.dart';

// ignore: must_be_immutable
class CommentLikePage extends ConsumerWidget {
  final String productCommentId;

  CommentLikePage({@PathParam('productCommentId') required this.productCommentId});
  //CommentLikePage(this.productCommentId);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final commetLikeViewViewModel = watch(commetLikeViewViewModelProvider);

    return FutureBuilder(
      // future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // homeViewModel.setHomeDataShared();
          return _buildMainContent(commetLikeViewViewModel);
        } else if (snapshot.hasError) {
          return Container(
              color: Colors.white,
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(UIHelper.dynamicHeight(30)),
                child: Text(
                  'Hata',
                  style: TextStyle(fontSize: UIHelper.dynamicScaleSp(44)),
                  textAlign: TextAlign.center,
                ),
              )));
        } else {
          return _buildMainContent(commetLikeViewViewModel);
        }
      },
    );
    //   },
    // );
  }

  Widget _buildMainContent(CommetLikeViewViewModel commetLikeViewViewModel) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 5.0,
          title: Center(child: Text('Begenenler', textAlign: TextAlign.center)),
        ),
        backgroundColor: Colors.white,
        body: StreamBuilder(
            stream: commetLikeViewViewModel.streamProductComment,
            builder: (BuildContext context, AsyncSnapshot<List<ProductCommentLike>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  padding: EdgeInsets.all(2.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                      width: double.maxFinite,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 1, 1, 5),
                                            child: CircleAvatar(
                                              radius: 30,
                                              backgroundImage: AssetImage('assets/images/default_user_image.png'),
                                              backgroundColor: Colors.grey,
                                            )),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 1, 1, 5),
                                  child: Column(children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                //   await _homeViewModel.gotoProductDetail(_snapshot.data[index].product);
                                              },
                                              child: RichText(
                                                text: TextSpan(
                                                    style: TextStyle(color: mainColor, fontSize: 15.0, fontWeight: FontWeight.bold),
                                                    children: [TextSpan(text: snapshot.data![index].customerName)]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                            child: RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12.0,
                                                  ),
                                                  children: [TextSpan(text: snapshot.data![index].customerNick)]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Padding(padding: const EdgeInsets.fromLTRB(5, 1, 1, 5), child: followButton),
                              ),
                            ])
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }

  Widget get followButton => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 5.0),
          child: InkWell(
            borderRadius: commentatorProfileBorderStyle,
            onTap: () {
              // if (formKey.currentState!.validate()) {
              //  formKey.currentState!.save();

              // var productComment = ProductComment();
              // productComment.pricePerformance = _pricePerformance.toInt();
              // productComment.tastePoint = _tastePoint.toInt();
              // productComment.pricePoint = _pricePoint.toInt();

              // productComment.packingPoint = _packingPoint.toInt();
              // productComment.accessPoint = _accessPoint.toInt();

              // addCommentViewModel.saveProductComment(productComment);
              //}
            },
            child: Container(
              decoration: BoxDecoration(color: mainColor, borderRadius: commentatorProfileBorderStyle),
              height: UIHelper.dynamicHeight(80),
              width: UIHelper.dynamicWidth(400),
              child: Center(
                child: Text(
                  'Takip Et',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: UIHelper.dynamicSp(30),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildBannerContent(HomeViewModel homeViewModel) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  PageView.builder(
                      onPageChanged: ((f) {
                        homeViewModel.changeBanner(f);
                      }),
                      itemCount: homeViewModel.banners == null ? 0 : homeViewModel.banners!.length,
                      physics: ClampingScrollPhysics(),
                      controller: homeViewModel.bannerPageController,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return InkWell(
                            onTap: () {
                              homeViewModel.clickBanner(itemIndex);
                            },
                            child: _buildBannerItem(itemIndex, homeViewModel));
                      }),
                  homeViewModel.banners != null && homeViewModel.banners!.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: UIHelper.dynamicHeight(30)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                DotsIndicator(
                                  dotsCount: homeViewModel.banners!.length,
                                  position: homeViewModel.currentBannerPosition.toDouble(),
                                  decorator: DotsDecorator(
                                      spacing: EdgeInsets.all((2)),
                                      size: Size(UIHelper.dynamicHeight(16), UIHelper.dynamicHeight(48)),
                                      activeSize: Size(UIHelper.dynamicHeight(48), UIHelper.dynamicHeight(48))),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Container(
              color: mainColor,
              height: UIHelper.dynamicHeight(150),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: HeaderItemWidget(
                      title: 'Yorum Sayısı',
                      bigSubTitle: homeViewModel.commentCount!,
                      smallSubTitle: '',
                    ),
                  ),
                  Expanded(
                    child: HeaderItemWidget(
                      title: 'Ürün Sayısı',
                      bigSubTitle: homeViewModel.commentCount!,
                      smallSubTitle: '',
                    ),
                  ),
                  Expanded(
                    child: HeaderItemWidget(
                      title: 'Fotoğraf Sayısı',
                      bigSubTitle: homeViewModel.commentCount!,
                      smallSubTitle: '',
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _iconLabelButtonLike(ProductComment productComment, BuildContext context) => InkWell(
        child: _iconLabelLike(productComment.likeCount.toString(), productComment.isLike),
        onTap: () {
          context.read(homeViewProvider.notifier).likeComment(productComment);
          // _homeViewModel.gotoSucces(notice);
        },
      );

  // Widget _iconLabelButtonComment(ProductComment productComment) => InkWell(
  //       child: _iconLabelComment(productComment.commentCount.toString(), productComment.accessPoint!),
  //       onTap: () {
  //         // _homeViewModel.gotoSucces(notice);
  //       },
  //     );

  Widget _iconLabelLike(String text, bool status) => Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: 5,
        children: <Widget>[
          Icon(
            Icons.favorite,
            color: CoreHelper.getColor(status),
          ),
          InkWell(
            onTap: () {
              // homeViewModel.gotoCommentatorNavigate(snapshot.data![index].customerId!);
            },
            child: Text(text),
          ),
          SizedBox(
            width: 5,
          )
        ],
      );

  Widget _iconLabelComment(String text, int status) => Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: 5,
        children: <Widget>[
          Icon(
            Icons.comment,
            color: Colors.grey,
            //color: CoreHelper.getColor(status),
          ),
          Text(text),
          SizedBox(
            width: 5,
          )
        ],
      );

  Widget _buildBannerItem(int itemIndex, HomeViewModel homeViewModel) {
    return Hero(
      tag: homeViewModel.banners![itemIndex].id!,
      child: Container(
        padding: EdgeInsets.only(left: UIHelper.dynamicHeight(45), bottom: UIHelper.dynamicHeight(30)),
        decoration: BoxDecoration(
          image: DecorationImage(
            //image: Image.network(_homeViewModel.banners[itemIndex].bannerImageUrl ?? "").image,
            image: CachedNetworkImageProvider(homeViewModel.banners![itemIndex].bannerImageUrl ?? ''),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: UIHelper.dynamicHeight(0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(homeViewModel.banners![itemIndex].title ?? '',
                  style: TextStyle(
                    color: white,
                    decoration: TextDecoration.none,
                    fontSize: UIHelper.dynamicHeight(55),
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

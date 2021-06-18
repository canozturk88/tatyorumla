import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tadayim_bunu/core/core_helper.dart';
import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment.dart';
import 'package:tadayim_bunu/router/router.gr.dart';
import 'package:tadayim_bunu/ui/views/customer/commentator_profile_wiew.dart';
import 'package:tadayim_bunu/ui/views/like/commend_like_view.dart';
import '../../../core/viewmodels/home_view_model.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';
import '../../widgets/badge_menu.dart';
import '../../widgets/dots_decarator.dart';
import '../../widgets/dots_indicator.dart';
import '../../widgets/header_item_widget.dart';

// ignore: must_be_immutable
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  final double _radius = 40.0;
  final double _lineWidth = 5.0;

  //final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final homeViewModel = watch(homeViewProvider);

    return FutureBuilder(
      // future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          homeViewModel.setHomeDataShared();
          return _buildMainContent(homeViewModel);
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
          return _buildMainContent(homeViewModel);
        }
      },
    );
    //   },
    // );
  }

  Widget _buildMainContent(HomeViewModel homeViewModel) {
    return NestedScrollView(
        key: UniqueKey(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: BadgeMenuView(
                onPress: () {
                  homeViewModel.openLeftDrawer();
                },
              ),
              expandedHeight: UIHelper.dynamicHeight(600),
              floating: true,
              pinned: true,
              centerTitle: true,
              title: Container(
                padding: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(collapseMode: CollapseMode.parallax, background: _buildBannerContent(homeViewModel)),
            ),
          ];
        },
        body: StreamBuilder(
            stream: homeViewModel.streamProductComment,
            builder: (BuildContext context, AsyncSnapshot<List<ProductComment>> snapshot) {
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
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 1, 1, 1),
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundImage: AssetImage('assets/images/default_user_image.png'),
                                        backgroundColor: Colors.grey,
                                      )),
                                ),

                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: InkWell(
                                      onTap: () {
                                        context.pushRoute(ProductSearchRoute());
                                        //   homeViewModel.gotoCommentatorNavigate(snapshot.data![index].customerId!);
                                      },
                                      child: RichText(
                                        text: TextSpan(style: TextStyle(color: mainColor, fontSize: 15.0), children: [
                                          TextSpan(style: TextStyle(fontWeight: FontWeight.bold), text: snapshot.data![index].customerNameSurName),
                                          TextSpan(style: TextStyle(color: Colors.grey, fontSize: 12.0), text: ' @'),
                                          TextSpan(
                                              style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
                                              text: snapshot.data![index].customerNameSurName)
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 0, 1, 0),
                                    child: InkWell(
                                      onTap: () {
                                        context.pushRoute(ProductSearchRoute());
                                        // homeViewModel.gotoCommentatorNavigate(snapshot.data![index].customerId!);
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(color: Colors.grey, fontSize: 10.0, fontWeight: FontWeight.bold),
                                            children: [TextSpan(text: CoreHelper.calculatepassedTime(snapshot.data![index].createdDate!))]),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
                                    child: _iconLabelButtonModal(snapshot.data![index], context),
                                  ),
                                ),

                                // Expanded(
                                //   flex: 3,
                                //   child: Padding(
                                //     padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                                //     child: InkWell(
                                //       onTap: () {
                                //         context.pushRoute(ProductSearchRoute());
                                //         // homeViewModel.gotoCommentatorNavigate(snapshot.data![index].customerId!);
                                //       },
                                //       child: RichText(
                                //         text: TextSpan(
                                //             style: TextStyle(color: mainColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                //             children: [TextSpan(text: 'Tekrar Almam')]),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                                    style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                                                    children: [TextSpan(text: snapshot.data![index].productName)]),
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
                                                  children: [TextSpan(text: snapshot.data![index].comment)]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                            child: RichText(
                                              text: TextSpan(
                                                  style: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold),
                                                  children: [
                                                    TextSpan(text: 'FİYAT / PERFORMANS: ' + snapshot.data![index].pricePerformance.toString())
                                                  ]),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Padding(
                                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                              //can

                                              child: RatingBarIndicator(
                                                rating: double.parse(snapshot.data![index].pricePerformance.toString()),
                                                itemBuilder: (context, index) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 18.0,
                                                direction: Axis.horizontal,
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                              padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                              child: CircularPercentIndicator(
                                                radius: _radius,
                                                lineWidth: _lineWidth,
                                                percent: double.parse(((snapshot.data![index].tastePoint! / 10) * 2).toString()),
                                                header: Text('Lezzet'),
                                                center: Icon(
                                                  Icons.food_bank,
                                                  size: 20.0,
                                                  color: Colors.blue,
                                                ),
                                                backgroundColor: Colors.grey,
                                                progressColor: Colors.blue,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                              padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                                              child: CircularPercentIndicator(
                                                radius: _radius,
                                                lineWidth: _lineWidth,
                                                percent: double.parse(((snapshot.data![index].pricePoint! / 10) * 2).toString()),
                                                header: Text('Fiyat '),
                                                center: Icon(
                                                  Icons.money,
                                                  size: 20.0,
                                                  color: Colors.blue,
                                                ),
                                                backgroundColor: Colors.grey,
                                                progressColor: Colors.blue,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                                            child: CircularPercentIndicator(
                                              radius: _radius,
                                              lineWidth: _lineWidth,
                                              percent: double.parse(((snapshot.data![index].packingPoint! / 10) * 2).toString()),
                                              header: Text('Ambalaj'),
                                              center: Icon(
                                                Icons.ac_unit,
                                                size: 20.0,
                                                color: Colors.blue,
                                              ),
                                              backgroundColor: Colors.grey,
                                              progressColor: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                                            child: CircularPercentIndicator(
                                              radius: _radius,
                                              lineWidth: _lineWidth,
                                              percent: double.parse(((snapshot.data![index].accessPoint! / 10) * 2).toString()),
                                              header: Text('Erisim'),
                                              center: Icon(
                                                Icons.find_in_page,
                                                size: 20.0,
                                                color: Colors.blue,
                                              ),
                                              backgroundColor: Colors.grey,
                                              progressColor: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        // Expanded(
                                        //  flex: 2,
                                        // child:
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                            child: _iconLabelButtonLike(snapshot.data![index], context)),
                                        //  ),
                                        // Expanded(
                                        //  flex: 2,
                                        // child:
                                        // Padding(
                                        //   padding: const EdgeInsets.fromLTRB(2, 10, 10, 0),
                                        //   child: RichText(
                                        //     text: TextSpan(
                                        //         style: TextStyle(color: mainColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                        //         children: [TextSpan(text: '3')]),
                                        //   ),
                                        // ),
                                        //  ),
                                        // Expanded(
                                        //  flex: 2,
                                        // child:
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 10, 10, 0), child: _iconLabelButtonComment(snapshot.data![index])),
                                        //  ),
                                        // Expanded(
//flex: 2,
                                        // child:
                                        // Padding(
                                        //   padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                        //   child: RichText(
                                        //     text: TextSpan(
                                        //         style: TextStyle(color: mainColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                        //         children: [TextSpan(text: '3')]),
                                        //   ),
                                        // ),
                                        // ),
                                        // Expanded(
                                        //   flex: 2,
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                        //     child: InkWell(
                                        //       onTap: () {
                                        //         _homeViewModel.addNewCommentNavigate(_snapshot.data[index]);
                                        //       },
                                        //       child: Text(
                                        //         'Yorumla',
                                        //         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 13.0),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }

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

  Widget _iconLabelButtonModal(ProductComment productComment, BuildContext context) => InkWell(
        child: _iconLabelShowModal(context, productComment),
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      // leading: Icon(Icons.accou),
                      title: Center(child: Text('Kisiyi Takip Et')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      //  leading: Icon(Icons.music_note),
                      title: Center(child: Text('Urunu Takip Et')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      //  leading: Icon(Icons.videocam),
                      title: Center(child: Text('Gonderiyi Sikayet Et')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      //  leading: Icon(Icons.share),
                      title: Center(child: Text('Kisiyi Sikayet Et')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
          // _homeViewModel.gotoSucces(notice);
        },
      );

  Widget _iconLabelButtonLike(ProductComment productComment, BuildContext context) => InkWell(
        child: _iconLabelLike(context, productComment),
        onTap: () {
          context.read(homeViewProvider.notifier).likeComment(productComment);
          // _homeViewModel.gotoSucces(notice);
        },
      );

  Widget _iconLabelButtonComment(ProductComment productComment) => InkWell(
        child: _iconLabelComment(productComment.commentCount.toString(), productComment.accessPoint!),
        onTap: () {
          // _homeViewModel.gotoSucces(notice);
        },
      );

  Widget _iconLabelShowModal(
    BuildContext context,
    ProductComment productComment,
  ) =>
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: 5,
        children: <Widget>[
          Icon(
            Icons.pending_outlined,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          )
        ],
      );

  Widget _iconLabelLike(
    BuildContext context,
    ProductComment productComment,
  ) =>
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: 5,
        children: <Widget>[
          Icon(
            Icons.favorite,
            color: CoreHelper.getColor(productComment.isLike),
          ),
          InkWell(
            onTap: () {
              // context.router.push(
              //   CommetLikeView(productCommentId: productComment.id!.toString()),
              // );
              // AutoRoute(path: '/books', page: CommentLikePage);
              context.read(homeViewProvider.notifier).goToLikeDetail(productComment.id.toString());
            },
            child: Text(productComment.likeCount.toString()),
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

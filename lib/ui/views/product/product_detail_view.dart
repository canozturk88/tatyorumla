import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tadayim_bunu/core/enums/viewstate.dart';
import '../../../core/models/comment/product_comment.dart';
import '../../../core/viewmodels/product_detail_view_model.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';
import '../baseview.dart';

class ProductDetailView extends StatefulWidget {
  final String? productName;

  ProductDetailView(this.productName);
  @override
  // _ProductDetailViewState createState() => _ProductDetailViewState(product);
  State<StatefulWidget> createState() => _ProductDetailViewState(productName);
}

class _ProductDetailViewState extends State<ProductDetailView> {
  // ignore: unused_field
  late Future _future;
  final formKey = GlobalKey<FormState>();
  String? productName;
  late ProductDetailViewModel productDetailViewModel;
  _ProductDetailViewState(this.productName);
  List<ProductComment>? productComment;

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        productDetailViewModel = model;
        _future = productDetailViewModel.getProduct(productName!);
      },
      builder: (context, model, child) {
        return Scaffold(
          body: _buildMainContent(),
        );
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
                  tag: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            'https://apis.bildireyimbunu.com/UploadFile/' + productDetailViewModel.selectProdcuct!.bannerImageUrl! + '.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: UIHelper.dynamicHeight(10),
              ),
              Center(
                child: Text(
                  productName!,
                  style: TextStyle(fontSize: UIHelper.dynamicHeight(60), fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(
                height: UIHelper.dynamicHeight(10),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container mainContent() {
    return productDetailViewModel.state == ViewState.Idle && productDetailViewModel.productComments != null
        ? Container(
            child: Column(children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                    child: RichText(
                      text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 11.0, fontWeight: FontWeight.bold), children: [
                        TextSpan(text: 'ÜRÜN FİYAT / PERFORMANSI: ' + productDetailViewModel.selectProdcuct!.pricePerformance.toString())
                      ]),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    //can
                    // child: RatingBar.readOnly(
                    //   initialRating: double.parse(productDetailViewModel.selectProdcuct.pricePerformance!),
                    //   isHalfAllowed: true,
                    //   halfFilledIcon: Icons.star_half,
                    //   filledIcon: Icons.star,
                    //   emptyIcon: Icons.star_border,
                    //   size: 24,
                    // ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 11.0, fontWeight: FontWeight.bold),
                          children: [TextSpan(text: 'Yorum Sayısı : 12 ')]),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 10, 0),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 11.0, fontWeight: FontWeight.bold),
                          children: [TextSpan(text: 'Begenilme Orani  : %23 ')]),
                    ),
                  ),
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
                        radius: 40.0,
                        lineWidth: 3.0,
                        percent: double.parse(productDetailViewModel.selectProdcuct!.tastePoint.toString()),
                        header: Text('Lezzet'),
                        center: Icon(
                          Icons.food_bank,
                          size: 20.0,
                          color: Colors.purple,
                        ),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.purple,
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                      child: CircularPercentIndicator(
                        radius: 40.0,
                        lineWidth: 3.0,
                        percent: double.parse(productDetailViewModel.selectProdcuct!.pricePoint.toString()),
                        header: Text('Fiyat '),
                        center: Icon(
                          Icons.money,
                          size: 20.0,
                          color: Colors.purple,
                        ),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.purple,
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                    child: CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 3.0,
                      percent: double.parse(productDetailViewModel.selectProdcuct!.packinPoint.toString()),
                      header: Text('Ambalaj'),
                      center: Icon(
                        Icons.ac_unit,
                        size: 20.0,
                        color: Colors.purple,
                      ),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.purple,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                    child: CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 3.0,
                      percent: double.parse(productDetailViewModel.selectProdcuct!.accessPoint.toString()),
                      header: Text('Erisim'),
                      center: Icon(
                        Icons.find_in_page,
                        size: 20.0,
                        color: Colors.purple,
                      ),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.purple,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 40, 10, 0),
                    child: InkWell(
                      onTap: () {
                        productDetailViewModel.addNewCommentNavigate(
                            productDetailViewModel.selectProdcuct!.id!, productDetailViewModel.selectProdcuct!.productName!);
                      },
                      child: Text(
                        'Yorumla',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 14.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 10, 0),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.purple, fontSize: 18.0, fontWeight: FontWeight.bold), children: [TextSpan(text: 'Yorumlar ')]),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: productDetailViewModel.productComments == null ? 0 : productDetailViewModel.productComments!.length,
                    padding: EdgeInsets.all(2.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                        width: double.maxFinite,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Expanded(
                              //       flex: 10,
                              //       child: Padding(
                              //         padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                              //         child: RichText(
                              //           text: TextSpan(
                              //               style: TextStyle(color: mainColor, fontSize: 14.0, fontWeight: FontWeight.bold),
                              //               children: [TextSpan(text: productDetailViewModel.productComments[index].title)]),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              //SizedBox(height: 5),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                                      child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0,
                                            ),
                                            children: [TextSpan(text: productDetailViewModel.productComments![index].comment)]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                      child: RichText(
                                        text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold), children: [
                                          TextSpan(
                                              text:
                                                  'FİYAT / PERFORMANS: ' + productDetailViewModel.productComments![index].pricePerformance.toString())
                                        ]),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                      //can
                                      // child: RatingBar.readOnly(
                                      //   initialRating: double.parse(productDetailViewModel.productComments![index].pricePerformance.toString()),
                                      //   isHalfAllowed: true,
                                      //   halfFilledIcon: Icons.star_half,
                                      //   filledIcon: Icons.star,
                                      //   emptyIcon: Icons.star_border,
                                      //   size: 24,
                                      // ),
                                    ),
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
                                          radius: 40.0,
                                          lineWidth: 6.0,
                                          percent: double.parse(((productDetailViewModel.productComments![index].tastePoint! / 10) * 2).toString()),
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
                                          radius: 40.0,
                                          lineWidth: 6.0,
                                          percent: double.parse(((productDetailViewModel.productComments![index].pricePoint! / 10) * 2).toString()),
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
                                        radius: 40.0,
                                        lineWidth: 6.0,
                                        percent: double.parse(((productDetailViewModel.productComments![index].packingPoint! / 10) * 2).toString()),
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
                                        radius: 40.0,
                                        lineWidth: 6.0,
                                        percent: double.parse(((productDetailViewModel.productComments![index].accessPoint! / 10) * 2).toString()),
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
                            ],
                          ),
                        ),
                      );
                    }))
          ]))
        : productDetailViewModel.state == ViewState.Idle
            ? Container(
                child: Center(
                  child: Text(
                    'Bu Ürün içim henüz yorum yapılmamıştır',
                    style: TextStyle(color: textGrey2, fontSize: UIHelper.dynamicHeight(40)),
                  ),
                ),
              )
            : Container();
  }
}

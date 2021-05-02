import 'package:tadayim_bunu/core/viewmodels/product_comment_view_model.dart';
import 'package:tadayim_bunu/ui/shared/styles/colors.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';
import 'package:tadayim_bunu/ui/widgets/badge_menu.dart';
import '../baseview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProductCommentView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductCommentViewState();
}

class ProductCommentViewState extends State<ProductCommentView> {
  ProductCommentViewModel productCommentViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductCommentViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        productCommentViewModel = model;
      },
      builder: (context, model, child) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leading: BadgeMenuView(
                    onPress: () {
                      productCommentViewModel.openLeftDrawer();
                    },
                  ),
                  expandedHeight: UIHelper.dynamicHeight(150),
                  floating: true,
                  pinned: true,
                  centerTitle: true,
                  title: Container(
                    padding: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text('Son Yorumlar'),
                    ),
                  ),
                ),
              ];
            },
            body: mainContent(),
          ),
        );
      },
    );
  }

  Container mainContent() {
    return Container(
        child: ListView.builder(
            itemCount: productCommentViewModel.productComments == null ? 0 : productCommentViewModel.productComments.length,
            padding: EdgeInsets.all(2.0),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                width: double.maxFinite,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                              child: InkWell(
                                onTap: () async {
                                  //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
                                },
                                child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(color: mainColor, fontSize: 15.0, fontWeight: FontWeight.bold),
                                      children: [TextSpan(text: productCommentViewModel.productComments[index].productName)]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: mainColor, fontSize: 14.0),
                                    children: [TextSpan(text: productCommentViewModel.productComments[index].title)]),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
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
                                    children: [TextSpan(text: productCommentViewModel.productComments[index].comment)]),
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
                              child: InkWell(
                                onTap: () {
                                  productCommentViewModel.gotoCommentatorNavigate(productCommentViewModel.productComments[index].customerId);
                                },
                                child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(color: mainColor, fontSize: 15.0, fontWeight: FontWeight.bold),
                                      children: [TextSpan(text: productCommentViewModel.productComments[index].customerNameSurName)]),
                                ),
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
                                  TextSpan(text: 'FİYAT / PERFORMANS: ' + productCommentViewModel.productComments[index].pricePerformance.toString())
                                ]),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: RatingBar.readOnly(
                                initialRating: double.parse(productCommentViewModel.productComments[index].pricePerformance.toString()),
                                isHalfAllowed: true,
                                halfFilledIcon: Icons.star_half,
                                filledIcon: Icons.star,
                                emptyIcon: Icons.star_border,
                                size: 24,
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
                                  radius: 50.0,
                                  lineWidth: 7.0,
                                  percent: double.parse(((productCommentViewModel.productComments[index].tastePoint / 10) * 2).toString()),
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
                                  radius: 50.0,
                                  lineWidth: 7.0,
                                  percent: double.parse(((productCommentViewModel.productComments[index].pricePoint / 10) * 2).toString()),
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
                                radius: 50.0,
                                lineWidth: 7.0,
                                percent: double.parse(((productCommentViewModel.productComments[index].packingPoint / 10) * 2).toString()),
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
                                radius: 50.0,
                                lineWidth: 7.0,
                                percent: double.parse(((productCommentViewModel.productComments[index].accessPoint / 10) * 2).toString()),
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
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 40, 10, 0),
                              child: InkWell(
                                onTap: () {
                                  productCommentViewModel.addNewCommentNavigate(productCommentViewModel.productComments[index]);
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
                    ],
                  ),
                ),
              );
            }));
  }

  Widget createRow(String header, String detail, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: RichText(
              text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold), children: [TextSpan(text: header)]),
            ),
          ),
        ],
      ),
    );
  }
}

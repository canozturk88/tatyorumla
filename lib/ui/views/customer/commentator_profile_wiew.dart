import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:tadayim_bunu/core/models/user/save_customer_command.dart';
import 'package:tadayim_bunu/core/viewmodels/commentator_profile_view_model.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';
import '../custom_button.dart';
import '../baseview.dart';

class CommentatorProfileView extends StatefulWidget {
  final String customerId;

  CommentatorProfileView(this.customerId);
  @override
  State<StatefulWidget> createState() => CommentatorProfileViewState(customerId);
}

class CommentatorProfileViewState extends State {
  String customerId;
  CommentatorProfileViewModel commentatorProfileViewModel;
  CommentatorProfileViewState(this.customerId);
  final formKey = GlobalKey<FormState>();
  final custmer = SaveCustomerCommand('', '', '');
  @override
  Widget build(BuildContext context) {
    return BaseView<CommentatorProfileViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        commentatorProfileViewModel = model;
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            elevation: 0.0,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _topProfile,
                  _middleProfile,
                  SizedBox(height: 10),
                  followProfile,
                  SizedBox(height: 30),
                  bottomProfile,
                  SizedBox(height: 30),
                  bottomProfileLast,
                  customerComment()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get _topProfile => Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 1, 5),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/default_user_image.png'),
                  backgroundColor: Colors.grey,
                )),
          ),
          Expanded(
              flex: 7,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 1, 1, 5),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
                              child: InkWell(
                                onTap: () async {
                                  //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
                                },
                                child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                                      children: [TextSpan(text: 'Can OZturk')]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
                              child: InkWell(
                                onTap: () async {
                                  //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
                                },
                                child: RichText(
                                  text:
                                      TextSpan(style: TextStyle(color: Colors.grey, fontSize: 13.0), children: [TextSpan(text: 'Gitar Muzik Hayat')]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(padding: const EdgeInsets.fromLTRB(5, 1, 1, 5), child: followButton),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(padding: const EdgeInsets.fromLTRB(5, 1, 1, 5), child: sendMessageButton),
                          )
                        ],
                      )
                    ],
                  )))
        ],
      );

  Widget get _middleProfile => Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
              child: InkWell(
                onTap: () async {
                  //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
                },
                child: Text(
                  'Yaptigi Yorumlar 10',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 14.0),
                ),
              ),
            ),
          ),
          // Expanded(
          //   flex: 5,
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
          //     child: InkWell(
          //       onTap: () async {
          //         //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
          //       },
          //       child: RichText(
          //         text: TextSpan(style: TextStyle(color: Colors.green, fontSize: 15.0), children: [TextSpan(text: 'Takipci Sayisi 10')]),
          //       ),
          //     ),
          //   ),
          // )
        ],
      );

  Widget get followProfile => Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
              child: InkWell(
                  onTap: () async {
                    //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
                  },
                  child: followerCount),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
              child: InkWell(
                  onTap: () async {
                    //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
                  },
                  child: followedCount),
            ),
          )
        ],
      );

  Widget get bottomProfile => Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.all(2.0),
                          width: UIHelper.dynamicHeight(250),
                          height: UIHelper.dynamicHeight(250),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/commentedList.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12.0)),
                        )),
                    InkWell(
                      onTap: () async {
                        //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
                      },
                      child: Text(
                        'Yaptigi Yorumlar',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 14.0),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.all(2.0),
                          width: UIHelper.dynamicHeight(250),
                          height: UIHelper.dynamicHeight(250),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/commentList.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12.0)),
                        )),
                    InkWell(
                      onTap: () async {
                        //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
                      },
                      child: Text(
                        'Yapacagi Yorumlar',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 14.0),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      );

  Widget get bottomProfileLast => Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.all(2.0),
                          width: UIHelper.dynamicHeight(250),
                          height: UIHelper.dynamicHeight(250),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/photoAlbum.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12.0)),
                        )),
                    InkWell(
                      onTap: () async {
                        //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
                      },
                      child: Text(
                        'Fotograf Albumu',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 14.0),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.all(2.0),
                          width: UIHelper.dynamicHeight(250),
                          height: UIHelper.dynamicHeight(250),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/favoriteProduct.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12.0)),
                        )),
                    InkWell(
                      onTap: () async {
                        //   await productCommentViewModel.gotoProductDetail(productCommentViewModel.productComments[index].product);
                      },
                      child: Text(
                        'Favori Urunler',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 14.0),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      );

  Widget get followButton => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: InkWell(
            borderRadius: commentatorProfileBorderStyle,
            onTap: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();

                // var productComment = ProductComment();
                // productComment.pricePerformance = _pricePerformance.toInt();
                // productComment.tastePoint = _tastePoint.toInt();
                // productComment.pricePoint = _pricePoint.toInt();

                // productComment.packingPoint = _packingPoint.toInt();
                // productComment.accessPoint = _accessPoint.toInt();

                // addCommentViewModel.saveProductComment(productComment);
              }
            },
            child: Container(
              decoration: BoxDecoration(color: mainColor, borderRadius: commentatorProfileBorderStyle),
              height: UIHelper.dynamicHeight(100),
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

  Widget get sendMessageButton => Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: InkWell(
            borderRadius: commentatorProfileBorderStyle,
            onTap: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();

                // var productComment = ProductComment();
                // productComment.pricePerformance = _pricePerformance.toInt();
                // productComment.tastePoint = _tastePoint.toInt();
                // productComment.pricePoint = _pricePoint.toInt();

                // productComment.packingPoint = _packingPoint.toInt();
                // productComment.accessPoint = _accessPoint.toInt();

                // addCommentViewModel.saveProductComment(productComment);
              }
            },
            child: Container(
              decoration: BoxDecoration(color: mainColor, borderRadius: commentatorProfileBorderStyle),
              height: UIHelper.dynamicHeight(100),
              width: UIHelper.dynamicWidth(700),
              child: Center(
                child: Text(
                  'Mesaj Gonder',
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

  Widget get followerCount => Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: InkWell(
            borderRadius: commentatorProfileBorderStyle,
            onTap: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();

                // var productComment = ProductComment();
                // productComment.pricePerformance = _pricePerformance.toInt();
                // productComment.tastePoint = _tastePoint.toInt();
                // productComment.pricePoint = _pricePoint.toInt();

                // productComment.packingPoint = _packingPoint.toInt();
                // productComment.accessPoint = _accessPoint.toInt();

                // addCommentViewModel.saveProductComment(productComment);
              }
            },
            child: Container(
              decoration: BoxDecoration(color: mainColor, borderRadius: commentatorProfileBorderStyle),
              height: UIHelper.dynamicHeight(100),
              width: UIHelper.dynamicWidth(700),
              child: Center(
                child: Text(
                  'Takipci Sayisi 45',
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

  Widget get followedCount => Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: InkWell(
            borderRadius: commentatorProfileBorderStyle,
            onTap: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();

                // var productComment = ProductComment();
                // productComment.pricePerformance = _pricePerformance.toInt();
                // productComment.tastePoint = _tastePoint.toInt();
                // productComment.pricePoint = _pricePoint.toInt();

                // productComment.packingPoint = _packingPoint.toInt();
                // productComment.accessPoint = _accessPoint.toInt();

                // addCommentViewModel.saveProductComment(productComment);
              }
            },
            child: Container(
              decoration: BoxDecoration(color: mainColor, borderRadius: commentatorProfileBorderStyle),
              height: UIHelper.dynamicHeight(100),
              width: UIHelper.dynamicWidth(700),
              child: Center(
                child: Text(
                  'Takip Edilen',
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

  Row customerComment() {
    return Row(children: <Widget>[
      Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: commentatorProfileViewModel.productComments == null ? 0 : commentatorProfileViewModel.productComments.length,
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
                                    // await commentatorProfileViewModel.gotoProductDetail(commentatorProfileViewModel.productComments[index].product);
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(color: mainColor, fontSize: 15.0, fontWeight: FontWeight.bold),
                                        children: [TextSpan(text: commentatorProfileViewModel.productComments[index].productName)]),
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
                                      children: [TextSpan(text: commentatorProfileViewModel.productComments[index].title)]),
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
                                      children: [TextSpan(text: commentatorProfileViewModel.productComments[index].comment)]),
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
                                        text: 'FİYAT / PERFORMANS: ' + commentatorProfileViewModel.productComments[index].pricePerformance.toString())
                                  ]),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: RatingBar.readOnly(
                                  initialRating: double.parse(commentatorProfileViewModel.productComments[index].pricePerformance.toString()),
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
                                    percent: double.parse(((commentatorProfileViewModel.productComments[index].tastePoint / 10) * 2).toString()),
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
                                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                                  child: CircularPercentIndicator(
                                    radius: 50.0,
                                    lineWidth: 7.0,
                                    percent: double.parse(((commentatorProfileViewModel.productComments[index].pricePoint / 10) * 2).toString()),
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
                                padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                                child: CircularPercentIndicator(
                                  radius: 50.0,
                                  lineWidth: 7.0,
                                  percent: double.parse(((commentatorProfileViewModel.productComments[index].packingPoint / 10) * 2).toString()),
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
                                padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                                child: CircularPercentIndicator(
                                  radius: 50.0,
                                  lineWidth: 7.0,
                                  percent: double.parse(((commentatorProfileViewModel.productComments[index].accessPoint / 10) * 2).toString()),
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
                                padding: const EdgeInsets.fromLTRB(0, 40, 10, 0),
                                child: InkWell(
                                  onTap: () {
                                    //  productCommentViewModel.addNewCommentNavigate(productCommentViewModel.productComments[index]);
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 20, 10, 0),
                                child: RichText(
                                  text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold), children: [
                                    TextSpan(
                                        text:
                                            'Bu yorum faydalı mı? ' + commentatorProfileViewModel.productComments[index].pricePerformance.toString())
                                  ]),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_circle_up_rounded),
                                  color: Colors.grey,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                                child: Text(
                                  '45',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: UIHelper.dynamicSp(50),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_circle_down_rounded),
                                  color: Colors.grey,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                                child: Text(
                                  '45',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: UIHelper.dynamicSp(50),
                                    fontWeight: FontWeight.w700,
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
              }))
    ]);
  }
}

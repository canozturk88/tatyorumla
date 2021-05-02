import 'dart:io';
import 'package:tadayim_bunu/core/mixin/validation_mixin.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment_command.dart';
import 'package:tadayim_bunu/core/models/home/product.dart';
import 'package:tadayim_bunu/core/viewmodels/add_comment_view_model.dart';
import 'package:tadayim_bunu/ui/shared/styles/colors.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';
import '../baseview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../custom_button.dart';

class AddCommentView extends StatefulWidget {
  final Product product;

  AddCommentView(this.product);
  @override
  State<StatefulWidget> createState() => AddCommentViewState(product);
}

class AddCommentViewState extends State with ValidationMixin {
  AddCommentViewModel addCommentViewModel;
  Product product;
  AddCommentViewState(this.product);
  final formKey = GlobalKey<FormState>();
  TextEditingController controllerExplation = TextEditingController();
  TextEditingController controllerTitle = TextEditingController();
  ProductCommentCommand productCommentCommand = ProductCommentCommand();
  int _groupValue = 0;
  double _pricePerformance = 0;
  double _pricePoint = 0;
  double _tastePoint = 0;
  double _accessPoint = 0;
  double _packingPoint = 0;

  File _image1;
  File _image2;
  File _image3;
  @override
  Widget build(BuildContext context) {
    return BaseView<AddCommentViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        addCommentViewModel = model;
      },
      builder: (context, model, child) {
        return Scaffold(
          key: addCommentViewModel.addCommentViewModelKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => addCommentViewModel.gotoBackPage(),
            ),
            title: Text(product.productName),
            backgroundColor: UIHelper.PEAR_PRIMARY_COLOR,
          ),
          body: mainContent(),
        );
      },
    );
  }

  Widget mainContent() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              title(),
              SizedBox(
                height: 1,
              ),
              explation(),
              SizedBox(
                height: 10,
              ),
              pricePerformance(),
              SizedBox(
                height: 10,
              ),
              tastePoint(),
              SizedBox(
                height: 10,
              ),
              pricePoint(),
              SizedBox(
                height: 10,
              ),
              packingPoint(),
              SizedBox(
                height: 10,
              ),
              accessPoint(),
              SizedBox(
                height: 10,
              ),
              buyAgain(),
              SizedBox(
                height: 10,
              ),
              addImage(),
              SizedBox(
                height: 10,
              ),
              showImage(),
              SizedBox(
                height: 10,
              ),
              saveCommentButton
            ],
          ),
        ),
      ),
    );
  }

  Widget explation() {
    return TextFormField(
      controller: controllerTitle,
      textInputAction: TextInputAction.newline,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      maxLength: 2000,
      validator: validateExplation,
      decoration: InputDecoration(labelText: 'Yorum', hintText: 'Yorum'),
      onSaved: (String value) {
        productCommentCommand.comment = value;
      },
    );
  }

  Widget title() {
    return TextFormField(
      controller: controllerExplation,
      textInputAction: TextInputAction.newline,

      // keyboardType: TextInputType.multiline,
      // maxLines: null,
      maxLength: 40,
      validator: validateTitle,
      decoration: InputDecoration(labelText: 'Baslik', hintText: 'Baslik'),
      onSaved: (String value) {
        productCommentCommand.title = value;
      },
    );
  }

  Widget pricePerformance() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold), children: [TextSpan(text: 'Fiyat Performans')]),
            ),
          ),
          Expanded(
            flex: 6,
            child: RatingBar(
              onRatingChanged: (rating) => setState(() => _pricePerformance = rating),
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              halfFilledIcon: Icons.star_half,
              isHalfAllowed: true,
              filledColor: Colors.green,
              emptyColor: Colors.redAccent,
              halfFilledColor: Colors.amberAccent,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget tastePoint() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: RichText(
              text:
                  TextSpan(style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold), children: [TextSpan(text: 'Lezzet')]),
            ),
          ),
          Expanded(
            flex: 6,
            child: RatingBar(
              onRatingChanged: (rating) => setState(() => _tastePoint = rating),
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              halfFilledIcon: Icons.star_half,
              isHalfAllowed: true,
              filledColor: Colors.green,
              emptyColor: Colors.redAccent,
              halfFilledColor: Colors.amberAccent,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget pricePoint() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: RichText(
              text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold), children: [TextSpan(text: 'Fiyat')]),
            ),
          ),
          Expanded(
            flex: 6,
            child: RatingBar(
              onRatingChanged: (rating) => setState(() => _pricePoint = rating),
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              halfFilledIcon: Icons.star_half,
              isHalfAllowed: true,
              filledColor: Colors.green,
              emptyColor: Colors.redAccent,
              halfFilledColor: Colors.amberAccent,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget packingPoint() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: RichText(
              text:
                  TextSpan(style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold), children: [TextSpan(text: 'Ambalaj')]),
            ),
          ),
          Expanded(
            flex: 6,
            child: RatingBar(
              onRatingChanged: (rating) => setState(() => _packingPoint = rating),
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              halfFilledIcon: Icons.star_half,
              isHalfAllowed: true,
              filledColor: Colors.green,
              emptyColor: Colors.redAccent,
              halfFilledColor: Colors.amberAccent,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget accessPoint() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: RichText(
              text:
                  TextSpan(style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold), children: [TextSpan(text: 'Erisim')]),
            ),
          ),
          Expanded(
            flex: 6,
            child: RatingBar(
              onRatingChanged: (rating) => setState(() => _accessPoint = rating),
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              halfFilledIcon: Icons.star_half,
              isHalfAllowed: true,
              filledColor: Colors.green,
              emptyColor: Colors.redAccent,
              halfFilledColor: Colors.amberAccent,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget buyAgain() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold), children: [TextSpan(text: 'Tekrar Alirim')]),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      groupValue: _groupValue,
                      value: 0,
                      onChanged: (t) {
                        setState(() {
                          _groupValue = t;
                        });
                      },
                    ),
                    Text('Evet')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      groupValue: _groupValue,
                      value: 1,
                      onChanged: (t) {
                        setState(() {
                          _groupValue = t;
                        });
                      },
                    ),
                    Text('Hayir')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget addImage() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      tooltip: 'Resim ',
                      onPressed: () {
                        _getImage1();
                      },
                    ),
                    Text('Resim ')
                  ],
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      tooltip: 'Resim',
                      onPressed: () {
                        _getImage2();
                      },
                    ),
                    Text('Resim'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      tooltip: 'Resim',
                      onPressed: () {
                        _getImage3();
                      },
                    ),
                    Text('Resim ')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _getImage1() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image1 = image;
    });
  }

  Future _getImage2() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image2 = image;
    });
  }

  Future _getImage3() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image3 = image;
    });
  }

  Widget showImage() {
    return Container(
      // height: 300,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),

      child: Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPath(
                  child: (_image1 != null)
                      ? ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Image.file(
                            File(_image1.path),
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                          ))
                      : Container())
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPath(
                  child: (_image2 != null)
                      ? ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Image.file(
                            File(_image2.path),
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                          ))
                      : Container())
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPath(
                  child: (_image3 != null)
                      ? ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Image.file(
                            File(_image3.path),
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                          ))
                      : Container())
            ],
          ),
        ],
      ),
    );
  }

  Widget get saveCommentButton => Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: InkWell(
            borderRadius: loginButtonBorderStyle,
            onTap: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();

                productCommentCommand.pricePerformance = _pricePerformance.toInt();
                productCommentCommand.tastePoint = _tastePoint.toInt();
                productCommentCommand.pricePoint = _pricePoint.toInt();

                productCommentCommand.packingPoint = _packingPoint.toInt();
                productCommentCommand.accessPoint = _accessPoint.toInt();

                productCommentCommand.customerId = '1';
                productCommentCommand.customerNameSurName = 'Can OZturk';
                productCommentCommand.productId = product.id;
                productCommentCommand.productName = product.productName;
                productCommentCommand.createdDate = DateTime.now();
                addCommentViewModel.saveProductComment(productCommentCommand);
              }
            },
            child: Container(
              decoration: BoxDecoration(color: mainColor, borderRadius: loginButtonBorderStyle),
              height: UIHelper.dynamicHeight(200),
              width: UIHelper.dynamicWidth(1000),
              child: Center(
                child: Text(
                  'Yorumla',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: UIHelper.dynamicSp(60),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  // Widget buildImageBody() {
  //   return ClipPath(
  //       child: (_image1 != null)
  //           ? Image.file(File(_image1.path))
  //           : Text(
  //               productComment.productName,
  //               style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 14.0),
  //             ));
  // }
  // Widget createRow(String header, String detail, Color color) {
  //   return Container(
  //     color: color,
  //     alignment: Alignment.center,
  //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           flex: 10,
  //           child: RichText(
  //             text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold), children: [TextSpan(text: header)]),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _footerButtonRow(Notice notice) => Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: <Widget>[
  //         _iconLabelButtonEdit(notice),
  //       ],
  //     );

  // Widget _iconLabelEdit(String text) => Wrap(
  //       crossAxisAlignment: WrapCrossAlignment.center,
  //       spacing: 5,
  //       children: <Widget>[
  //         Icon(
  //           Icons.arrow_right_alt_outlined,
  //           color: CupertinoColors.inactiveGray,
  //         ),
  //         Text(text),
  //         SizedBox(
  //           width: 20,
  //         )
  //       ],
  //     );

  // Widget _iconLabelButtonEdit(Notice notice) => InkWell(
  //       child: _iconLabelEdit('Detay'),
  //       onTap: () {
  //         _allNoticeViewModel.gotoEditNotice(notice);
  //       },
  //     );
}

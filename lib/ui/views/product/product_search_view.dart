import 'package:tadayim_bunu/core/viewmodels/product_search_view_model.dart';
import 'package:tadayim_bunu/ui/shared/styles/colors.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';
import 'package:tadayim_bunu/ui/widgets/badge_menu.dart';
import '../baseview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class ProductSearchView extends StatefulWidget {
  // ProductSearchView({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ProductSearchViewState();
}

class ProductSearchViewState extends State<ProductSearchView> {
  ProductSearchViewModel productSearchViewModel;

  String currentText = '';
  GlobalKey key = GlobalKey<AutoCompleteTextFieldState<ArbitrarySuggestionType>>();

  ProductSearchViewState() {
    textField = AutoCompleteTextField<ArbitrarySuggestionType>(
      textChanged: (text) {
        currentText = text;
      },
      decoration:
          InputDecoration(hintText: 'Marka & Ürün Ara...', suffixIcon: IconButton(icon: Icon(Icons.cancel), onPressed: () => textField.clear())),
      itemSubmitted: (item) => setState(() => selected = item),
      key: key,
      suggestions: suggestions,
      itemBuilder: (context, suggestion) =>
          Padding(child: ListTile(title: Text(suggestion.name), trailing: Text('Stars: ${suggestion.stars}')), padding: EdgeInsets.all(8.0)),
      itemSorter: (a, b) => a.stars == b.stars
          ? 0
          : a.stars > b.stars
              ? -1
              : 1,
      itemFilter: (suggestion, input) => suggestion.name.toLowerCase().startsWith(input.toLowerCase()),
    );
  }

  List<ArbitrarySuggestionType> suggestions = [
    ArbitrarySuggestionType(4.7, 'ulker cikolata', 'https://media-cdn.tripadvisor.com/media/photo-p/0f/25/de/0c/photo1jpg.jpg'),
    ArbitrarySuggestionType(1.5, 'ulker biskrem', 'https://media-cdn.tripadvisor.com/media/photo-s/12/ba/7d/4c/confit-cod-chorizo-red.jpg'),
    ArbitrarySuggestionType(3.4, 'ulker al beni', 'https://media-cdn.tripadvisor.com/media/photo-s/12/fc/bb/11/from-the-street.jpg'),
    ArbitrarySuggestionType(4.3, 'ulker halley', 'https://media-cdn.tripadvisor.com/media/photo-p/07/ad/76/b0/the-gyoza-had-a-nice.jpg'),
    ArbitrarySuggestionType(1.1, 'Geppetto Trattoria', 'https://media-cdn.tripadvisor.com/media/photo-s/0c/85/3d/cb/photo1jpg.jpg'),
    ArbitrarySuggestionType(3.4, 'Cumulus Inc.', 'https://media-cdn.tripadvisor.com/media/photo-s/0e/21/a0/be/photo0jpg.jpg'),
    ArbitrarySuggestionType(2.2, 'Chin Chin', 'https://media-cdn.tripadvisor.com/media/photo-s/0e/83/ec/07/triple-beef-triple-bacon.jpg'),
    ArbitrarySuggestionType(5.0, 'Anchovy', 'https://media-cdn.tripadvisor.com/media/photo-s/07/e7/f6/8e/daneli-s-kosher-deli.jpg'),
    ArbitrarySuggestionType(4.7, 'Sezar Restaurant', 'https://media-cdn.tripadvisor.com/media/photo-s/04/b8/23/d1/nevsky-russian-restaurant.jpg'),
    ArbitrarySuggestionType(2.6, 'Tipo 00', 'https://media-cdn.tripadvisor.com/media/photo-s/11/17/67/8c/front-seats.jpg'),
    ArbitrarySuggestionType(3.4, 'Coda', 'https://media-cdn.tripadvisor.com/media/photo-s/0d/b1/6a/84/photo0jpg.jpg'),
    ArbitrarySuggestionType(1.1, 'Pastuso', 'https://media-cdn.tripadvisor.com/media/photo-w/0a/d9/cf/52/photo4jpg.jpg'),
    ArbitrarySuggestionType(0.2, 'San Telmo', 'https://media-cdn.tripadvisor.com/media/photo-s/0e/51/35/35/tempura-sashimi-combo.jpg'),
    ArbitrarySuggestionType(3.6, 'Supernormal', 'https://media-cdn.tripadvisor.com/media/photo-s/0e/bc/63/69/mr-miyagi.jpg'),
    ArbitrarySuggestionType(4.4, 'EZARD', 'https://media-cdn.tripadvisor.com/media/photo-p/09/f2/83/15/photo0jpg.jpg'),
    ArbitrarySuggestionType(2.1, 'Maha', 'https://media-cdn.tripadvisor.com/media/photo-s/10/f8/9e/af/20171013-205729-largejpg.jpg'),
    ArbitrarySuggestionType(4.2, 'MoVida', 'https://media-cdn.tripadvisor.com/media/photo-s/0e/1f/55/79/and-here-we-go.jpg')
  ];

  AutoCompleteTextField<ArbitrarySuggestionType> textField;

  ArbitrarySuggestionType selected;

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductSearchViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        productSearchViewModel = model;
      },
      builder: (context, model, child) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leading: BadgeMenuView(
                    onPress: () {
                      productSearchViewModel.openLeftDrawer();
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
                      child: Text('Urunler'),
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

  void _showPickerShort() {
    showDialog(
        context: context,
        builder: (BuildContext bc) {
          return AlertDialog(
            content: Container(
              height: 250.0,
              width: double.maxFinite,
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Expanded(
                  child: ListView(children: <Widget>[
                    ListTile(
                        leading: const Icon(Icons.arrow_downward_outlined),
                        title: const Text('Fiyat Performans'),
                        onTap: () {
                          // _imagePicker(ImageSource.gallery, model);
                          Navigator.of(bc).pop();
                        }),
                    ListTile(
                      leading: const Icon(Icons.arrow_upward_outlined),
                      title: const Text('Fiyat Performans'),
                      onTap: () {
                        //_imagePicker(ImageSource.camera, model);
                        Navigator.of(bc).pop();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.comment),
                      title: const Text('Yorum Sayısı'),
                      onTap: () {
                        //   _imagePicker(ImageSource.camera, model);
                        Navigator.of(bc).pop();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.add_alarm),
                      title: const Text('En Yeniler'),
                      onTap: () {
                        //   _imagePicker(ImageSource.camera, model);
                        Navigator.of(bc).pop();
                      },
                    ),
                  ]),
                ),
              ]),
            ),
          );
        });
  }

  Container mainContent() {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Column(children: [
                Padding(child: Container(child: textField), padding: EdgeInsets.all(10.0)),
                // Padding(
                //     padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
                //     child: Card(
                //       child: selected != null
                //           ? Column(children: [
                //               ListTile(title: Text(selected.name), trailing: Text('Fiyat/Performans: ${selected.stars}/5')),
                //               Container(child: Image(image: NetworkImage(selected.imgURL)), width: 400.0, height: 300.0)
                //             ])
                //           : Container(),
                //     )),
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: RaisedButton(
                        onPressed: () {
                          _showPickerShort();
                        },
                        color: Colors.grey[200],
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.short_text,
                                color: Colors.grey[600],
                              ),
                              Text(
                                'Sırala',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: RaisedButton(
                        onPressed: () async {
                          await productSearchViewModel.gotoFilterPage();
                          // await navigator.navigateTo(Pages.FilterPage);
                          // _showPickerFilter();
                        },
                        color: Colors.grey[200],
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.filter_alt,
                                color: Colors.grey[600],
                              ),
                              Text(
                                'Filtrele',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              child: Expanded(
            child: selected == null
                ? ListView.builder(
                    itemCount: productSearchViewModel.products == null ? 0 : productSearchViewModel.products.length,
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
                                    flex: 7,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await productSearchViewModel.gotoProductDetail(productSearchViewModel.products[index].productName);
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                              style: TextStyle(color: mainColor, fontSize: 15.0, fontWeight: FontWeight.bold),
                                              children: [TextSpan(text: productSearchViewModel.products[index].productName)]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await productSearchViewModel.gotoProductDetail(productSearchViewModel.products[index].productName);
                                        },
                                        child: Text(
                                          'Yorumlar',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 14.0),
                                        ),
                                      ),
                                    ),
                                  )
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
                                          TextSpan(text: 'FİYAT / PERFORMANS: ' + productSearchViewModel.products[index].pricePerformance.toString())
                                        ]),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                      child: RatingBar.readOnly(
                                        initialRating: double.parse(productSearchViewModel.products[index].pricePerformance),
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
                                          radius: 40.0,
                                          lineWidth: 3.0,
                                          percent: double.parse(productSearchViewModel.products[index].tastePoint),
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
                                          lineWidth: 3.0,
                                          percent: double.parse(productSearchViewModel.products[index].pricePoint),
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
                                        lineWidth: 3.0,
                                        percent: double.parse(productSearchViewModel.products[index].packinPoint),
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
                                        lineWidth: 3.0,
                                        percent: double.parse(productSearchViewModel.products[index].accessPoint),
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
                                          productSearchViewModel.addNewCommentNavigate(
                                              productSearchViewModel.products[index].id, productSearchViewModel.products[index].productName);
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
                    })
                : Text('Urunler'),
          )),
        ],
      ),

      // child: Expanded(
      //     child: ListView.builder(
      //         itemCount: productSearchViewModel.products == null ? 0 : productSearchViewModel.products.length,
      //         padding: EdgeInsets.all(2.0),
      //         itemBuilder: (BuildContext context, int index) {
      //           return Container(
      //             padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      //             width: double.maxFinite,
      //             child: Card(
      //               child: Column(
      //                 children: <Widget>[
      //                   Row(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Expanded(
      //                         flex: 10,
      //                         child: Padding(
      //                           padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
      //                           child: InkWell(
      //                             onTap: () async {
      //                               //   productSearchViewModel.gotoProductDetail(productSearchViewModel.products[index].product);
      //                             },
      //                             child: RichText(
      //                               text: TextSpan(
      //                                   style: TextStyle(color: mainColor, fontSize: 15.0, fontWeight: FontWeight.bold),
      //                                   children: [TextSpan(text: productSearchViewModel.products[index].title)]),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Row(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Expanded(
      //                         flex: 10,
      //                         child: Padding(
      //                           padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
      //                           child: RichText(
      //                             text: TextSpan(
      //                                 style: TextStyle(color: mainColor, fontSize: 14.0),
      //                                 children: [TextSpan(text: productSearchViewModel.products[index].title)]),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),

      //                   //SizedBox(height: 5),
      //                   Row(
      //                     children: [
      //                       Expanded(
      //                         flex: 10,
      //                         child: Padding(
      //                           padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
      //                           child: RichText(
      //                             text: TextSpan(
      //                                 style: TextStyle(
      //                                   color: Colors.grey,
      //                                   fontSize: 12.0,
      //                                 ),
      //                                 children: [TextSpan(text: productSearchViewModel.products[index].detail)]),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Row(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Expanded(
      //                         flex: 5,
      //                         child: Padding(
      //                           padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
      //                           child: RichText(
      //                             text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold), children: [
      //                               TextSpan(text: 'FİYAT / PERFORMANS: ' + productSearchViewModel.products[index].pricePerformance.toString())
      //                             ]),
      //                           ),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         flex: 5,
      //                         child: Padding(
      //                           padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      //                           child: RatingBar.readOnly(
      //                             initialRating: productSearchViewModel.products[index].pricePerformance,
      //                             isHalfAllowed: true,
      //                             halfFilledIcon: Icons.star_half,
      //                             filledIcon: Icons.star,
      //                             emptyIcon: Icons.star_border,
      //                             size: 24,
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Row(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Expanded(
      //                         flex: 2,
      //                         child: Padding(
      //                             padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
      //                             child: CircularPercentIndicator(
      //                               radius: 50.0,
      //                               lineWidth: 7.0,
      //                               percent: 0.8,
      //                               header: Text('Lezzet'),
      //                               center: Icon(
      //                                 Icons.food_bank,
      //                                 size: 20.0,
      //                                 color: Colors.blue,
      //                               ),
      //                               backgroundColor: Colors.grey,
      //                               progressColor: Colors.blue,
      //                             )),
      //                       ),
      //                       Expanded(
      //                         flex: 2,
      //                         child: Padding(
      //                             padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
      //                             child: CircularPercentIndicator(
      //                               radius: 50.0,
      //                               lineWidth: 7.0,
      //                               percent: 0.8,
      //                               header: Text('Fiyat '),
      //                               center: Icon(
      //                                 Icons.money,
      //                                 size: 20.0,
      //                                 color: Colors.blue,
      //                               ),
      //                               backgroundColor: Colors.grey,
      //                               progressColor: Colors.blue,
      //                             )),
      //                       ),
      //                       Expanded(
      //                         flex: 2,
      //                         child: Padding(
      //                           padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
      //                           child: CircularPercentIndicator(
      //                             radius: 50.0,
      //                             lineWidth: 7.0,
      //                             percent: 0.8,
      //                             header: Text('Ambalaj'),
      //                             center: Icon(
      //                               Icons.ac_unit,
      //                               size: 20.0,
      //                               color: Colors.blue,
      //                             ),
      //                             backgroundColor: Colors.grey,
      //                             progressColor: Colors.blue,
      //                           ),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         flex: 2,
      //                         child: Padding(
      //                           padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
      //                           child: CircularPercentIndicator(
      //                             radius: 50.0,
      //                             lineWidth: 7.0,
      //                             percent: 0.8,
      //                             header: Text('Erisim'),
      //                             center: Icon(
      //                               Icons.find_in_page,
      //                               size: 20.0,
      //                               color: Colors.blue,
      //                             ),
      //                             backgroundColor: Colors.grey,
      //                             progressColor: Colors.blue,
      //                           ),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         flex: 2,
      //                         child: Padding(
      //                           padding: const EdgeInsets.fromLTRB(5, 40, 10, 0),
      //                           child: InkWell(
      //                             onTap: () {
      //                               // _homeViewModel.gotoMyNoticeView();
      //                             },
      //                             child: Text(
      //                               'Yorumla',
      //                               style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 14.0),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   // RatingBar(
      //                   //   //onRatingChanged: (rating) => setState(() => _rating = rating),
      //                   //   filledIcon: Icons.star,
      //                   //   emptyIcon: Icons.star_border,
      //                   //   halfFilledIcon: Icons.star_half,
      //                   //   isHalfAllowed: true,
      //                   //   filledColor: mainColor,
      //                   //   emptyColor: Colors.orange,
      //                   //   halfFilledColor: Colors.amberAccent,
      //                   //   size: 48,
      //                   // ),
      //                   //createRow('FİYAT / PERFORMANS: ', productCommentViewModel.productComments[index].pricePerformance, Colors.white),
      //                 ],
      //               ),
      //             ),
      //           );
      //         })),
    );
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

class ArbitrarySuggestionType {
  //For the mock data type we will use review (perhaps this could represent a restaurant);
  num stars;
  String name, imgURL;

  ArbitrarySuggestionType(this.stars, this.name, this.imgURL);
}

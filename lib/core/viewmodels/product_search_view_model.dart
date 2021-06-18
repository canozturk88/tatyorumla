import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment.dart';
import 'package:tadayim_bunu/core/models/home/product.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'base_model.dart';
import 'main_view_model.dart';
import 'package:flutter/material.dart';

class ProductSearchViewModel extends BaseModel {
  final noticeScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: '_productSearcViewModel');

  late BuildContext _context;
  final SharedManager _sharedManager = SharedManager();
  BuildContext get context => _context;

  List<Product>? products;

  ProductSearchViewModel() {
    getProductData(0);
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  Future addNewCommentNavigate(String productId, String productName) async {
    var product = Product();
    product.id = productId;
    product.productName = productName;
    await navigator.navigateTo(Pages.AddNewComment, product);
  }

  void getProductData(int page) {
    products = <Product>[];
    products = _sharedManager.productResponseModel!.products;

    // var product = Product();
    // product.bannerImageUrl = '1607580523214';
    // product.id = '1';
    // product.productName = 'Besler Tavuk 1';
    // product.brand = '1';
    // product..pricePerformance = '4.4';

    // var product1 = Product();
    // product1.bannerImageUrl = '1607580523214';
    // product1.id = '2';
    // product1.productName = 'Besler Et 2';
    // product1.brand = '1';
    // // product1.bannerImageUrl = 'temel_gida';
    // product.detail = 'deneme';
    // product1.pricePerformance = '4.0';

    // var product2 = Product();
    // product2.bannerImageUrl = '1607580523214';
    // product2.id = '3';
    // product2.productName = 'Besler Et 3';
    // product2.brand = '1';
    // // product2.bannerImageUrl = 'temel_gida';
    // product2.detail = 'deneme';
    // product2..pricePerformance = '4.0';

    // var product3 = Product();
    // product3.bannerImageUrl = '1607580523214';
    // product3.id = '4';
    // product3.productName = 'Besler Tavuk 5';
    // product3.brand = '1';
    // // product3.bannerImageUrl = 'temel_gida';
    // product3.detail = 'deneme';
    // product3..pricePerformance = '4.0';

    // var product4 = Product();
    // product4.bannerImageUrl = '1607580523214';
    // product4.id = '5';
    // product4.productName = 'Besler Et 5';
    // product4.brand = '1';
    // // product4.bannerImageUrl = 'temel_gida';
    // product4.detail = 'deneme';
    // product4..pricePerformance = '4.0';

    // var product5 = Product();
    // product5.bannerImageUrl = '1607580523214';
    // product5.id = '6';
    // product5.productName = 'Besler Et 6';
    // product5.brand = '1';
    // product5.detail = 'deneme';
    // product5..pricePerformance = '4.0';
    // // product5.bannerImageUrl = 'temel_gida';

    // products.add(product);
    // products.add(product1);
    // products.add(product2);
    // products.add(product3);
    // products.add(product4);
    // products.add(product5);

    // if (SharedManager().openNotice != null) {
    //   noticies = SharedManager().openNotice;
    // } else {
    //   NoticeApiServices.instance.getAllNoticeNoPage().then((response) {
    //     //    setState(() {
    //     if (response.statusCode == 200) {
    //       Map<String, dynamic> map = jsonDecode(response.body);
    //       var responseNotice = ResponseNotice.fromJson(map);
    //       SharedManager().openNotice = responseNotice.notices;
    //       noticies = responseNotice.notices;
    //     }
    //   });
    // }
  }

  // ignore: always_declare_return_types
  openLeftDrawer() {
    MainViewModel.openLeftMenu();
  }

  void gotoEditNotice(ProductComment notice) async {
    //  await navigator.navigateTo(Pages.NoticeDetail, notice);
    //  await Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeDetail(notice)));
  }

  Future gotoProductDetail(String productName) async => await navigator.navigateTo(Pages.ProductDetail, productName);

  Future gotoFilterPage() async => await navigator.navigateTo(Pages.FilterPage);
}

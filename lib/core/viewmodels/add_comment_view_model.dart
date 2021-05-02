import 'package:tadayim_bunu/core/apis/productComment/product_comment_api.dart';
import 'package:tadayim_bunu/core/enums/page_named.dart';
import 'package:tadayim_bunu/core/enums/viewstate.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment.dart';
import 'package:tadayim_bunu/core/models/comment/product_comment_command.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';
import 'base_model.dart';
import 'main_view_model.dart';
import 'package:flutter/material.dart';

class AddCommentViewModel extends BaseModel {
  final addCommentViewModelKey = GlobalKey<ScaffoldState>(debugLabel: '_addCommentViewModel');

  BuildContext _context;

  BuildContext get context => _context;
  int minRatingValue = 1;
  List<ProductComment> productComments;

  // ignore: empty_constructor_bodies
  AddCommentViewModel() {}

  @override
  void setContext(BuildContext context) {
    _context = context;
  }

  Future addNewComment(ProductComment productComment) async {
    await navigator.navigateTo(Pages.AddNewComment, productComment);
  }

  // ignore: always_declare_return_types
  openLeftDrawer() {
    MainViewModel.openLeftMenu();
  }

  Future gotoBackPage() async {
    await Navigator.pop(context);
  }

  void saveProductComment(ProductCommentCommand productCommentCommand) {
    setState(ViewState.Busy);
    if (productCommentCommand.pricePerformance < minRatingValue) {
      snackBarWarningMessage('Fiyat Performansi Degerlendirmelisiniz');
    } else if (productCommentCommand.tastePoint < minRatingValue) {
      snackBarWarningMessage('Lezzeti Degerlendirmelisiniz');
    } else if (productCommentCommand.pricePoint < minRatingValue) {
      snackBarWarningMessage('Fiyati Degerlendirmelisiniz');
    } else if (productCommentCommand.packingPoint < minRatingValue) {
      snackBarWarningMessage('Ambalaji Degerlendirmelisiniz');
    } else if (productCommentCommand.accessPoint < minRatingValue) {
      snackBarWarningMessage('Erisebilirligi Degerlendirmelisiniz');
    } else {
      ProductCommentApiServices.saveProductComment(productCommentCommand).then((response) {
        if (response.statusCode == 200) {
          // Map userMap = jsonDecode(response.body);
          // var userLogin = User.fromJson(userMap);
          // userLogin.userToken = SharedManager().jwtToken;
          // userLogin.noticies = SharedManager().loginRequest.noticies;
          // SharedManager().loginRequest = userLogin;
          // snackBarWarningMessage('Şifre Değiştirilmiştir.');
          Future.delayed(Duration(milliseconds: 2000), () {
            navigator.navigateToRemove(Pages.MyAccount);
          });
        } else {
          // snackBarWarningMessage('Mevcut şifre yanlıştır.');
        }
      });
    }
  }

  // ignore: always_declare_return_types
  snackBarWarningMessage(String _message) async {
    await UIHelper.showSnackBar(key: addCommentViewModelKey, child: Text(_message ?? ''));
    setState(ViewState.Idle);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../services/shared_prefernces_api.dart';
import 'base_model.dart';

class WriteCommentViewodel extends BaseModel {
  late BuildContext _context;

  BuildContext get context => _context;

  late WriteCommentViewodel writeCommentViewodel;

  // FilterModel filterModel;
  // List<HomeFilterImageModel> homeFilterImageData;

  SharedManager sharedManager = SharedManager();

  bool pointVisibility = false;

  List<Widget> imageList = [];
  Function? goToStationView;

  // ignore: always_declare_return_types
  WriteCommentView() {}

  @override
  void setContext(BuildContext context) {
    _context = context;
    // Future.delayed(Duration(milliseconds: 500),() async {
    //   await OneSignal.shared.promptUserForPushNotificationPermission(fallbackToSettings: true);
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

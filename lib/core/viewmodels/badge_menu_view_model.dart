import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/shared_prefernces_api.dart';
import 'base_model.dart';

final badgeMenuViewProvider = ChangeNotifierProvider((_) => BadgeMenuViewModel());
class BadgeMenuViewModel extends BaseModel {
  late BuildContext _context;

  BuildContext get context => _context;

  SharedManager sharedManager = SharedManager();

  BadgeMenuViewModel();

  @override
  void setContext(BuildContext context) {
    _context = context;
  }
}

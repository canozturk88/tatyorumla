import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../services/shared_prefernces_api.dart';
import 'base_model.dart';

class BadgeMenuViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  SharedManager sharedManager = SharedManager();

  BadgeMenuViewModel();

  @override
  void setContext(BuildContext context) {
    _context = context;
  }
}

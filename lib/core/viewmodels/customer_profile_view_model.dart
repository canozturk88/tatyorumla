import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base_model.dart';

class CustomerProfileViewModel extends BaseModel {
  final customerProfileViewModel = GlobalKey<ScaffoldState>(debugLabel: '_customerProfileViewModel');

  late BuildContext _context;

  BuildContext get context => _context;

  CustomerProfileViewModel();

  @override
  void setContext(BuildContext context) {
    _context = context;
  }
}

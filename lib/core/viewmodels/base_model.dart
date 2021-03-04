import 'package:flutter/material.dart';
import '../enums/viewstate.dart';
import '../services/navigation_api.dart';
import '../../ui/shared/language/app_localizations.dart';

import '../../locator.dart';

abstract class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  NavigationService get navigator {
    return locator<NavigationService>();
  }

  void setState(ViewState state) {
    if (state == _state) {
      return;
    } else {
      _state = state;
    }

    try {
      notifyListeners();
    } catch (e) {
      print('BM: notifyListeners ERROR');
    }
  }

  String translate(BuildContext context, String _translateText) {
    return AppLocalizations.of(context).translate(_translateText);
  }

  String translateDynamicValue(BuildContext context, String _translateText, String _dynamicValue) {
    return AppLocalizations.of(context).translateDynamicValue(_translateText, _dynamicValue);
  }

  @override
  void notifyListeners() {
    try {
      super.notifyListeners();
    } catch (e) {
      print('BM: notifyListeners ERROR');
    }
  }

  void setContext(BuildContext context);

  @override
  void dispose() {
    super.dispose();
  }
}

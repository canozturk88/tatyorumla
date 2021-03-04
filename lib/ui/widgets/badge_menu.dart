import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../../core/viewmodels/badge_menu_view_model.dart';
import '../shared/view_helper/ui_helper.dart';
import '../views/baseview.dart';

class BadgeMenuView extends StatefulWidget {
  @override
  _BadgeMenuViewState createState() => _BadgeMenuViewState();

  BadgeMenuView({
    Key key,
    this.onPress,
  }) : super(key: key);

  final VoidCallback onPress;
}

class _BadgeMenuViewState extends State<BadgeMenuView> {
  BadgeMenuViewModel _badgeMenuViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<BadgeMenuViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        _badgeMenuViewModel = model;
      },
      builder: (context, model, child) {
        return _badgeMenuViewModel.sharedManager.notificationCount != 0
            ? InkWell(
                onTap: () {
                  widget.onPress();
                },
                child: Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationType: BadgeAnimationType.fade,
                  badgeContent: Text(
                    _badgeMenuViewModel.sharedManager.notificationCount.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(
                        Icons.ac_unit,
                        size: UIHelper.dynamicHeight(48),
                      ),
                      onPressed: () {
                        widget.onPress();
                      }),
                ),
              )
            : IconButton(
                icon: Icon(
                  Icons.menu,
                  size: UIHelper.dynamicHeight(48),
                ),
                onPressed: () {
                  widget.onPress();
                });
      },
    );
  }
}

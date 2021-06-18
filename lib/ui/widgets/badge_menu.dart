import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/viewmodels/badge_menu_view_model.dart';
import '../shared/view_helper/ui_helper.dart';
import '../views/baseview.dart';

class BadgeMenuView extends ConsumerWidget {
  BadgeMenuView({
    required this.onPress,
  });
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final badgeMenuViewModel = watch(badgeMenuViewProvider);

    return badgeMenuViewModel.sharedManager.notificationCount != 0
        ? InkWell(
            onTap: () {
              onPress();
            },
            child: Badge(
              position: BadgePosition.topEnd(top: 0, end: 3),
              animationType: BadgeAnimationType.fade,
              badgeContent: Text(
                badgeMenuViewModel.sharedManager.notificationCount.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.ac_unit,
                    size: UIHelper.dynamicHeight(48),
                  ),
                  onPressed: () {
                    onPress();
                  }),
            ),
          )
        : IconButton(
            icon: Icon(
              Icons.menu,
              size: UIHelper.dynamicHeight(96),
            ),
            onPressed: () {
              onPress();
            });
    //  },
    // );
  }
}

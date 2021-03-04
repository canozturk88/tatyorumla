import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/viewmodels/splash_model.dart';
import '../../shared/view_helper/ui_helper.dart';

import '../baseview.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final String _animationName = 'splash_aytemiz';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return BaseView<SplashViewModel>(
      onModelReady: (model) {
        model.setContext(context);
      },
      builder: (context, model, child) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Container(
                padding: EdgeInsets.all(UIHelper.dynamicHeight(100)),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff8d2229), Color(0xffd51c23)],
                    stops: [0, 1],
                  ),
                ),

                //child: Center(child: Image.asset("assets/images/aytemiz.gif",)),
                child: Center(
                  child: FlareActor(
                    'assets/images/new_splash_aytemiz.flr',
                    fit: BoxFit.contain,
                    animation: _animationName,
                  ),
                ),
              )),
        );
      },
    );
  }
}

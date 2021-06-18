import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/viewmodels/splash_view_model.dart';
import '../../shared/view_helper/ui_helper.dart';

class SplashView extends ConsumerWidget {
  final String _animationName = 'splash_aytemiz';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final splashViewModel = watch(splashViewProvider);

    {
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
    }
  }
}

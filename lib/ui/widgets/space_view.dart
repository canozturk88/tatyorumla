import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceView extends StatelessWidget {
  const SpaceView({required this.height, required this.width});
  final num height;
  final num width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: ScreenUtil().setHeight(height), width: ScreenUtil().setHeight(width));
  }
}

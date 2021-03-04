import 'package:flutter/material.dart';
import '../shared/styles/colors.dart';
import '../shared/view_helper/ui_helper.dart';

class HeaderItemWidget extends StatelessWidget {
  const HeaderItemWidget({
    Key key,
    this.title,
    this.bigSubTitle,
    this.bigSubTitleFontSize,
    this.smallSubTitle,
    this.isWeather = false,
    this.isSlider = false,
    this.weatherStatus,
    this.weatherIcon,
  }) : super(key: key);
  final String title;
  final String bigSubTitle;
  final String smallSubTitle;
  final bool isWeather;
  final bool isSlider;
  final String weatherStatus;
  final String weatherIcon;
  final double bigSubTitleFontSize;

  @override
  Widget build(BuildContext context) {
    return _buildColumn;
  }

  Column get _buildColumn {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: UIHelper.dynamicHeight(36), fontWeight: FontWeight.w400, color: textGrey2),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: UIHelper.dynamicHeight(30),
        ),
        isWeather
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(weatherStatus ?? '-',
                      style: TextStyle(
                        color: white,
                        fontSize: UIHelper.dynamicHeight(48),
                        fontWeight: FontWeight.w900,
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: UIHelper.dynamicHeight(20)),
                    child: weatherIcon != null ? Image.network(weatherIcon, width: UIHelper.dynamicHeight(40)) : Container(),
                  )
                ],
              )
            : Column(
                children: <Widget>[
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: bigSubTitle ?? '-',
                            style: TextStyle(
                              color: white,
                              fontSize: UIHelper.dynamicHeight(bigSubTitleFontSize ?? 40),
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(
                            text: bigSubTitle != null ? smallSubTitle ?? '' : '',
                            style: TextStyle(
                              color: white,
                              fontSize: UIHelper.dynamicHeight(36),
                              fontWeight: FontWeight.w700,
                            )),
                      ])),
                ],
              ),
        Container(
          height: isSlider ? 0 : UIHelper.dynamicHeight(26),
        )
      ],
    );
  }
}

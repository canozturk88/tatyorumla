import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'package:tadayim_bunu/core/viewmodels/customer_profile_view_model.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';
// import 'package:tadayim_bunu/ui/views/customer/change_mail_address_view.dart';
// import 'package:tadayim_bunu/ui/views/customer/change_password_view.dart';
// import 'package:tadayim_bunu/ui/widgets/list_group_item_widget.dart';
import '../baseview.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';

class CustomerProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<CustomerProfileView> {
  late CustomerProfileViewModel customerProfileViewModel;
  @override
  Widget build(BuildContext context) {
    //can__
    // ScreenUtil.instance.init(context);
    return BaseView<CustomerProfileViewModel>(
      onModelReady: (model) {
        model.setContext(context);
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: UIHelper.PEAR_PRIMARY_COLOR,
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: UIHelper.dynamicHeight(810),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/default_user_image.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 0),
                            child: Container(
                                decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [UIHelper.PEAR_PRIMARY_COLOR, Colors.white]),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: kToolbarHeight,
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: UIHelper.dynamicHeight(48)),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).pushNamed('/');
                                          },
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottom();
                                    },
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage('assets/images/default_user_image.png'),
                                        backgroundColor: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(UIHelper.dynamicHeight(24)),
                                  child: Text(
                                    SharedManager().custmerDetail!.nameSurname!,
                                    // SharedManager().loginRequest.nameSurname,
                                    style: TextStyle(color: Colors.white, fontSize: UIHelper.dynamicScaleSp(54), fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     showModalBottom();
                                //   },
                                //   child: Text(
                                //     ' Değiştir',
                                //     style: TextStyle(
                                //       color: UIHelper.WHITE,
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: UIHelper.dynamicHeight(20),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(UIHelper.dynamicHeight(36)),
                      child: Container(
                          child: Column(children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: UIHelper.dynamicScaleSp(72),
                          ),
                          title: Align(
                            child: Text(
                              'Hesap Bilgileri',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: UIHelper.dynamicScaleSp(72)),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            // ListGroupItemView(
                            //   title: 'Üye Bilgilerim',
                            //   onPress: () {
                            //     Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileInfoView()));
                            //   },
                            // ),
                            // ListGroupItemView(
                            //   key: customerProfileViewModel.,
                            //   title: 'Şifre Değiştir',
                            //   onPress: () {
                            //     Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordView()));
                            //   },
                            // ),
                            // ListGroupItemView(
                            //   title: 'E-Posta Değiştir',
                            //   onPress: () {
                            //     Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeMailAddressView()));
                            //   },
                            // ),
                            // ListGroupItemView(
                            //   title: 'Bildirimlerim',
                            //   onPress: () {
                            //     Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerProfileView()));
                            //   },
                            // ),
                          ],
                        )
                      ])),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future showModalBottom() async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(UIHelper.Space0),
            child: Container(
                decoration: BoxDecoration(
                  color: UIHelper.PEAR_PRIMARY_COLOR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(UIHelper.Space15),
                    topRight: Radius.circular(UIHelper.Space15),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    UIHelper.verticalSpaceSmall(),
                    // NothcWidget(),
                    // _listMenuItems,
                  ],
                )),
          ),
        );
      },
    );
  }
}

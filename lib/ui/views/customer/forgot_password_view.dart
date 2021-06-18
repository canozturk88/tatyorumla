import 'package:flutter/material.dart';
import 'package:tadayim_bunu/core/mixin/validation_mixin.dart';
import 'package:tadayim_bunu/core/viewmodels/forgot_password_view_model.dart';
import 'package:tadayim_bunu/ui/shared/styles/colors.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';

import '../baseview.dart';
import '../custom_button.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State with ValidationMixin {
  late ForgotPasswordViewModel forgotPasswordViewModel;
  final formKey = GlobalKey<FormState>();
  String mailAddres = '';

  @override
  Widget build(BuildContext context) {
    //can__
    // ScreenUtil.instance.init(context);
    return BaseView<ForgotPasswordViewModel>(onModelReady: (model) {
      model.setContext(context);
      forgotPasswordViewModel = model;
    }, builder: (context, model, child) {
      return Scaffold(
        key: forgotPasswordViewModel.forgotPasswordViewModel,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _helloText,
                  _description,
                  _formField,
                  _loginButton,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget get _formField => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                // _textFieldEmail(
                //   UIHelper.email,
                //   false,
                // ),
                // _textFieldPassword(UIHelper.password, true),
              ],
            ),
          ),
        ),
      );

  // Widget _textFieldEmail(String text, bool obscure) => Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
  //       child: TextFormField(
  //         style: TextStyle(color: Colors.white),
  //         textAlign: TextAlign.left,
  //         obscureText: obscure,
  //         autocorrect: false,
  //         validator: validateEmail,
  //         cursorColor: Colors.white,
  //         maxLines: 1,
  //         onSaved: (String value) {
  //           mailAddres = value;
  //         },
  //         decoration: InputDecoration(
  //           focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  //           prefixIcon: Padding(
  //             padding: const EdgeInsets.only(right: 10.0),
  //             child: IconButton(
  //               icon: Icon(Icons.email),
  //               color: Colors.white,
  //               onPressed: () {},
  //             ),
  //           ),
  //           hintText: text,
  //           hintStyle: TextStyle(color: Colors.white),
  //         ),
  //       ),
  //     );

  Widget get _description => Text(UIHelper.forgatPasswordAccount, style: _helloTextStyle(30));

  Widget get _loginButton => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: InkWell(
          borderRadius: loginButtonBorderStyle,
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              goToRenewPassword(mailAddres);
            }
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: loginButtonBorderStyle),
            height: UIHelper.dynamicHeight(200),
            width: UIHelper.dynamicWidth(1000),
            child: Center(
              child: Text(
                UIHelper.goOn,
                style: TextStyle(
                  color: mainColor,
                  fontSize: UIHelper.dynamicSp(40),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _helloText => Text(UIHelper.hello, style: _helloTextStyle(70));

  TextStyle _helloTextStyle(double fontSize) => TextStyle(
        color: Colors.white,
        fontSize: UIHelper.dynamicSp(fontSize),
        fontWeight: FontWeight.bold,
      );

  Future<void> goToRenewPassword(String mailAddres) async {
    forgotPasswordViewModel.goToRenewPassword(mailAddres) as bool;
    //   if (!returnValue) {
    //   } else {
    //     _showDialog('E-posta adresine ait kullanıcı bulunamadı.');
    //   }
    // } else {
    //   _showDialog('Lütfen internet bağlantınızı kontrol ediniz.');
    //}
  }

  // void _showDialog(String contextText) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Bildiri'),
  //         content: Text(contextText),
  //         actions: <Widget>[
  //           // usually buttons at the bottom of the dialog
  //           FlatButton(
  //             child: Text('Kapat'),
  //             onPressed: () {},
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

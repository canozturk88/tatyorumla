import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/apis/account/account_api.dart';
import '../../../core/mixin/validation_mixin.dart';
import '../../../core/models/user/customer.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';
import 'renew_password_view.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = '/forgotPassword';

  @override
  State<StatefulWidget> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String mailAddres = '';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
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
                _textFieldEmail(
                  UIHelper.email,
                  false,
                ),
                // _textFieldPassword(UIHelper.password, true),
              ],
            ),
          ),
        ),
      );

  Widget _textFieldEmail(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
          obscureText: obscure,
          autocorrect: false,
          validator: validateEmail,
          cursorColor: Colors.white,
          maxLines: 1,
          onSaved: (String value) {
            mailAddres = value;
          },
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(Icons.email),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget get _description => Text(UIHelper.forgatPasswordAccount, style: _helloTextStyle(30));

  Widget get _loginButton => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: InkWell(
          borderRadius: _loginButtonBorderStyle,
          onTap: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              goToRenewPassword(mailAddres);
            }
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: _loginButtonBorderStyle),
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

  // Widget emailNameField() {
  //   return TextFormField(
  //     keyboardType: TextInputType.emailAddress,
  //     decoration:
  //         InputDecoration(labelText: "E-Mail", hintText: "mail@mail.com"),
  //     validator: validateEmail,
  //     onSaved: (String value) {
  //       mailAddres = value;
  //     },
  //   );
  // }

  TextStyle _helloTextStyle(double fontSize) => TextStyle(
        color: Colors.white,
        fontSize: UIHelper.dynamicSp(fontSize),
        fontWeight: FontWeight.bold,
      );
  BorderRadius get _loginButtonBorderStyle => BorderRadius.only(
        bottomRight: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        topLeft: Radius.circular(20),
      );

  Future<void> goToRenewPassword(String mailAddres) async {
    var isConncet = false;

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConncet = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isConncet = true;
    }
    if (isConncet) {
      await AccountApiServices.forgotPassword(mailAddres).then((response) {
        setState(() {
          if (response.statusCode == 200) {
            Map userMap = jsonDecode(response.body);
            var userLogin = Customer.fromJson(userMap);

            Navigator.push(context, MaterialPageRoute(builder: (_context) => RenewPassword(userLogin)));
          } else {
            _showDialog('E-posta adresine ait kullanıcı bulunamadı.');
          }
        });
      });
    } else {
      _showDialog('Lütfen internet bağlantınızı kontrol ediniz.');
    }
  }

  void _showDialog(String contextText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bildiri'),
          content: Text(contextText),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text('Kapat'),
              onPressed: () {
                // Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/myProfil");
              },
            ),
          ],
        );
      },
    );
  }
}

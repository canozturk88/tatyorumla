import 'package:flutter/material.dart';
import 'package:tadayim_bunu/core/models/user/save_customer_command.dart';
import '../../../core/mixin/validation_mixin.dart';
import '../../../core/viewmodels/customer_login_view_model.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';

import '../custom_button.dart';
import 'customer_signup_view.dart';
import 'forgot_password_view.dart';

import '../baseview.dart';

class CustomerSignInView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerLoginState();
}

class CustomerLoginState extends State with ValidationMixin {
  CustomerSignInViewModel _loginViewModel;
  final formKey = GlobalKey<FormState>();
  final custmer = SaveCustomerCommand('', '', '');
  @override
  Widget build(BuildContext context) {
    return BaseView<CustomerSignInViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        _loginViewModel = model;
      },
      builder: (context, model, child) {
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
                    _forgetPassword,
                    _loginButton,
                    _signup,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get _loginButton => Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: InkWell(
            borderRadius: loginButtonBorderStyle,
            onTap: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                _loginViewModel.saveCustomer(custmer);
              }
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: loginButtonBorderStyle),
              height: UIHelper.dynamicHeight(200),
              width: UIHelper.dynamicWidth(1000),
              child: Center(
                child: Text(
                  UIHelper.signIn,
                  style: TextStyle(
                    color: mainColor,
                    fontSize: UIHelper.dynamicSp(40),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

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
                _textFieldPassword(UIHelper.password, true),
              ],
            ),
          ),
        ),
      );

  Widget _textFieldEmail(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
          obscureText: obscure,
          autocorrect: false,
          validator: validateEmail,
          onSaved: (String value) {
            custmer.mailAddress = value;
          },
          cursorColor: Colors.white,
          maxLines: 1,
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

  Widget _textFieldPassword(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
          obscureText: obscure,
          autocorrect: false,
          cursorColor: Colors.white,
          onSaved: (String value) {
            custmer.password = value;
          },
          maxLines: 1,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(Icons.vpn_key),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget get _description => Text(UIHelper.signAccount, style: _helloTextStyle(30));

  Widget get _forgetPassword => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 30,
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_context) => ForgotPassword()));
                },
                child: Text(UIHelper.forgetPassword, style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
            )),
      );

  Widget get _signup => Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 30,
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_context) => CustomerSignUpView()));
                },
                child: Text(UIHelper.dontHaveAnAccount, style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
            )),
      );

  Widget get _helloText => Text(UIHelper.hello, style: _helloTextStyle(70));

  Widget passwordNameField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Şifre', hintText: 'Şifre'),
    );
  }

  TextStyle _helloTextStyle(double fontSize) => TextStyle(
        color: Colors.white,
        fontSize: UIHelper.dynamicSp(fontSize),
        fontWeight: FontWeight.bold,
      );
  // BorderRadius get _loginButtonBorderStyle => BorderRadius.only(
  //       bottomRight: Radius.circular(20),
  //       topRight: Radius.circular(20),
  //       bottomLeft: Radius.circular(20),
  //       topLeft: Radius.circular(20),
  //     );
}

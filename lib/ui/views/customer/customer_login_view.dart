import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadayim_bunu/core/models/user/save_customer_command.dart';
import '../../../core/mixin/validation_mixin.dart';
import '../../../core/viewmodels/customer_login_view_model.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';

import '../custom_button.dart';
import '../loading_state_view_model.dart';
import 'customer_signup_view.dart';
import 'forgot_password_view.dart';

class CustomerSignInView extends ConsumerWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  var customerSignInScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: '_customerSignInScaffoldKey');

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final customerSignInViewModel = watch(customerSignInViewProvider);
    return Scaffold(
      key: customerSignInScaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _helloText,
                _description,
                _formField(context),
                _forgetPassword,
                _loginButton(context),
                _signup,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) => Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: InkWell(
            borderRadius: loginButtonBorderStyle,
            onTap: () {
              _formKey.currentState!.save();
              if (_formKey.currentState!.validate()) {
                var eMail = _formKey.currentState!.value['eMail'].toString().trimRight();
                var password = _formKey.currentState!.value['password'].toString().trimRight();

                // context.read(loadingStateProvider).whileLoading(() {
                context.read(customerSignInViewProvider.notifier).loginCustomer(eMail, password);
                // });
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

  Widget _formField(BuildContext context) => Padding(
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
                _textFieldEmail(UIHelper.email, false, context),
                _textFieldPassword(UIHelper.password, true, context),
              ],
            ),
          ),
        ),
      );

  Widget _textFieldEmail(String text, bool obscure, BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: FormBuilderTextField(
          style: TextStyle(color: Colors.white),
          name: 'eMail',
          obscureText: obscure,
          cursorColor: Colors.white,
          // decoration: InputDecoration(
          //   labelText: text,
          // ),

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
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context, errorText: 'Mail geçerli değildir.'),
            FormBuilderValidators.email(context, errorText: 'Mail geçerli değildir.'),
            FormBuilderValidators.min(context, 7),
          ]),
          keyboardType: TextInputType.emailAddress,
        ),
      );

  Widget _textFieldPassword(String text, bool obscure, BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: FormBuilderTextField(
          style: TextStyle(color: Colors.white),
          name: 'password',
          obscureText: obscure,
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
          // onChanged: _onChanged,
          // valueTransformer: (text) => num.tryParse(text),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context, errorText: 'Şifre en az 8 karekter olmalı'),
            // FormBuilderValidators.numeric(context),
            FormBuilderValidators.max(context, 16, errorText: 'Şifre en fazla 16 karekter olmalı'),
            FormBuilderValidators.min(context, 8, errorText: 'Şifre en az 8 karekter olmalı'),
          ]),
          keyboardType: TextInputType.visiblePassword,
        ),
      );

  Widget get _description => Text(UIHelper.signAccount, style: _helloTextStyle(30));

  Widget get _forgetPassword => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 40,
              child: TextButton(
                // style: ButtonStyle(
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0), side: BorderSide(color: Colors.red)))),
                //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (_context) => ForgotPassword()));
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
              height: 40,
              child: TextButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (_context) => CustomerSignUpView()));
                },
                child: Text(UIHelper.dontHaveAnAccount, style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
            )),
      );

  Widget get _helloText => Text(UIHelper.hello, style: _helloTextStyle(70));

  TextStyle _helloTextStyle(double fontSize) => TextStyle(
        color: Colors.white,
        fontSize: UIHelper.dynamicSp(fontSize),
        fontWeight: FontWeight.bold,
      );

  // snackBarWarningMessage(GlobalKey<ScaffoldState> customerSignInScaffoldKey, String _message) async {
  //   // setState(ViewState.Idle);
  //   await UIHelper.showSnackBar(key: customerSignInScaffoldKey, child: Text(_message));
  // }
}

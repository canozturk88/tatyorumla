import 'package:flutter/material.dart';
import 'package:tadayim_bunu/core/models/user/save_customer_command.dart';
import 'package:tadayim_bunu/core/viewmodels/renew_password_view_model.dart';
import '../../../core/mixin/validation_mixin.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';
import '../baseview.dart';

class RenewPasswordView extends StatefulWidget {
  final SaveCustomerCommand customer;
  RenewPasswordView(this.customer);

  @override
  State<StatefulWidget> createState() => RenewPasswordState(customer);
}

class RenewPasswordState extends State with ValidationMixin {
  late RenewPasswordViewModel renewPasswordViewModel;
  SaveCustomerCommand customer;
  RenewPasswordState(this.customer);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //can__
    // ScreenUtil.instance.init(context);
    return BaseView<RenewPasswordViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        renewPasswordViewModel = model;
      },
      builder: (context, model, child) {
        return Scaffold(
          key: renewPasswordViewModel.renewPasswordScaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          backgroundColor: UIHelper.PEAR_PRIMARY_COLOR,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
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
      },
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
                //  _textFieldPassword(UIHelper.password, true),
                // _textFieldPassword(UIHelper.passwordAgain, true),
              ],
            ),
          ),
        ),
      );

  // Widget _textFieldPassword(String text, bool obscure) => Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
  //       child: TextFormField(
  //         style: TextStyle(color: Colors.white),
  //         textAlign: TextAlign.left,
  //         obscureText: obscure,
  //         autocorrect: false,
  //         cursorColor: Colors.white,
  //         maxLines: 1,
  //         onSaved: (String value) {
  //           customer.password = value;
  //         },
  //         decoration: InputDecoration(
  //           focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  //           prefixIcon: Padding(
  //             padding: const EdgeInsets.only(right: 10.0),
  //             child: IconButton(
  //               icon: Icon(Icons.vpn_key),
  //               color: Colors.white,
  //               onPressed: () {},
  //             ),
  //           ),
  //           hintText: text,
  //           hintStyle: TextStyle(color: Colors.white),
  //         ),
  //       ),
  //     );

  Widget get _description => Text(UIHelper.renewPasswordAccount, style: _helloTextStyle(30));

  Widget get _loginButton => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: InkWell(
          borderRadius: _loginButtonBorderStyle,
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              renewPasswordViewModel.saveNewPassword(customer.password!);
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
  BorderRadius get _loginButtonBorderStyle => BorderRadius.only(
        bottomRight: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        topLeft: Radius.circular(20),
      );
}

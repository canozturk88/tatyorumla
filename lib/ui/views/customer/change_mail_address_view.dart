import 'package:tadayim_bunu/core/mixin/validation_mixin.dart';
import 'package:tadayim_bunu/core/viewmodels/change_mail_address_view_model.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';
import 'package:flutter/material.dart';
import '../baseview.dart';
import '../custom_button.dart';

class ChangeMailAddressView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangeMailAddressState();
}

class ChangeMailAddressState extends State with ValidationMixin {
  late ChangeMailAddressViewModel changeMailAddressViewModel;
  final formKey = GlobalKey<FormState>();
  TextEditingController usermail = TextEditingController();
  String password = '';
  String newEmail = '';

  @override
  Widget build(BuildContext context) {
    //can__
    // ScreenUtil.instance.init(context);
    return BaseView<ChangeMailAddressViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        changeMailAddressViewModel = model;
      },
      builder: (context, model, child) {
        return Scaffold(
          key: changeMailAddressViewModel.changeMailAddressScaffoldKey,
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
                // _textFieldOldPassword(UIHelper.oldPassword, true),
                // _textFieldEmail(
                //   UIHelper.newemail,
                //   false,
                // ),
              ],
            ),
          ),
        ),
      );

  // Widget _textFieldOldPassword(String text, bool obscure) => Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
  //       child: TextFormField(
  //         style: TextStyle(color: Colors.white),
  //         textAlign: TextAlign.left,
  //         obscureText: obscure,
  //         autocorrect: false,
  //         cursorColor: Colors.white,
  //         maxLines: 1,
  //         onSaved: (String value) {
  //           password = value;
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

  Widget get _description => Text(UIHelper.changPasswprdExplanation, style: _helloTextStyle(30));

  // Widget _textFieldEmail(String text, bool obscure) => Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
  //       child: TextFormField(
  //         controller: usermail,
  //         style: TextStyle(color: Colors.white),
  //         textAlign: TextAlign.left,
  //         keyboardType: TextInputType.emailAddress,
  //         // obscureText: obscure,
  //         autocorrect: false,
  //         readOnly: false,
  //         validator: validateEmail,
  //         onSaved: (String value) {
  //           newEmail = value;
  //         },
  //         cursorColor: Colors.white,
  //         maxLines: 1,
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

  Widget get _loginButton => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: InkWell(
          borderRadius: loginButtonBorderStyle,
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              changeMailAddressViewModel.saveNewEmail(password, newEmail);
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
                  color: UIHelper.PEAR_PRIMARY_COLOR,
                  fontSize: UIHelper.dynamicSp(40),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _helloText => Text('E-Posta Adresi Değiştir', style: _helloTextStyle(70));

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
}

import 'package:tadayim_bunu/core/mixin/validation_mixin.dart';
import 'package:tadayim_bunu/core/models/user/save_customer_command.dart';
import 'package:tadayim_bunu/core/services/shared_prefernces_api.dart';
import 'package:tadayim_bunu/core/viewmodels/my_profile_info_view_model.dart';
import 'package:tadayim_bunu/ui/shared/view_helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../baseview.dart';
import '../custom_button.dart';

class MyProfileInfoView extends StatefulWidget {
  static const String routeName = '/myprofileInfo';

  @override
  State<StatefulWidget> createState() => MyProfileInfoState();
}

class MyProfileInfoState extends State with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  MyProfileInfoViewModel _myProfileInfoViewModel;
  TextEditingController userName = TextEditingController();
  TextEditingController usermail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  String newPassword = '';
  String newPasswordAgain = '';

  SaveCustomerCommand user = SaveCustomerCommand('', '', '');
  @override
  Widget build(BuildContext context) {
    getCustomerDetail();
    ScreenUtil.instance.init(context);
    return BaseView<MyProfileInfoViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        _myProfileInfoViewModel = model;
      },
      builder: (context, model, child) {
        return Scaffold(
          key: _myProfileInfoViewModel.myProfileInfoViewModel,
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
                _textFielCustomeName(
                  UIHelper.nameSurname,
                  false,
                ),
                _textFieldEmail(
                  UIHelper.email,
                  false,
                ),
                _textFieldPhone(UIHelper.phone, true),
              ],
            ),
          ),
        ),
      );

  Widget _textFielCustomeName(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: TextFormField(
          controller: userName,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          obscureText: obscure,
          autocorrect: false,
          validator: validateFirtsName,
          autofocus: false,
          // onChanged: (text) => {userName.text},

          // onSaved: (String value) {
          //   //  customer.nameSurname = value;can
          // },
          cursorColor: Colors.white,
          maxLines: 1,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(Icons.account_circle),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget _textFieldEmail(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: TextFormField(
          controller: usermail,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.emailAddress,
          // obscureText: obscure,
          autocorrect: false,
          readOnly: true,
          validator: validateEmail,
          onSaved: (String value) {
            //    customer.mailAddress = value;
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

  Widget _textFieldPhone(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: TextFormField(
          controller: userPhone,
          keyboardType: TextInputType.phone,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
          readOnly: true,
          // obscureText: obscure,
          autocorrect: false,
          maxLength: 10,
          validator: validatePhone,
          onSaved: (String value) {
            //  customer.phone = value;
          },
          cursorColor: Colors.white,
          maxLines: 1,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(Icons.phone),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget get _description => Text(UIHelper.changeInfoStatus, style: _helloTextStyle(30));

  Widget get _loginButton => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: InkWell(
          borderRadius: loginButtonBorderStyle,
          onTap: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              _myProfileInfoViewModel.updateProfilInfo(userName.text);
              // if (returnValue != null) {
              //   // ignore: unrelated_type_equality_checks
              //   if (returnValue != false) {
              //     _showDialog('Bilgileriniz Güncellenmiştir.', true);
              //   }
              // } else {
              //   _showDialog('Lütfen internet bağlantınızı kontrol ediniz.', false);
              // }
            }
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: loginButtonBorderStyle),
            height: UIHelper.dynamicHeight(200),
            width: UIHelper.dynamicWidth(1000),
            child: Center(
              child: Text(
                'Güncelle',
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

  Widget get _helloText => Text(UIHelper.customInfo, style: _helloTextStyle(70));

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

  // Future<void> saveNewPassword(String nameSurname) async {
  //   var isConncet = false;

  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     isConncet = true;
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     isConncet = true;
  //   }
  //   if (isConncet) {
  //     var updateuser = SharedManager().loginRequest;
  //     updateuser.nameSurname = nameSurname;

  //     await AccountApiServices.updateUser(updateuser).then((response) {
  //       setState(() {
  //         if (response.statusCode == 204) {
  //           // Map userMap = jsonDecode(response.body);
  //           // var userLogin = User.fromJson(userMap);
  //           userStatus = 1;

  //           SharedManager().loginRequest = updateuser;

  //           _showDialog('Bilgileriniz Güncellenmiştir.', true);
  //         } else {
  //           _showDialog('Hata', false);
  //         }
  //       });
  //     });
  //   } else {
  //     _showDialog('Lütfen internet bağlantınızı kontrol ediniz.', false);
  //   }
  // }

  // ignore: always_declare_return_types
  getCustomerDetail() async {
    if (SharedManager().custmerDetail != null) {
      user = SharedManager().custmerDetail as SaveCustomerCommand;

      userName.text = user.nameSurname;
      usermail.text = user.mailAddress;
      //  userPhone.text = user.phone;
    } else {
      var _token = SharedManager().jwtToken;
      if (_token != null) {
        // setState(ViewState.Busy);
        // tokenRequestModel.token = SharedManager().token;
        // var customerDetailResponse = await _loginService.getCustomerDetail(
        //     tokenRequestModel: tokenRequestModel);

        // if (customerDetailResponse.data is CustomerDetailResponse) {
        //   customerDetail = customerDetailResponse.data.customerDetail;
        //   userName.text = customerDetail.name;
        //   userSurname.text = customerDetail.surname;
        //   userMobilePhone.text = customerDetail.mobileNumber;
        //   userEmail.text = customerDetail.email;
        //   userAddress.text = customerDetail.address;
        //   userPlate.text = customerDetail.vehiclePlateNumber;
        //   userCardNo.text = customerDetail.cardNumber;
        //   userTCNo.text = customerDetail.tCNumber;
        //   SharedManager().customerDetail =
        //       customerDetailResponse.data.customerDetail;
        // }

        // setState(ViewState.Idle);
      }
    }
  }

  // void _showDialog(String contextText, bool status) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Bildiri'),
  //         content: Text(contextText),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Kapat'),
  //             onPressed: () {
  //               if (status) Navigator.of(context).pop();
  //               Navigator.of(context).pushNamed('/myAccount');
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

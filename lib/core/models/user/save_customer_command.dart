import 'dart:convert';

String postToJsonUser(SaveCustomerCommand data) {
  final dyn = data.toJson(data);
  return json.encode(dyn);
}

class SaveCustomerCommand {
  String nameSurname;
  String mailAddress;
  String password;
  DateTime createdDate;
  int userStatus;
  String userToken;

  SaveCustomerCommand(this.nameSurname, this.mailAddress, this.password);

  SaveCustomerCommand.fromJson(Map<String, dynamic> json) {
    nameSurname = json['nameSurname'];
    mailAddress = json['mailAddress'];
    password = json['password'];
    createdDate = json['createdDate'];
    userStatus = json['userStatus'];
    userToken = json['userToken'];
    // id = json['Id'];
    // if (json['productComments'] != null) {
    //   productComments = <ProductComment>[];
    //   json['productComments'].forEach((v) {
    //     productComments.add(ProductComment.fromJson(v));
    //   });
    // }
  }

  SaveCustomerCommand.withId(this.mailAddress);

  Map<String, dynamic> toJson(SaveCustomerCommand customer) {
    final data = <String, dynamic>{};
    data['nameSurname'] = customer.nameSurname;
    data['mailAddress'] = customer.mailAddress;
    data['password'] = customer.password;
    data['createdDate'] = '2021-03-10T22:54:44.698Z';
    data['userStatus'] = 0;
    data['userToken'] = '';
    return data;
  }
}

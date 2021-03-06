import 'dart:convert';

String postToJsonUser(CustomerResponse data) {
  final dyn = data.toJson(data);
  return json.encode(dyn);
}

class CustomerResponse {
  int? id;
  String? mailAddress;
  String? nameSurname;
  int? userStatus;
  // DateTime createdDate;
  // List<ProductComment> productComments;
  String? userToken;

  CustomerResponse(this.mailAddress, this.nameSurname, this.userStatus, this.userToken, this.id);

  CustomerResponse.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    nameSurname = json['nameSurname'];
    mailAddress = json['mailAddress'];
    userStatus = json['userStatus'];
    // createdDate = json['createdDate'];
    if (json['userToken'] != null) {
      userToken = json['userToken'];
    } else {
      userToken = '';
    }

    // if (json['productComments'] != null) {
    //   productComments = <ProductComment>[];
    //   json['productComments'].forEach((v) {
    //     productComments.add(ProductComment.fromJson(v));
    //   });
    // }
  }

  CustomerResponse.withId(this.id, this.mailAddress, this.nameSurname, this.userStatus, this.userToken);

  Map<String, dynamic> toJson(CustomerResponse customer) {
    final data = <String, dynamic>{};
    data['nameSurname'] = customer.nameSurname;
    data['mailAddress'] = customer.mailAddress;
    data['userStatus'] = customer.userStatus;
    data['userToken'] = customer.userToken;
    data['id'] = customer.id;
    // if (customer.productComments != null) {
    //   data['productComments'] = customer.productComments.map((e) => e.toJson()).toList();
    // }
    return data;
  }
}

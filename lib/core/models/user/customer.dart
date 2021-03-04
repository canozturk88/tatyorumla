import 'dart:convert';
import '../comment/product_comment.dart';

String postToJsonUser(Customer data) {
  final dyn = data.toJson(data);
  return json.encode(dyn);
}

class Customer {
  String id;
  String mailAddress;
  String nameSurname;
  String password;
  String phone;
  // String avatarUrl;
  bool isKvkk;
  List<ProductComment> productComments;

  Customer(this.nameSurname, this.mailAddress, this.phone, this.password);

  Customer.fromJson(Map<String, dynamic> json) {
    nameSurname = json['nameSurname'];
    mailAddress = json['mailAddress'];
    password = json['password'];
    isKvkk = json['isKvkk'];
    id = json['Id'];
    if (json['productComments'] != null) {
      productComments = <ProductComment>[];
      json['productComments'].forEach((v) {
        productComments.add(ProductComment.fromJson(v));
      });
    }
  }

  Customer.withId(this.id, this.mailAddress);

  Map<String, dynamic> toJson(Customer customer) {
    final data = <String, dynamic>{};
    data['mailAddress'] = customer.mailAddress;
    data['nameSurname'] = customer.nameSurname;
    data['phone'] = customer.phone;
    data['password'] = customer.password;
    data['isKvkk'] = customer.isKvkk;
    data['Id'] = customer.id;
    if (customer.productComments != null) {
      data['productComments'] = customer.productComments.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

import 'package:networking/networking.dart';

class ErrorResponse implements SerializableObject<ErrorResponse> {
  String responseCode;
  String responseDescription;

  ErrorResponse({this.responseCode, this.responseDescription});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ResponseCode'] = responseCode;
    data['ResponseDescription'] = responseDescription;
    return data;
  }

  @override
  ErrorResponse fromJson(Map<String, dynamic> json) {
    return ErrorResponse.fromJson(json);
  }
}

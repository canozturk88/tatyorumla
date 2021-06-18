class ErrorResponse {
  String? responseCode;
  String? responseDescription;

  ErrorResponse({required this.responseCode, required this.responseDescription});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ResponseCode'] = responseCode;
    data['ResponseDescription'] = responseDescription;
    return data;
  }

  ErrorResponse fromJson(Map<String, dynamic> json) {
    return ErrorResponse.fromJson(json);
  }
}

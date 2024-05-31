class SignupResponseModel {
  SignupResponseModel({
      this.code, 
      this.message, 
      this.data,});

  SignupResponseModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? code;
  String? message;
  Data? data;
SignupResponseModel copyWith({  num? code,
  String? message,
  Data? data,
}) => SignupResponseModel(  code: code ?? this.code,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.status,});

  Data.fromJson(dynamic json) {
    status = json['status'];
  }
  num? status;
Data copyWith({  num? status,
}) => Data(  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }

}
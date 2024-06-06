class LoginResponseModel {
  LoginResponseModel({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
    this.message,
  });

  LoginResponseModel.fromJson(dynamic json) {
    token = json['token'];
    userEmail = json['user_email'];
    userNicename = json['user_nicename'];
    userDisplayName = json['user_display_name'];
    message = json['message'];
  }

  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;
  String? message;

  LoginResponseModel copyWith({
    String? token,
    String? userEmail,
    String? userNicename,
    String? userDisplayName,
    String? message,
  }) =>
      LoginResponseModel(
        token: token ?? this.token,
        userEmail: userEmail ?? this.userEmail,
        userNicename: userNicename ?? this.userNicename,
        userDisplayName: userDisplayName ?? this.userDisplayName,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['user_email'] = userEmail;
    map['user_nicename'] = userNicename;
    map['user_display_name'] = userDisplayName;
    map['message'] = message;
    return map;
  }
}

class LoginModel {
  LoginModel({
    this.username,
    this.password,

  });

  LoginModel.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
  }

  String? username;
  String? password;

  LoginModel copyWith({
    String? username,
    String? password,
  }) =>
      LoginModel(
        username: username ?? this.username,
        password: password ?? this.password,

      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    return map;
  }
}

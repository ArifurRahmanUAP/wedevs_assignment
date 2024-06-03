class SignupModel {
  SignupModel({
    this.username,
    this.email,
    this.password,

  });

  SignupModel.fromJson(dynamic json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];

  }
  String? username;
  String? email;
  String? password;

  SignupModel copyWith({
    String? username,
    String? email,
    String? password,
  }) =>
      SignupModel(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,

      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['email'] = email;
    map['password'] = password;

    return map;
  }
}

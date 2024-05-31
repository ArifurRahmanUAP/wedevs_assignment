import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/main.dart';

import '../../data/model/login_model.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});

  final isPasswordVisible = false.obs;
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userEmailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginPasswordVisibilityButtonPressed() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }


  void loginButtonPressed() {
    LoginModel loginModel = LoginModel(
      username: userEmailController.text,
      password: passwordController.text,
    );
    userLoginApiCall(loginModel: loginModel);
  }

  void userLoginApiCall({required LoginModel loginModel}) async {
    final response = await loginUseCase(loginModel);
    response?.fold((failure) async {
    }, (data) async {
      session.createSession(data);
    });
  }
}

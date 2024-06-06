import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/main.dart';
import 'package:wedevs_assignment/src/core/routes/router.dart';

import '../../../../core/routes/route_name.dart';
import '../../data/model/login_model.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});

  final isPasswordVisible = false.obs;
  final isLoginLoading = false.obs;
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

  void loginButtonPressed({
    required BuildContext context,
  }) {
    LoginModel loginModel = LoginModel(
      username: userEmailController.text,
      password: passwordController.text,
    );
    userLoginApiCall(loginModel: loginModel, context: context);
  }

  void userLoginApiCall({
    required LoginModel loginModel,
    required BuildContext context,
  }) async {
    try {
      isLoginLoading.value = true;
      final response = await loginUseCase(loginModel);
      response?.fold((failure) async {

      }, (data) async {
        session.createSession(data);
        RouteGenerator.pushNamedAndRemoveAll(context, Routes.landingPage);
      });
    } finally {
      isLoginLoading.value = false;
    }
  }
}

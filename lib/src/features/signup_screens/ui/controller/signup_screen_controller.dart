import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/features/signup_screens/domain/repositories/signup_repositories.dart';

import '../../../../core/di/app_component.dart';
import '../../../../core/utilities/constants.dart';
import '../../data/model/signup_model.dart';
import '../../domain/usecase/user_signup_usecase.dart';

class SignupScreenController extends GetxController {
  SignUpRepositories signUpRepositories;
  final UserSignUpUseCase userSignUpUseCase = locator<UserSignUpUseCase>();
  SignupScreenController({required this.signUpRepositories});

  final userFullNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isPrivacyPolicyCheckboxPressed = false.obs;

  void signUpPasswordVisibilityButtonPressed() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void signUpConfirmPasswordVisibilityButtonPressed() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }


  void signUpButtonPressed() async {
    final SignupModel signupModel = SignupModel(
      username: userFullNameController.text,
      email: userEmailController.text,
      password: confirmPasswordController.text,
    );
    final response = await userSignUpUseCase(signupModel);

    response?.fold((failure) async {
    }, (data) async {
      logger.e(data.toJson());
    });
  }
}

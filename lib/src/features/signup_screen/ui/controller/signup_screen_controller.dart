import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wedevs_assignment/src/features/signup_screen/domain/repositories/signup_repositories.dart';

import '../../../../core/di/app_component.dart';
import '../../../../core/utilities/constants.dart';
import '../../data/model/signup_model.dart';
import '../../domain/usecase/user_signup_usecase.dart';

class SignupScreenController extends GetxController {
  SignUpRepositories signUpRepositories;
  final UserSignUpUseCase userSignUpUseCase = locator<UserSignUpUseCase>();

  SignupScreenController({required this.signUpRepositories});

  final isFinalLoading = false.obs;
  final imgFile = XFile("").obs;
  final ImagePicker _picker = ImagePicker();

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

  void pickImage({required context}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    Map<Permission, PermissionStatus> statues =
        await [Permission.photos].request();
    PermissionStatus? statusPhotos = statues[Permission.photos];
    bool isGranted = statusPhotos == PermissionStatus.granted;
    logger.e(isGranted);
    if (isGranted) {
      // Pick an image
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      imgFile.value = pickedImage!;
    }
  }

  void signUpButtonPressed() async {
    try {
      isFinalLoading.value = true;

      final SignupModel signupModel = SignupModel(
        username: userFullNameController.text,
        email: userEmailController.text,
        password: confirmPasswordController.text,
      );
      final response = await userSignUpUseCase(signupModel);
      response?.fold((failure) async {
        logger.e(failure.message);
      }, (data) async {
        logger.e(data.toJson());
      });
    } finally {
      isFinalLoading.value = false;
    }
  }
}

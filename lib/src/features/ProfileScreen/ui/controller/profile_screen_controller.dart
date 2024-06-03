import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/features/ProfileScreen/domain/usecase/get_profile_data_usecase.dart';

import '../../../../../main.dart';

class ProfileScreenController extends GetxController {
  final GetProfileDataUseCase getProfileDataUseCase;

  ProfileScreenController({required this.getProfileDataUseCase});


  @override
  void onClose() {
    Get.delete<ProfileScreenController>();
    super.onClose();
  }

  final emailController = TextEditingController(text: session.userEmail).obs;
  final fullNameController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final aptSuiteController = TextEditingController().obs;
  final zipCodeController = TextEditingController().obs;

  getProfileData() {}
}

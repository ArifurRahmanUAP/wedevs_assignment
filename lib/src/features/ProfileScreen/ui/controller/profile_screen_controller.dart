import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/core/use-cases/use_case.dart';
import 'package:wedevs_assignment/src/core/utilities/constants.dart';
import 'package:wedevs_assignment/src/features/ProfileScreen/data/model/profile_model.dart';
import 'package:wedevs_assignment/src/features/ProfileScreen/domain/usecase/get_profile_data_usecase.dart';

import '../../../../../main.dart';
import '../../domain/usecase/update_profile_data_usecase.dart';

class ProfileScreenController extends GetxController {
  final GetProfileDataUseCase getProfileDataUseCase;
  final UpdateProfileDataUseCase updateProfileDataUseCase;

  final isProfileLoading = false.obs;
  final isProfileUpdateLoading = false.obs;

  ProfileScreenController({
    required this.getProfileDataUseCase,
    required this.updateProfileDataUseCase,
  });

  final profileModel = ProfileModel().obs;

  final emailController = TextEditingController().obs;
  final fullNameController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final aptSuiteController = TextEditingController().obs;
  final zipCodeController = TextEditingController().obs;

  @override
  onInit() {
    getProfileData();
    super.onInit();
  }

  @override
  void onClose() {
    Get.delete<ProfileScreenController>();
    super.onClose();
  }

  getProfileData() async {
    try {
      isProfileLoading.value = true;
      final response = await getProfileDataUseCase(NoParams());
      response?.fold((failure) async {}, (data) async {
        profileModel.value = data;
        emailController.value.text = profileModel.value.email!;
        fullNameController.value.text = profileModel.value.name!;
        addressController.value.text = session.address!;
        aptSuiteController.value.text = session.aptSuit!;
        zipCodeController.value.text = session.zip!;
      });
    } finally {
      isProfileLoading.value = false;
    }
  }

  Future<String?> updateProfile() async {
    Constants.USER_ID = profileModel.value.id!;

    Map<String, String> data = {};

    if (emailController.value.text.isNotEmpty) {
      data["email"] = emailController.value.text;
    }

    if (fullNameController.value.text.isNotEmpty) {
      data["name"] = fullNameController.value.text;
    }

    if (addressController.value.text.isNotEmpty) {
      data["address"] = addressController.value.text;
    }

    if (aptSuiteController.value.text.isNotEmpty) {
      data["aptSuit"] = aptSuiteController.value.text;
    }

    if (zipCodeController.value.text.isNotEmpty) {
      data["zip"] = zipCodeController.value.text;
    }

    String? error;
    try {
      isProfileUpdateLoading.value = true;
      final response = await updateProfileDataUseCase(data);
      response?.fold((failure) async {}, (data) async {
        profileModel.value = data;
        emailController.value.text = profileModel.value.email!;
        fullNameController.value.text = profileModel.value.name!;
        addressController.value.text = session.address!;
        aptSuiteController.value.text = session.aptSuit!;
        zipCodeController.value.text = session.zip!;
      });
    } finally {
      isProfileUpdateLoading.value = false;
    }
    return error;
  }
}

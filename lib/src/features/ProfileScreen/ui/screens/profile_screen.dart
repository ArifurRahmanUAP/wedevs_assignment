import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/main.dart';
import 'package:wedevs_assignment/src/core/extensions.dart';
import 'package:wedevs_assignment/src/core/routes/router.dart';
import 'package:wedevs_assignment/src/core/utilities/assets_path.dart';
import 'package:wedevs_assignment/src/features/home_screen/ui/controller/home_screen_controller.dart';
import 'package:wedevs_assignment/src/features/login_screen/ui/controller/login_controller.dart';
import 'package:wedevs_assignment/src/features/signup_screen/ui/controller/signup_screen_controller.dart';

import '../../../../core/common_method/common_method.dart';
import '../../../../core/di/app_component.dart';
import '../../../../core/routes/route_name.dart';
import '../controller/profile_screen_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileScreenController = locator<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: const Text(
            "My Account",
            style: TextStyle(
                color: Color(0xFF222455),
                fontSize: 18,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                color: Colors.transparent,
                child: Column(
                  children: [
                    10.ph,
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: DottedBorder(
                          borderType: BorderType.Circle,
                          radius: const Radius.circular(100),
                          padding: const EdgeInsets.all(5),
                          color: const Color(0xFFFFADAD),
                          dashPattern: const [6, 3],
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(150),
                            ),
                            child: Obx(
                              () => Container(
                                height: 115,
                                width: 115,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: profileScreenController
                                                    .profileModel.value.id !=
                                                null
                                            ? NetworkImage(
                                                profileScreenController
                                                    .profileModel
                                                    .value
                                                    .avatarUrls!["96"]!)
                                            : const AssetImage(
                                                    "assets/image_not_found.jpg")
                                                as ImageProvider,
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    30.ph,
                    Obx(() => Text(
                          profileScreenController.profileModel.value.name ?? "",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "Roboto",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        )),
                    Obx(() => Text(
                          profileScreenController.profileModel.value.email ??
                              "",
                          style: const TextStyle(
                              color: Color(0xFF535353),
                              fontSize: 16,
                              fontFamily: "Lato",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),
                        )),
                    5.ph,
                    // GestureDetector(
                    //   onTap: () {
                    //     session.logout().then((value) {
                    //       Get.delete<HomeScreenController>();
                    //       Get.delete<ProfileScreenController>();
                    //       Get.delete<HomeScreenController>();
                    //       Get.delete<SignupScreenController>();
                    //       Get.delete<LoginController>();
                    //       return RouteGenerator.pushNamedAndRemoveAll(
                    //           context, Routes.splashScreenRouteName);
                    //     });
                    //   },
                    //   child: const Text(
                    //     "Log Out",
                    //     style: TextStyle(
                    //         color: Colors.orange,
                    //         fontSize: 16,
                    //         fontStyle: FontStyle.normal,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    25.ph,
                    Card(
                      color: Colors.white,
                      elevation: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.white),
                            child: Column(
                              children: [
                                expandedWidgets(
                                  children: accountExpandData(context: context),
                                  title: "Account",
                                  icon: AssetsPath.PROFILE_BOTTOM_SHEET_LOGO,
                                  isEnable: true,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  height: 2,
                                  color: const Color(0xffe1e4eb),
                                ),
                                expandedWidgets(
                                  children: Container(),
                                  title: "Passwords",
                                  icon: AssetsPath.PASSWORD_ICON,
                                  isEnable: false,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  height: 2,
                                  color: const Color(0xffe1e4eb),
                                ),
                                expandedWidgets(
                                  children: Container(),
                                  title: "Notification",
                                  icon: AssetsPath.NOTIFICATION_ICON,
                                  isEnable: false,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  height: 2,
                                  color: const Color(0xffe1e4eb),
                                ),
                                expandedWidgets(
                                  children: Container(),
                                  title: "Wishlist (00)",
                                  icon: AssetsPath.WISHLIST_ICON,
                                  isEnable: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                return Visibility(
                  visible: profileScreenController.isProfileLoading.value,
                  child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * .9,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            15.pw,
                            const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            15.pw,
                            const Text(
                              "Loading...",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget editTextField({
    required BuildContext context,
    required String titleText,
    required String hintText,
    required TextEditingController textEditingController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff898d90),
          ),
        ),
        10.ph,
        Material(
          elevation: 2,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Color(0xffe4e6e8),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xffb9bdbf),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget expandedWidgets(
      {required children,
      required String title,
      required String icon,
      required bool isEnable}) {
    return Column(
      children: [
        ExpansionTile(
          enabled: isEnable,
          backgroundColor: Colors.white,
          childrenPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          expandedAlignment: Alignment.centerLeft,
          leading: SvgPicture.asset(
            icon,
            // color: const Color(
            //   0xff899AA2,
            // ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 17,
            color: Color(0xff899AA2),
          ),
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )
              ],
            ),
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [children],
        ),
      ],
    );
  }

  Widget accountExpandData({required context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        editTextField(
            context: context,
            titleText: "Email",
            hintText: "youremail@xmail.com",
            textEditingController:
                profileScreenController.emailController.value),
        20.ph,
        editTextField(
            context: context,
            titleText: "Full Name",
            hintText: "William Bennett",
            textEditingController:
                profileScreenController.fullNameController.value),
        20.ph,
        editTextField(
            context: context,
            titleText: "Street Address",
            hintText: "465 Nolan Causeway Suite 079",
            textEditingController:
                profileScreenController.addressController.value),
        20.ph,
        editTextField(
            context: context,
            titleText: "Apt, Suite, Bldg (optional)",
            hintText: "Unit 512",
            textEditingController:
                profileScreenController.aptSuiteController.value),
        20.ph,
        SizedBox(
          width: MediaQuery.of(context).size.width * .3,
          child: editTextField(
              context: context,
              titleText: "Zip Code",
              hintText: "77017",
              textEditingController:
                  profileScreenController.zipCodeController.value),
        ),
        30.ph,
        CommonMethods.saveCancelButtons(
          isLoading: profileScreenController.isProfileUpdateLoading,
          leftButtonTitle: "Cancel",
          rightButtonTitle: "Save",
          leftButtonCallBack: () {},
          rightButtonCallBack: () {
            profileScreenController.updateProfile();
          },
        ),
        30.ph,
      ],
    );
  }
}

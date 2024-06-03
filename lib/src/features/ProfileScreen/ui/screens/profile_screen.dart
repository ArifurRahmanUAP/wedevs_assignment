import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedevs_assignment/src/core/extensions.dart';
import 'package:wedevs_assignment/src/core/utilities/assets_path.dart';

import '../../../../core/common_method/common_method.dart';
import '../../../../core/di/app_component.dart';
import '../controller/profile_screen_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileScreenController = locator<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            color: Colors.white,
            child: Card(
              color: Colors.white,
              elevation: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: Column(
                      children: [
                        expandedWidgets(
                          children: accountExpandData(context: context),
                          title: "Account",
                          icon: AssetsPath.PROFILE_BOTTOM_SHEET_LOGO,
                          isEnable: true,
                        ),
                        expandedWidgets(
                          children: Container(),
                          title: "Passwords",
                          icon: AssetsPath.PASSWORD_ICON,
                          isEnable: false,
                        ),
                        expandedWidgets(
                          children: Container(),
                          title: "Notification",
                          icon: AssetsPath.NOTIFICATION_ICON,
                          isEnable: false,
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
            Icons.arrow_forward_ios,
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 2,
          color: const Color(0xffe1e4eb),
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
          leftButtonTitle: "Cancel",
          rightButtonTitle: "Save",
          leftButtonCallBack: () {},
          rightButtonCallBack: () {},
        ),
        30.ph,
      ],
    );
  }
}

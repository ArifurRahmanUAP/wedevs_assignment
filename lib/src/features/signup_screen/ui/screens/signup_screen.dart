import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/core/common_method/common_method.dart';
import 'package:wedevs_assignment/src/core/extensions.dart';
import 'package:wedevs_assignment/src/core/routes/router.dart';
import 'package:wedevs_assignment/src/core/utilities/assets_path.dart';

import '../../../../core/di/app_component.dart';
import '../../../../core/routes/route_name.dart';
import '../controller/signup_screen_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignupScreenController signupScreenController =
      locator<SignupScreenController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return SafeArea(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userProfilePic(context: context),
                      25.ph,
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            userNameTextField(),
                            20.ph,
                            userEmailTextField(),
                            20.ph,
                            userPasswordTextField(context: context),
                            20.ph,
                            userConfirmPasswordTextField(context: context),
                          ],
                        ),
                      ),
                      60.ph,
                      signUpButton(context: context),
                      40.ph,
                      CommonMethods.socialMediaSignUp(context: context),
                      30.ph,
                      loginPageButton(context: context),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget emailTextField({required BuildContext context}) {
    return Material(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: signupScreenController.userEmailController,
          decoration: const InputDecoration(
            filled: true,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Color(0xffA4A9AF),
            ),
            fillColor: Colors.white,
            hintText: "Email",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget userNameTextField() {
    return Material(
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
        child: TextFormField(
          controller: signupScreenController.userFullNameController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Name can't be empty.";
            }
            return null;
          },
          decoration: const InputDecoration(
            filled: true,
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xffA4A9AF),
            ),
            fillColor: Colors.white,
            hintText: "Name",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget userEmailTextField() {
    return Material(
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
        child: TextFormField(
          controller: signupScreenController.userEmailController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Email can't be empty.";
            }
            return null;
          },
          decoration: const InputDecoration(
            filled: true,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Color(0xffA4A9AF),
            ),
            fillColor: Colors.white,
            hintText: "Email",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget userPasswordTextField({required BuildContext context}) {
    return Material(
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
        child: TextFormField(
          controller: signupScreenController.passwordController,
          obscureText: !signupScreenController.isPasswordVisible.value,
          validator: (value) {
            if (value!.isEmpty) {
              return "Password can't be empty.";
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Color(0xffA4A9AF),
            ),
            suffixIcon: IconButton(
              onPressed: () => signupScreenController
                  .signUpPasswordVisibilityButtonPressed(),
              icon: signupScreenController.isPasswordVisible.value
                  ? const Icon(
                      Icons.visibility,
                      color: Color(0xffA4A9AF),
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: Color(0xffA4A9AF),
                    ),
            ),
            fillColor: Colors.white,
            hintText: "Password",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget userConfirmPasswordTextField({required BuildContext context}) {
    return Material(
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
        child: TextFormField(
          controller: signupScreenController.confirmPasswordController,
          obscureText: !signupScreenController.isConfirmPasswordVisible.value,
          validator: (value) {
            if (value!.isEmpty) {
              return "Confirm Password can't be empty.";
            } else if (value !=
                signupScreenController.passwordController.value.text) {
              return "Both Password doesn't Match";
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Color(0xffA4A9AF),
            ),
            suffixIcon: IconButton(
              onPressed: () => signupScreenController
                  .signUpConfirmPasswordVisibilityButtonPressed(),
              icon: signupScreenController.isConfirmPasswordVisible.value
                  ? const Icon(
                      Icons.visibility,
                      color: Color(0xffA4A9AF),
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: Color(0xffA4A9AF),
                    ),
            ),
            fillColor: Colors.white,
            hintText: "Confirm Password",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget signUpButton({required BuildContext context}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xffF75F55)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            signupScreenController.signUpButtonPressed();
          }
        },
        child: signupScreenController.isFinalLoading.value
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
      ),
    );
  }

  Widget loginPageButton({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
        TextButton(
          onPressed: () {
            RouteGenerator.pushNamed(context, Routes.loginScreenRouteName);
          },
          child: const Text(
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xff2893E3)),
          ),
        )
      ],
    );
  }

  Widget userProfilePic({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(65), // Image radius
                child: signupScreenController.imgFile.value.path.isEmpty
                    ? Container(
                  padding: const EdgeInsets.all(20),
                        child: SvgPicture.asset(
                            AssetsPath.PROFILE_BOTTOM_SHEET_LOGO),
                      )
                    : Image.file(
                        File(signupScreenController.imgFile.value.path),
                        fit: BoxFit.fill,
                      ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: GestureDetector(
              onTap: () {
                signupScreenController.pickImage(context: context);
              },
              child: Container(
                height: 35,
                width: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF9472), Color(0xFFF2709C)],
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

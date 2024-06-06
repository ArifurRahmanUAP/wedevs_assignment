import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return SafeArea(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userNameTextField(),
                      20.ph,
                      userEmailTextField(),
                      20.ph,
                      userPasswordTextField(context: context),
                      20.ph,
                      userConfirmPasswordTextField(context: context),
                      60.ph,
                      signUpButton(context: context),
                      40.ph,
                      socialMediaSignUp(context: context),
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
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: signupScreenController.userFullNameController,
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

  Widget userPasswordTextField({required BuildContext context}) {
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
          controller: signupScreenController.passwordController,
          obscureText: !signupScreenController.isPasswordVisible.value,
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
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: signupScreenController.confirmPasswordController,
          obscureText: !signupScreenController.isConfirmPasswordVisible.value,
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
          backgroundColor: WidgetStateProperty.all(const Color(0xffF75F55)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () => signupScreenController.signUpButtonPressed(),
        child: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }

  Widget socialMediaSignUp({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 2,
          child: Container(
            height: 56,
            width: 56,
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              AssetsPath.FACEBOOK_LOGO,
            ),
          ),
        ),
        20.pw,
        Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 2,
          child: Container(
            height: 56,
            width: 56,
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              AssetsPath.GOOGLE_LOGO,
            ),
          ),
        ),
      ],
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
}

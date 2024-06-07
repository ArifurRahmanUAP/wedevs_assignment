import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/core/extensions.dart';
import 'package:wedevs_assignment/src/core/utilities/assets_path.dart';

import '../../../../core/common_method/common_method.dart';
import '../../../../core/di/app_component.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/routes/router.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginScreenController = locator<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loginLogo(),
                60.ph,
                signInText(),
                40.ph,

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      emailTextField(context: context),
                      20.ph,
                      userPasswordTextField(context: context),
                      10.ph,
                    ],
                  ),
                ),
                forgetPasswordText(context: context),
                30.ph,
                CommonMethods.socialMediaSignUp(context: context),
                30.ph,
                loginButton(context: context),
                30.ph,
                signUpButton(context: context),
                30.ph,
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget loginLogo() {
    return SvgPicture.asset(AssetsPath.LOGIN_LOGO);
  }

  Widget signInText() {
    return const Text(
      "Sign In",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget emailTextField({required BuildContext context}) {
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
          controller: loginScreenController.userEmailController,
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
          controller: loginScreenController.passwordController,
          obscureText: !loginScreenController.isPasswordVisible.value,
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
              onPressed: () =>
                  loginScreenController.loginPasswordVisibilityButtonPressed(),
              icon: loginScreenController.isPasswordVisible.value
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
            hintText: "Enter your Password",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget forgetPasswordText({required BuildContext context}) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: const Text(
          "Forget Password?",
          style: TextStyle(
            color: Color(0xffA4A9AF),
          ),
        ),
      ),
    );
  }

  Widget loginButton({required BuildContext context}) {
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
            loginScreenController.loginButtonPressed(context: context);
          }
        },
        child: loginScreenController.isLoginLoading.value
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Text(
                "Login",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
      ),
    );
  }

  Widget signUpButton({required BuildContext context}) {
    return GestureDetector(
      onTap: () =>
          RouteGenerator.pushNamed(context, Routes.signUpScreenRouteName),
      child: const Text(
        "Create New Account",
        style: TextStyle(
          color: Color(0xff383C40),
          fontWeight: FontWeight.w300,
          fontSize: 18,
        ),
      ),
    );
  }
}

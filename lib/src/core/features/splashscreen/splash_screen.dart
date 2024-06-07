// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedevs_assignment/src/core/utilities/assets_path.dart';

import '../../../../main.dart';
import '../../routes/route_name.dart';
import '../../routes/router.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (session.isLoggedIn!) {
        RouteGenerator.pushReplacementNamed(context, Routes.landingPage);
      } else {
        RouteGenerator.pushReplacementNamed(
            context, Routes.loginScreenRouteName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          color: Colors.white,
          child: Center(
            child: SvgPicture.asset(
              AssetsPath.LOGIN_LOGO,
            ),
          ),
        ),
      ),
    );
  }
}

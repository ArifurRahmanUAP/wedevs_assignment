// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../routes/route_name.dart';
import '../routes/router.dart';
import '../utilities/assets_path.dart';
import '../utilities/color_resources.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      RouteGenerator.pushReplacementNamed(context, Routes.loginScreenRouteName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
        ],
      ),
    );
  }
}

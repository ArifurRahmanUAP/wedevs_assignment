import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../features/ProfileScreen/ui/screens/profile_screen.dart';
import '../../../../../features/home_screen/ui/screens/home_screen.dart';

class LandingScreenController extends GetxController {
  var selectedPageIndex = 0.obs;

  final List<Widget> children = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];
}

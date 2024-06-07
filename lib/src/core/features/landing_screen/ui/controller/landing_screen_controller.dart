import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/features/cart_screen/ui/cart_screen.dart';
import 'package:wedevs_assignment/src/features/menu_screen/ui/menu_screen.dart';
import '../../../../../features/ProfileScreen/ui/screens/profile_screen.dart';
import '../../../../../features/home_screen/ui/screens/home_screen.dart';
import '../../../../../features/search_screen/ui/search_screen.dart';

class LandingScreenController extends GetxController {
  var selectedPageIndex = 0.obs;

  final List<Widget> children = [
    HomeScreen(),
    const MenuScreen(),
    const CartScreen(),
    ProfileScreen(),
    const SearchScreen()
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/core/extensions.dart';

import '../../../../utilities/assets_path.dart';
import '../controller/landing_screen_controller.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);

  final LandingScreenController _controller =
      Get.put(LandingScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_controller.selectedPageIndex.value != 0) {
          _controller.selectedPageIndex.value = 0;
          return false;
        } else {
          _showAlert(context);
        }
        return true;
      },
      child: Obx(
        () => Scaffold(
          body: _controller.children[_controller.selectedPageIndex.value],
          bottomNavigationBar: bottomBar(context: context),
          floatingActionButton: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xffFF679B), Color(0xffFF7B51)])),
            margin: const EdgeInsets.all(5),
            height: 60,
            width: 60,
            child: RawMaterialButton(
              shape: const CircleBorder(),
              elevation: 0,
              onPressed: () {},
              child: const Icon(
                size: 30,
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  _showAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Exit',
              key: Key('Exit'),
            ),
            content: const Text('Are you sure you want to exit?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop();
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget bottomBar({required BuildContext context}) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: SizedBox(
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                20.pw,
                GestureDetector(
                  onTap: () {
                    _controller.selectedPageIndex.value = 0;
                  },
                  child: SvgPicture.asset(
                    AssetsPath.HOME_BOTTOM_SHEET_LOGO,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .15,
                ),
                GestureDetector(
                  onTap: () {
                    _controller.selectedPageIndex.value = 1;
                  },
                  child: SvgPicture.asset(
                    AssetsPath.MENU_BOTTOM_SHEET_LOGO,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.selectedPageIndex.value = 2;
                  },
                  child: SvgPicture.asset(
                    AssetsPath.CART_BOTTOM_SHEET_LOGO,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .15,
                ),
                GestureDetector(
                  onTap: () {
                    _controller.selectedPageIndex.value = 3;
                  },
                  child: SvgPicture.asset(
                    AssetsPath.PROFILE_BOTTOM_SHEET_LOGO,
                  ),
                ),
                20.pw,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

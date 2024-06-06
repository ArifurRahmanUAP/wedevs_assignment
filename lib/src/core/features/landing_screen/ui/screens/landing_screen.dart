import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
        () =>Scaffold(
          extendBody: true,
          // backgroundColor: Colors.transparent,
          body: _controller.children[_controller.selectedPageIndex.value],
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
              onPressed: () {
                _controller.selectedPageIndex.value = 4;
              },
              child: const Icon(
                size: 30,
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: bottomBar(context: context),
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
      height: 75,
      surfaceTintColor: Colors.white,
      elevation: 0,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 3,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Obx(() => SvgPicture.asset(
                  AssetsPath.HOME_BOTTOM_SHEET_LOGO,
                  color: _controller.selectedPageIndex.value == 0
                      ? const Color(0xFFFF679B)
                      : const Color(0xFF6E7FAA),
                )),
            onPressed: () => _controller.selectedPageIndex.value = 0,
          ),
          IconButton(
            icon: Obx(() => SvgPicture.asset(
                  AssetsPath.MENU_BOTTOM_SHEET_LOGO,
                  color: _controller.selectedPageIndex.value == 1
                      ? const Color(0xFFFF679B)
                      : const Color(0xFF6E7FAA),
                )),
            onPressed: () => _controller.selectedPageIndex.value = 1,
          ),
          SizedBox(
            width: 40,
          ),
          IconButton(
            icon: Obx(() => SvgPicture.asset(
                  AssetsPath.CART_BOTTOM_SHEET_LOGO,
                  color: _controller.selectedPageIndex.value == 2
                      ? const Color(0xFFFF679B)
                      : const Color(0xFF6E7FAA),
                )),
            onPressed: () => _controller.selectedPageIndex.value = 2,
          ),
          IconButton(
            icon: Obx(() => SvgPicture.asset(
                  AssetsPath.PROFILE_BOTTOM_SHEET_LOGO,
                  color: _controller.selectedPageIndex.value == 3
                      ? const Color(0xFFFF679B)
                      : const Color(0xFF6E7FAA),
                )),
            onPressed: () => _controller.selectedPageIndex.value = 3,
          ),
        ],
      ),
    );
  }
}

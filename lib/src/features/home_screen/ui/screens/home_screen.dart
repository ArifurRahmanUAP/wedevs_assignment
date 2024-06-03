import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/core/common_method/common_method.dart';
import 'package:wedevs_assignment/src/core/extensions.dart';
import 'package:wedevs_assignment/src/core/utilities/assets_path.dart';

import '../controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController homePageController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeScreenController>(initState: (state) async {
          homePageController.readData();
        }, builder: (logic) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                topBar(),
                searchBar(context: context),
                productList(context: context),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget topBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 24,
          ),
          const Text(
            "Product List",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 24,
            width: 24,
            child: Icon(
              size: 30,
              Icons.search,
            ),
          )
        ],
      ),
    );
  }

  Widget searchBar({required context}) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0.0),
                    ),
                  ),
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  height: 5,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffFFD3DD),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                ),
                              ],
                            ),
                            20.ph,
                            const Text(
                              "FIlter",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            15.ph,
                            GetBuilder<HomeScreenController>(
                              id: "radioUpdate",
                              builder: (controller) {
                                return Column(
                                  children: <Widget>[
                                    CheckboxListTile(
                                      title: const Text(
                                        'Newest',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      activeColor: const Color(0xffFF708A),
                                      checkColor: Colors.white,
                                      side: const BorderSide(
                                        color: Color(0xffFF708A),
                                        width: 2,
                                      ),
                                      value:
                                          homePageController.radioValue.value ==
                                              "Newest",
                                      onChanged: (bool? value) {
                                        homePageController.radioValue.value =
                                            "Newest";
                                        homePageController
                                            .update(["radioUpdate"]);
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, // To place the checkbox at the start
                                    ),
                                    CheckboxListTile(
                                      title: const Text(
                                        'Oldest',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: Color(0xff000000)),
                                      ),
                                      activeColor: const Color(0xffFF708A),
                                      checkColor: Colors.white,
                                      side: const BorderSide(
                                          color: Color(0xffFF708A), width: 2),
                                      value:
                                          homePageController.radioValue.value ==
                                              "Oldest",
                                      onChanged: (bool? value) {
                                        homePageController.radioValue.value =
                                            "Oldest";
                                        homePageController
                                            .update(["radioUpdate"]);
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, // To place the checkbox at the start
                                    ),
                                    CheckboxListTile(
                                      title: const Text(
                                        'Price low > High',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: Color(0xff000000)),
                                      ),
                                      activeColor: const Color(0xffFF708A),
                                      checkColor: Colors.white,
                                      side: const BorderSide(
                                          color: Color(0xffFF708A), width: 2),
                                      value:
                                          homePageController.radioValue.value ==
                                              "Price low > High",
                                      onChanged: (bool? value) {
                                        homePageController.radioValue.value =
                                            "Price low > High";
                                        homePageController
                                            .update(["radioUpdate"]);
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, // To place the checkbox at the start
                                    ),
                                    CheckboxListTile(
                                      title: const Text(
                                        'Price high > Low',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: Color(0xff000000)),
                                      ),
                                      activeColor: const Color(0xffFF708A),
                                      checkColor: Colors.white,
                                      side: const BorderSide(
                                          color: Color(0xffFF708A), width: 2),
                                      value:
                                          homePageController.radioValue.value ==
                                              "Price high > Low",
                                      onChanged: (bool? value) {
                                        homePageController.radioValue.value =
                                            "Price high > Low";
                                        homePageController
                                            .update(["radioUpdate"]);
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, // To place the checkbox at the start
                                    ),
                                    CheckboxListTile(
                                      title: const Text(
                                        'Best selling',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      activeColor: const Color(0xffFF708A),
                                      checkColor: Colors.white,
                                      side: const BorderSide(
                                          color: Color(0xffFF708A), width: 2),
                                      value:
                                          homePageController.radioValue.value ==
                                              "Best selling",
                                      onChanged: (bool? value) {
                                        homePageController.radioValue.value =
                                            "Best selling";
                                        homePageController
                                            .update(["radioUpdate"]);
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, // To place the checkbox at the start
                                    ),
                                    35.ph,
                                    CommonMethods.saveCancelButtons(
                                      leftButtonTitle: "Cancel",
                                      rightButtonTitle: "Apply",
                                      leftButtonCallBack: () {},
                                      rightButtonCallBack: () {},
                                    ),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Row(
                children: [
                  SvgPicture.asset(AssetsPath.FILTER_LOGO),
                  10.pw,
                  const Text(
                    "Filter",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xff818995)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Text(
                  "Sort by",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color(0xff818995)),
                ),
                2.pw,
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xff818995),
                ),
                15.pw,
                const Icon(
                  Icons.list,
                  color: Color(0xff000000),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget productList({required BuildContext context}) {
    return Container(
      height: 500,
      child: Obx(() {
        return GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(homePageController.products.length, (index) {
            return Center(
              child: Column(
                children: [
                  Image.network(
                    homePageController.products[index].images![0].src!
                        .replaceAll("\\", ""),
                  )
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}

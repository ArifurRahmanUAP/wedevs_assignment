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
              horizontal: 15,
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
    return Obx(() {
      return Expanded(
        child: GridView.count(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.6),
          mainAxisSpacing: 2,

          // Generate 100 widgets that display their index in the List.
          children: List.generate(homePageController.products.length, (index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    // Adjust the radius as needed
                    child: Image.network(
                      width: MediaQuery.of(context).size.width,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                      homePageController.products[index].images![0].src!
                          .replaceAll("\\", ""),
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(AssetsPath.NO_IMAGE_FOUND_ICON);
                      },
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        homePageController.products[index].name!,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                              "\$${homePageController.products[index].regularPrice!}",
                              style:
                              homePageController.products[index].salePrice != ""
                                  ? const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Color(0xff989FA8),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              )
                                  : const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              )),
                          8.pw,
                          homePageController.products[index].salePrice != ""
                              ? Text(
                            "\$${homePageController.products[index].salePrice}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                              : Container(),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFF708A),
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffFF708A),
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffFF708A),
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffFF708A),
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffFF708A),
                            size: 15,
                          ),
                        ],
                      )
                    ],
                  ),
                )
                ],
              ),
            );
          }),
        ),
      );
    });
  }
}

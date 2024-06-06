import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
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
    return Container(
      color: Colors.transparent,
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
                  isScrollControlled: true,
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: GetX<HomeScreenController>(builder: (controller) {
          return GridView.builder(
            itemCount: controller.products.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (1 / 1.33),
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Image.network(
                            controller.products[index].images![0].src!,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Image.asset(
                                  AssetsPath.NO_IMAGE_FOUND_ICON,
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: const EdgeInsets.fromLTRB(3, 1, 2, 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.products[index].name!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: "Roboto",
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  // Html(
                                  //     data: controller.productLists[index].priceHtml!
                                  // ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          homePageController.products[index]
                                                      .regularPrice !=
                                                  homePageController
                                                      .products[index].price
                                              ? "\$${homePageController.products[index].regularPrice!}"
                                              : "",
                                          style: homePageController
                                                      .products[index]
                                                      .regularPrice !=
                                                  ""
                                              ? const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Color(0xff989FA8),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                )
                                              : const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                      8.pw,
                                      Text(
                                        textAlign: TextAlign.start,
                                        homePageController
                                                    .products[index].price !=
                                                ""
                                            ? "\$${homePageController.products[index].price}"
                                            : "",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: SmoothStarRating(
                                      allowHalfRating: false,
                                      starCount: 5,
                                      rating: controller
                                          .products[index].ratingCount!
                                          .toDouble(),
                                      size: 20,
                                      color: Colors.orange,
                                      borderColor: Colors.grey,
                                      spacing: 0.0,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

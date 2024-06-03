import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/core/extensions.dart';
import 'package:wedevs_assignment/src/core/utilities/assets_path.dart';
import '../controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController homePageController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeScreenController>(
            initState: (state) async {
              homePageController.readData();
            },
            builder: (logic) {
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

  Widget searchBar({required BuildContext context}) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                      homePageController.products[index].images![0].src!.replaceAll("\\", ""),
                  )
                ],
              ),
            );
          }
          ),
        );
      }),
    );
  }
}

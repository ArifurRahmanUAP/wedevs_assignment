import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/features/home_screen/data/model/product_list_model.dart';

import '../../../../core/routes/router.dart';

class HomeScreenController extends GetxController {
  final products = <ProductModel>[].obs;
  final radioValue = "Newest".obs;

  Future<void> searchFilterClickAction() async {
    if (radioValue.value == "Newest") {
      products.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
    } else if (radioValue.value == "Oldest") {
      products.sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!));
    } else if (radioValue.value == "Price low > High") {
      products
          .sort((a, b) => int.parse(a.price!).compareTo(int.parse(b.price!)));
    } else if (radioValue.value == "Price high > Low") {
      products
          .sort((a, b) => int.parse(b.price!).compareTo(int.parse(a.price!)));
    } else if (radioValue.value == "Best selling") {
      products.sort((a, b) => b.totalSales!.compareTo(a.totalSales!));
    }
  }

  Future<void> readData() async {
    String jsonString = await rootBundle.loadString('assets/response.json');

    List<dynamic> jsonData = json.decode(jsonString);
    List<ProductModel> sites =
        jsonData.map((item) => ProductModel.fromJson(item)).toList();

    for (var site in sites) {
      products.add(site);
    }
  }
}

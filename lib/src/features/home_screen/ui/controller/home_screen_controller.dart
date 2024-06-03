import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/src/features/home_screen/data/model/product_list_model.dart';

class HomeScreenController extends GetxController {
  final products = <ProductModel>[].obs;
  final radioValue = "Newest".obs;



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

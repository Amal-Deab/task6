import 'package:api_focal/core/servies/link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../model/product_model.dart';

class Search_Controller extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool isSearchActive = false;
  StatusRequest statusRequest = StatusRequest.loading;

  List<ProductModel> products = [];
  List<ProductModel> list_search = [];
  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  Future<void> getProduct() async {
    statusRequest = StatusRequest.loading;
    update();

    Crud crud = Crud();
    var response =
        await crud.getData(AppLink.products, AppLink().getHeaderWithToken());

    response.fold(
      (failure) {
        statusRequest = StatusRequest.failure;
      },
      (data) {
        print("Response data: $data");

        if (data != null &&
            data is Map<String, dynamic> &&
            data.containsKey('data')) {
          var jsonData = data['data'];

          if (jsonData != null && jsonData is List) {
            products = jsonData.map((item) {
              return ProductModel.fromJson(
                  {"data": item, "message": data["message"]});
            }).toList();
            print(products);
          } else {
            print("jsonData is null or not a list");
            products = [];
          }

          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.failure;
          print("Invalid data structure or 'data' key is missing");
          products = [];
        }

        update();
      },
    );
  }

  void hideQuickSearch(String search_text) {
    if (search_text.isNotEmpty) {
      isSearchActive = true;

      list_search = products.where((product) {
        final productName = product.data.name.toLowerCase();
        final categoryName =
            product.data.subCategory.category.name.toLowerCase();
        final searchQuery = search_text.toLowerCase();

        return productName.contains(searchQuery) ||
            categoryName.contains(searchQuery);
      }).toList();
    } else {
      isSearchActive = false;
      list_search = products;
    }
    update();
  }

  void selectQuickSearch(String text) {
    searchController.text = text;
    isSearchActive = true;
    update();
  }

  void clearSearch() {
    searchController.clear();
    isSearchActive = false;
    list_search.clear();
    update();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

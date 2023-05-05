import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:hrsofttask/app/data/remote_impl/api_helper_impl.dart';

import '../../../data/response_model/productListModel.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController
  final Rx<ProductListModel?> productList = ProductListModel().obs;

  @override
  void onInit() {
    getAllProductData();
    super.onInit();
  }

  getAllProductData() async {
    productList.value = await APIHelper().productSection();
    // print(productListModelToJson(productList.value!));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

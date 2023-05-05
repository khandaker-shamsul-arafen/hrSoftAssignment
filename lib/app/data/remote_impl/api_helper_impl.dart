import 'package:get/get.dart';

import '../../network/api_client.dart';
import '../../network/api_end_points.dart';
import '../response_model/productListModel.dart';

class APIHelper {
  Future<ProductListModel?> productSection() async {
    var response = await ApiClient().getAPI(
      Get.context,
      ApiEndPoints.public,
    );

    return productListModelFromJson(response.toString());
  }
}

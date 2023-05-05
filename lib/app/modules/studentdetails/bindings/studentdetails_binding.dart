import 'package:get/get.dart';

import '../controllers/studentdetails_controller.dart';

class StudentdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentdetailsController>(
      () => StudentdetailsController(),
    );
  }
}

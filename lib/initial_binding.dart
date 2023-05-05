import 'package:get/get.dart';
import 'package:hrsofttask/app/modules/category/bindings/category_binding.dart';
import 'package:hrsofttask/app/modules/studentdetails/bindings/studentdetails_binding.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    CategoryBinding().dependencies();
    StudentdetailsBinding().dependencies();
  }
}

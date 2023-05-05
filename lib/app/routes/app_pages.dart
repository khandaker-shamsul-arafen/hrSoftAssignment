import 'package:get/get.dart';

import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/studentdetails/bindings/studentdetails_binding.dart';
import '../modules/studentdetails/views/studentdetails_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CATEGORY;

  static final routes = [
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTDETAILS,
      page: () => const StudentdetailsView(),
      binding: StudentdetailsBinding(),
    ),
  ];
}

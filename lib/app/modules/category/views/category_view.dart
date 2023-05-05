import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/product_details_container.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('CategoryView'),
        centerTitle: true,
        backgroundColor: AppColors.studentCardColor,
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 16.0.h, left: 10.0.w, right: 16.0.w),
          child: Obx(() {
            return (controller.productList.value?.products?.length == null)
                ? Center(
                    child: Container(),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 715.h,
                        width: MediaQuery.of(context).size.width - 16.w,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount:
                                controller.productList.value?.products?.length,
                            itemBuilder: (context, index) {
                              final data = controller
                                  .productList.value?.products?[index];
                              return ProductDetailsContainer(
                                height: 235,
                                image: '${data?.thumbnail.toString()}',
                                price: '${data?.price.toString()}',
                                id: '${data?.id.toString()}',
                                title: '${data?.title.toString()}',
                                description: '${data?.description.toString()}',
                                discountPercentage:
                                    '${data?.discountPercentage.toString()}',
                                ratting: '${data?.rating.toString()}',
                                stock: '${data?.stock.toString()}',
                                brand: '${data?.brand.toString()}',
                                cattegory: '${data?.category.toString()}',
                              );
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0.h),
                        child: ElevatedButton(
                          onPressed: () async {
                            Get.toNamed(Routes.STUDENTDETAILS);
                          },
                          child: const Text('Next'),
                        ),
                      )
                    ],
                  );
          })),
    );
  }
}

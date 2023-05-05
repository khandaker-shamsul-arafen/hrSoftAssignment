import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrsofttask/app/constants/app_constants.dart';

import '../constants/app_colors.dart';
import '../constants/app_style.dart';
import 'app_widgets.dart';

class ProductDetailsContainer extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String price;
  final String discountPercentage;
  final String ratting;
  final String stock;
  final String brand;
  final String cattegory;
  final String image;

  final double height;

  const ProductDetailsContainer(
      {Key? key,
      required this.height,
      required this.image,
      required this.price,
      required this.id,
      required this.title,
      required this.description,
      required this.discountPercentage,
      required this.ratting,
      required this.stock,
      required this.brand,
      required this.cattegory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height.h,
          width: double.infinity,
          //Same as `blurRadius` i guess
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.whiteColor,
            border: Border.all(
              width: 0.04,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.gray,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 3.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                image,
                height: 100.h,
                width: 140.w,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(left: 9.0.w, top: 21.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: 200.w,
                        child: Text(title,
                            style: textRegularStyle1(
                              fontSize: fontSize16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 230.w,
                        child: SingleChildScrollView(
                          child: Text(
                            description,
                            style: textRegularStyle1(),
                          ),
                        ),
                      ),
                    ),
                    AppWidgets().gapH(3),
                    Text(
                      "ID: $id",
                      style: textRegularStyle1(),
                    ),
                    Text(
                      "Cattegory: $cattegory",
                      style: textRegularStyle1(),
                    ),
                    Text(
                      "Price: ${price}TK",
                      style: textRegularStyle1(),
                    ),
                    Text(
                      "Discount: ${discountPercentage}TK",
                      style: textRegularStyle1(),
                    ),
                    Text(
                      "Ratting: $ratting",
                      style: textRegularStyle1(),
                    ),
                    AppWidgets().gapH(3),
                  ],
                ),
              ),
            ],
          ),
        ),
        AppWidgets().gapH16()
      ],
    );
  }
}

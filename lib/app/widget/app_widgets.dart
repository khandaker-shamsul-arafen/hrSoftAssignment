import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidgets {
  Widget gapH(double height) {
    return SizedBox(
      height: height.h,
    );
  }

  Widget gapW(double width) {
    return SizedBox(
      width: width.w,
    );
  }

  Widget gapW8() {
    return SizedBox(
      width: 8.w,
    );
  }

  Widget gapH8() {
    return SizedBox(
      height: 8.h,
    );
  }

  Widget gapH16() {
    return SizedBox(
      height: 16.h,
    );
  }

  Widget gapW16() {
    return SizedBox(
      width: 16.w,
    );
  }
}

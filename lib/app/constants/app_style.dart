import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_constants.dart';

TextStyle textRegularStyle(
    {color = AppColors.whiteColor,
    double fontSize = fontSize18,
    fontWeight = FontWeight.w600,
    bool isGrayColor = false,
    bool isWhiteColor = false,
    bool isFontWeight600 = false,
    double? lineHeight}) {
  return TextStyle(
      color: color.withOpacity(0.8),
      fontSize: fontSize.sp,
      fontWeight: fontWeight);
}

TextStyle textRegularStyle1(
    {color = AppColors.black,
    double fontSize = fontSize16,
    fontWeight = FontWeight.w400,
    bool isGrayColor = false,
    bool isWhiteColor = false,
    bool isFontWeight600 = false,
    double? lineHeight}) {
  return TextStyle(color: color, fontSize: fontSize.sp, fontWeight: fontWeight);
}

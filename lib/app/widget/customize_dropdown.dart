import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrsofttask/app/constants/app_constants.dart';

import '../constants/app_colors.dart';
import '../constants/app_style.dart';

class CustomizeDropDown extends StatefulWidget {
  final double height;
  final double width;
  final List<String> items;
  String? selectedValue;
  final onChanged;

  CustomizeDropDown({
    Key? key,
    required this.height,
    this.selectedValue,
    this.onChanged,
    required this.width,
    required this.items,
  }) : super(key: key);

  @override
  State<CustomizeDropDown> createState() => _CustomizeDropDownState();
}

class _CustomizeDropDownState extends State<CustomizeDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height.h,
      width: widget.width.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.gray,
            offset: Offset(0.0, 2.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: widget.selectedValue,
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: AppColors.borderColor,
                  size: 20,
                ),
                isExpanded: true,
                items: widget.items.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: textRegularStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: fontSize14),
                    ),
                  );
                }).toList(),
                onChanged: widget.onChanged),
          )),
    );
  }
}

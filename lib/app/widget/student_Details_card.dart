import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hrsofttask/app/constants/app_colors.dart';
import 'package:hrsofttask/app/widget/app_widgets.dart';
import '../constants/app_style.dart';
import '../modules/studentdetails/controllers/studentdetails_controller.dart';
import '../modules/studentdetails/views/studentdetails_view.dart';
import 'customize_dropdown.dart';

class StudentDetailsCard extends StatefulWidget {
  final int id;
  final String name;
  final String phone;
  final String fatherName;
  final String className;
  final String lattiTude;
  final String longiTude;
  final int index;

  const StudentDetailsCard(
      {Key? key,
      required this.name,
      required this.phone,
      required this.fatherName,
      required this.className,
      required this.id,
      required this.index,
      required this.lattiTude,
      required this.longiTude})
      : super(key: key);

  @override
  State<StudentDetailsCard> createState() => _StudentDetailsCard();
}

class _StudentDetailsCard extends State<StudentDetailsCard> {
  final data = Get.find<StudentdetailsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.studentCardColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.only(top: 16.w, bottom: 16.h, left: 16.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.id.toString(),
                style: textRegularStyle(),
              ),
              AppWidgets().gapW8(),
              Text(
                widget.name,
                style: textRegularStyle(),
              ),
              AppWidgets().gapW8(),
              Text(widget.phone, style: textRegularStyle()),
              AppWidgets().gapW8(),
              Text(widget.fatherName, style: textRegularStyle()),
              AppWidgets().gapW8(),
              Text(widget.className, style: textRegularStyle()),
              AppWidgets().gapW8(),
              Text(
                widget.lattiTude,
                style: textRegularStyle(),
              ),
              AppWidgets().gapW8(),
              Text(
                widget.longiTude,
                style: textRegularStyle(),
              ),
              AppWidgets().gapW8(),
              CustomizeDropDown(
                height: 35.h,
                width: 100.w,
                items: data.adults.toList(),
                selectedValue: data.selectedAdultDropDownValue.value,
                onChanged: (String? value) {
                  setState(() {
                    data.selectedAdultDropDownValue.value = value!;
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.whiteColor,
                ),
                onPressed: () => const StudentdetailsView()
                    .showForm(data.studentData[widget.index]['id'], context),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.whiteColor,
                  ),
                  onPressed: () {
                    data.deleteItem(
                        data.studentData[widget.index]['id'], context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

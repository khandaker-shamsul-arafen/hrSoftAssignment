import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hrsofttask/app/constants/app_colors.dart';

import '../../../widget/student_Details_card.dart';
import '../controllers/studentdetails_controller.dart';

class StudentdetailsView extends GetView<StudentdetailsController> {
  const StudentdetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Student Details View'),
        centerTitle: true,
        backgroundColor: AppColors.studentCardColor,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.studentCardColor,
          child: const Icon(Icons.add),
          onPressed: () async {
            await controller.location();
            showForm(null, context);
          }),
      body: Padding(
          padding: EdgeInsets.only(top: 16.0.h, left: 16.0.w),
          child: Obx(() {
            return controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    children: [
                      SizedBox(
                        height: 700.h,
                        width: MediaQuery.of(context).size.width - 35.w,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller.studentData.length,
                            itemBuilder: (context, index) => StudentDetailsCard(
                                  name: controller.studentData[index]['name'],
                                  phone: controller.studentData[index]['phone'],
                                  fatherName: controller.studentData[index]
                                      ['fatherName'],
                                  className: controller.studentData[index]
                                      ['className'],
                                  id: controller.studentData[index]['id'],
                                  index: index,
                                  lattiTude: controller.studentData[index]
                                      ['latiTude'],
                                  longiTude: controller.studentData[index]
                                      ['longiTude'],
                                )),
                      ),
                    ],
                  );
          })),
    );
  }

  void showForm(int? id, context) async {
    if (id != null) {
      final existingData =
          controller.studentData.firstWhere((element) => element['id'] == id);
      controller.nameController.text = existingData['name'];
      controller.phoneController.text = existingData['phone'];
      controller.fatherNameController.text = existingData['fatherName'];
      controller.classNameController.text = existingData['className'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.phoneController,
                    decoration: const InputDecoration(hintText: 'Phone'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: controller.fatherNameController,
                    decoration: const InputDecoration(hintText: 'Father_Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.classNameController,
                    decoration: const InputDecoration(hintText: 'Class_name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await controller.addItem();
                      }
                      if (id != null) {
                        await controller.updateItem(id);
                      }

                      // Clear the text fields
                      controller.nameController.text = '';
                      controller.phoneController.text = '';
                      controller.fatherNameController.text = '';
                      controller.classNameController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }
}

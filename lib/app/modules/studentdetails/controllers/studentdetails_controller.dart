import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../data/remote_impl/sql_helper.dart';

class StudentdetailsController extends GetxController {
  //TODO: Implement StudentdetailsController
  RxList studentData = [].obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController classNameController = TextEditingController();
  final selectedAdultDropDownValue = "Dhaka".obs;

  String latiTude = '';
  String longiTude = '';

  RxBool isLoading = true.obs;

  void refreshData() async {
    final data = await SqlHelper.getItems();
    studentData.value = data;
    isLoading.value = false;
  }

  Future<void> location() async {
    getUserCurrentLocation().then((value) {
      print(value.latitude.toString() + '' + value.longitude.toString());
      latiTude = value.latitude.toString();
      longiTude = value.longitude.toString();
    });
  }

  RxList<String> adults = [
    'Dhaka',
    'Comilla',
    'Faridpur',
    'CoxBAzar',
    'Jalkhati',
  ].obs;

  Future<void> addItem() async {
    print(latiTude);
    await SqlHelper.createItem(
        nameController.text,
        phoneController.text,
        fatherNameController.text,
        classNameController.text,
        latiTude,
        longiTude);
    refreshData();
  }

  Future<void> updateItem(int id) async {
    await SqlHelper.updateItem(id, nameController.text, phoneController.text,
        fatherNameController.text, classNameController.text);
    refreshData();
  }

  void deleteItem(int id, context) async {
    await SqlHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a Student Details!'),
    ));
    refreshData();
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value) {
      print('Hi');
    }).onError((error, stackTrace) {
      print(error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    refreshData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

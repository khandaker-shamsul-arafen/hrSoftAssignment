import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../utils/helper/app_helper.dart';

class ApiClient {
  Dio? dio;

  ApiClient() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
    dio = Dio(options);
  }

  Future<Object?> getAPI(
    context,
    String url, {
    Map<String, dynamic>? mQueryParameters,
  }) async {
    AppHelper().showLoader();
    try {
      var response = await dio?.get(
        url,
        queryParameters: mQueryParameters,
      );
      AppHelper().hideLoader();
      return response;
    } on DioError catch (e) {
      AppHelper().hideLoader();
    }
  }
}

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';

class ApiClient {
  Dio _dio = Dio();
  //get Api
  Future<dynamic> dioGet(String url, BuildContext context, String token) async {
    ConnectivityResult result;
    result = await Connectivity().checkConnectivity();
    if (result != null &&
        (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile)) {
      _dio.options.baseUrl = AppConfig.baseUrl;
      _dio.options.headers[ConstantStrings.authorization] =
          AppConfig.bearer + token;
      try {
        dynamic response = await _dio.get(url);
        if (response != null && response.statusCode == 200) {
          return response.data;
        } else
          return null;
      } catch (e) {}
    } else if (!AppConfig.isShowingDialog) {
      AppConfig.noInternetPopUp(context);
    }
  }

  //post api
  Future<dynamic> dioPost(
      String url, dynamic formData, BuildContext context, token) async {
    ConnectivityResult result;
    result = await Connectivity().checkConnectivity();
    if (result != null &&
        (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile)) {
      _dio.options.baseUrl = AppConfig.baseUrl;
      _dio.options.headers[ConstantStrings.contentType] = AppConfig.contentType;
      _dio.options.headers[ConstantStrings.authorization] =
          AppConfig.bearer + token;
      try {
        dynamic response = await _dio.post(url, data: formData);
        if (response != null) {
          return response;
        } else
          return null;
      } catch (e) {
        print(e.toString());
      }
    } else if (!AppConfig.isShowingDialog) {
      AppConfig.noInternetPopUp(context);
    }
  }

  ///login_api
  Future<dynamic> login(dynamic formData, BuildContext context) async {
    ConnectivityResult result;
    result = await Connectivity().checkConnectivity();
    if (result != null &&
        (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile)) {
      _dio.options.baseUrl = AppConfig.baseUrl;
      try {
        dynamic response = await _dio.post(
          AppConfig.token,
          data: formData,
          options: Options(
            contentType: "application/x-www-form-urlencoded",
          ),
        );
        return response;
      } catch (e) {}
    } else if (!AppConfig.isShowingDialog) {
      AppConfig.noInternetPopUp(context);
    }
  }
}

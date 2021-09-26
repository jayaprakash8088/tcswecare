import 'package:dio/dio.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';

class ApiClient {
  Dio _dio = Dio();
  //get Api
  Future<dynamic> dioGet(String url) async {
    _dio.options.baseUrl = AppConfig.baseUrl;
    try {
      dynamic response = await _dio.get(url);
      if (response != null && response.statusCode == 200) {
        return response.data;
      } else
        return null;
    } catch (e) {}
  }

  //post api
  Future<dynamic> dioPost(String url, dynamic formData) async {
    _dio.options.baseUrl = AppConfig.baseUrl;
    try {
      dynamic response = await _dio.post(url, data: formData);
      if (response != null && response.statusCode == 200) {
        return response.data;
      } else
        return null;
    } catch (e) {}
  }

  ///login_api
  Future<dynamic> login(dynamic formData) async {
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
  }
}

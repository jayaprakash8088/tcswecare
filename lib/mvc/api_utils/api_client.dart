import 'package:dio/dio.dart';

class ApiClient {
  Dio _dio = Dio();
  //get Api
  Future<dynamic> dioGet() async {
    _dio.options.baseUrl = 'AppConfig.baseUrl';
    try {} catch (e) {}
  }
}

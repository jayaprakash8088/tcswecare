import 'package:flutter/cupertino.dart';
import 'package:tcswecare/mvc/api_utils/api_client.dart';
import 'package:tcswecare/mvc/model/pain_level_model.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';

class Repository {
  ApiClient _apiClient = ApiClient();

  //login call
  Future<dynamic> callLogin(dynamic formData, BuildContext context) async {
    dynamic response;
    try {
      response = await _apiClient.login(formData, context);
    } catch (e) {}
    return response;
  }

  //save pain info
  Future<dynamic> savePatientPainInfo(
      PainLevelModel painLevel, BuildContext context) async {
    dynamic response;
    try {
      response = await _apiClient.dioPost(
          AppConfig.savePatientPainInfo, painLevel, context);
    } catch (e) {}
    return response;
  }
}
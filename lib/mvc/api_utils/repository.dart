import 'package:flutter/cupertino.dart';
import 'package:tcswecare/mvc/api_utils/api_client.dart';
import 'package:tcswecare/mvc/model/pain_level_model.dart';
import 'package:tcswecare/mvc/model/pain_record_model.dart';
import 'package:tcswecare/mvc/model/patient_info_response_model.dart';
import 'package:tcswecare/mvc/model/symptom_record_model.dart';
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
  Future<PainRecordModelResponse> savePatientPainInfo(
      PainLevelModel painLevel, BuildContext context, String token) async {
    dynamic response = await _apiClient.dioPost(
        AppConfig.savePatientPainInfo, painLevel, context, token);
    return PainRecordModelResponse.fromJson(response.data);
  }

  //save symptoms
  Future<PainRecordModelResponse> savePatientSymptoms(
      SymptomRecordModel symptomRecordModel,
      BuildContext context,
      String token) async {
    dynamic response = await _apiClient.dioPost(
        AppConfig.savePatientSymptomInfo, symptomRecordModel, context, token);
    return PainRecordModelResponse.fromJson(response.data);
  }

  Future<PatientInfoResponseModel> getPatientInfo(
      BuildContext context, String token) async {
    dynamic response =
        await _apiClient.dioGet(AppConfig.getPatientInfo, context, token);
    return PatientInfoResponseModel.fromJson(response.data);
  }
}

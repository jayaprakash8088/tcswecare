import 'package:flutter/cupertino.dart';
import 'package:tcswecare/mvc/api_utils/api_client.dart';
import 'package:tcswecare/mvc/model/pain_level_model.dart';
import 'package:tcswecare/mvc/model/pain_record_model.dart';
import 'package:tcswecare/mvc/model/pain_response_model.dart';
import 'package:tcswecare/mvc/model/patient_info_response_model.dart';
import 'package:tcswecare/mvc/model/sing_up_model.dart';
import 'package:tcswecare/mvc/model/symptom_record_model.dart';
import 'package:tcswecare/mvc/model/symptoms_response_model.dart';
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
    print('token' + token);
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
    return PatientInfoResponseModel.fromJson(response);
  }

  Future<SymptomsResponseModel> getSymptoms(
      BuildContext context, String token) async {
    dynamic response = await _apiClient.dioGet(
        AppConfig.getPatientSymptomInfo, context, token);
    return SymptomsResponseModel.fromJson(response);
  }
  // get pain info
  Future<PainResponseModel>getPainsInfo(BuildContext context,
      String token)async{
    dynamic response=await _apiClient.dioGet(AppConfig.getPatientPainInfo, context, token);
    return PainResponseModel.fromJson(response);
  }

  Future<PainRecordModelResponse> signUp(
      String url, BuildContext context, SignUpModel signUpModel) async {
    dynamic response=await _apiClient.dioPost(url,signUpModel, context,'');
    return PainRecordModelResponse.fromJson(response.data);
  }
  Future<dynamic>logOutApi(BuildContext context,String token)async{
    dynamic response=await _apiClient.logOut(context,token);
    if(response!=null&&response.statusCode==200){
      return true;
    }else return false;
  }
}

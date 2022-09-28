import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/api_utils/repository.dart';
import 'package:tcswecare/mvc/model/pain_record_model.dart';
import 'package:tcswecare/mvc/model/patient_info_response_model.dart';
import 'package:tcswecare/mvc/model/sing_up_model.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/app_shared_preferences.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';

class LoginController extends ControllerMVC {
  factory LoginController() {
    return _this ??= LoginController._();
  }

  static LoginController _this;

  LoginController._();
  Repository repository = Repository();
  AppSharedPreferences sharedPreferences = AppSharedPreferences();
  static LoginController get con => _this;
  //user name text controller
  TextEditingController userNameController = TextEditingController();
  // password text controller
  TextEditingController passwordController = TextEditingController();
  // name text controller
  TextEditingController nameController = TextEditingController();
  //patient id controller
  TextEditingController patientIdController = TextEditingController();
  // email
  TextEditingController eMailController = TextEditingController();
  //doctor mail id
  TextEditingController doctorMailController = TextEditingController();
  // diagnosis controller
  TextEditingController diagnosisController = TextEditingController();
  // age controller
  TextEditingController ageController= TextEditingController();
  //age value
  int ageValue;
  String otp;
//after update//
  TextEditingController childNameController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController parentEmailController = TextEditingController();
  TextEditingController parentMobileController = TextEditingController();
  DateTime selectedDate;

  Future<dynamic> loginClicked(
      String userName, String password, BuildContext context) async {
    Map<String, String> body = {
      'grant_type': 'password',
      'username': userName,
      'password': password,
    };
    dynamic response = await repository.callLogin(body, context);
    if (response != null && response.statusCode == 200) {
      await sharedPreferences
          .setAccessToken(response.data['access_token'].toString());
      return true;
    } else {
      return false;
    }
  }

  Future<PatientInfoResponseModel> getPatientInfo(BuildContext context) async {
    var token = await sharedPreferences.getToken();
    PatientInfoResponseModel response =
        await repository.getPatientInfo(context, token);
    if (response != null) {
      print(response.result.toString());
      await sharedPreferences.setUserId(response?.result?.userId ?? '');
    }
    return null;
  }

  Future<PainRecordModelResponse> signUp(BuildContext context) async {
    SignUpModel model = SignUpModel(
        age: ageValue,
        emailId: eMailController.text.trim(),
        password: passwordController.text.trim(),
        patientName: nameController.text.trim(), diagnosis:diagnosisController.text.trim(),
    doctorEmailId: doctorMailController.text.trim());
    AppConfig.pleaseWait(context);
    PainRecordModelResponse response =
        await repository.signUp(AppConfig.signUp, context, model);
   return response;
  }

  Future<PainRecordModelResponse> resendOTP(BuildContext context) async {
    SignUpModel model = SignUpModel(
        age: ageValue,
        emailId: eMailController.text.trim(),
        password: passwordController.text.trim(),
        patientName: nameController.text.trim(),
    diagnosis:diagnosisController.text.trim());
    AppConfig.pleaseWait(context);
    PainRecordModelResponse response =
        await repository.signUp(AppConfig.resendOtp, context, model);
    return response;
  }

  String getTitle(int pos) {
    String title;
    switch(pos){
      case 1:title=ConstantStrings.hospitalName;break;
      case 2:title=ConstantStrings.hospitalNumber;break;
      case 3:title=ConstantStrings.doctorName;break;
      case 4:title=ConstantStrings.wardName;break;
      case 5:title=ConstantStrings.doctorName;break;
    }
    return title;
  }

  getHint(int pos) {
    String title;
    switch(pos){
      case 1:title='Hospital Name';break;
      case 2:title='Hospital Number';break;
      case 3:title='Doctor Name';break;
      case 4:title=ConstantStrings.wardName;break;
      case 5:title=ConstantStrings.doctorName;break;
    }
    return title;
  }
}

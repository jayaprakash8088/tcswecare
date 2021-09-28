import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/api_utils/repository.dart';
import 'package:tcswecare/mvc/model/pain_level_model.dart';
import 'package:tcswecare/mvc/model/pain_record_model.dart';
import 'package:tcswecare/mvc/model/symptom_record_model.dart';
import 'package:tcswecare/mvc/model/symptoms_response_model.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/app_shared_preferences.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';

class PainIndicatorController extends ControllerMVC {
  factory PainIndicatorController() {
    return _this ??= PainIndicatorController._();
  }
  static PainIndicatorController _this;
  PainIndicatorController._();
  static PainIndicatorController get con => _this;
  AppSharedPreferences _sharedPreferences = AppSharedPreferences();
  Repository repository = Repository();

  //date value
  DateTime dateTime;
  DateTime selectedDate;
  DateTime time;
  DateTime selectedTime;
  DateTime date1;
  DateTime time1;
  TextEditingController comments = TextEditingController();

  ///ui related//
  String getCardsText(int index) {
    String text = '';
    switch (index) {
      case 0:
        text = ConstantStrings.takeExtraDose;
        break;
      case 1:
        text = ConstantStrings.contactDoctor;
        break;
      case 2:
        text = ConstantStrings.restWell;
        break;
    }
    return text;
  }

  String getCardsImages(int index) {
    String image;
    switch (index) {
      case 0:
        image = Assets.tablet;
        break;
      case 1:
        image = Assets.telephone;
        break;
      case 2:
        image = Assets.restWell;
        break;
    }
    return image;
  }

  TextStyle getStyle(int i) {
    TextStyle style;
    if (i == 1) {
      style = AppConfig.normalText;
    } else {
      style = TextStyle(
          fontSize: FontSize.size12,
          fontWeight: FontWeight.w500,
          fontFamily: AppConfig.montserrat,
          fontStyle: AppConfig.normal,
          color: AppColor.hintText);
    }
    return style;
  }

  String getImage(int i) {
    if (i == 1) {
      return Assets.loadingCompleted;
    } else
      return Assets.loading;
  }

  Future<PainRecordModelResponse> submit(BuildContext context) async {
    var userId = await _sharedPreferences.getUserId();
    PainLevelModel painLevelModel = PainLevelModel(
        painDate: getDate().toString(),
        painTime: getTime().toString(),
        painLevel: AppConfig.spinnerValue.toStringAsFixed(2).toString(),
        userID: userId);
    var token = await _sharedPreferences.getToken();
    PainRecordModelResponse response =
        await repository.savePatientPainInfo(painLevelModel, context, token);
    return response;
  }

  Future<PainRecordModelResponse> submitSymptoms(BuildContext context) async {
    var userId = await _sharedPreferences.getUserId();
    SymptomRecordModel symptomRecordModel = SymptomRecordModel(
        userID: userId,
        anxiety: AppConfig.anxietyValue.toStringAsFixed(2).toString(),
        constipation: AppConfig.constipationValue.toStringAsFixed(2).toString(),
        itchyOrDrySkin: AppConfig.drySkinValue.toStringAsFixed(2).toString(),
        mood: AppConfig.moodValue.toStringAsFixed(2).toString(),
        nausea: AppConfig.nauseaValue.toStringAsFixed(2).toString(),
        symptomDate: getTime().toString(),
        symptomTime: getTime().toString(),
        otherComments: comments.text.trim(),
        shortnessOfBreath: AppConfig.breathValue.toStringAsFixed(2).toString());
    var token = await _sharedPreferences.getToken();
    PainRecordModelResponse response = await repository.savePatientSymptoms(
        symptomRecordModel, context, token);
    return response;
  }

  // get symptoms////
  Future<SymptomsResponseModel> getSymptomsInfo(BuildContext context) async {
    var token = await _sharedPreferences.getToken();
    SymptomsResponseModel response =
        await repository.getSymptomsInfo(context, token);
    return response;
  }

  DateTime getDate() {
    var date;
    if (dateTime != null) {
      date = dateTime;
    } else {
      date = AppConfig.now;
    }
    return date;
  }

  DateTime getTime() {
    var dateTime;
    if (time != null) {
      dateTime = time;
    } else {
      dateTime = AppConfig.now;
    }
    return dateTime;
  }
}

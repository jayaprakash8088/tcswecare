import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tcswecare/mvc/api_utils/repository.dart';
import 'package:tcswecare/mvc/model/history_model.dart';
import 'package:tcswecare/mvc/model/pain_response_model.dart';
import 'package:tcswecare/mvc/model/symptoms_response_model.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/app_shared_preferences.dart';

class HisToryController extends ControllerMVC {
  factory HisToryController() {
    return _this ??= HisToryController._();
  }
  static HisToryController _this;
  HisToryController._();
  static HisToryController get con => _this;
  HistoryModel _historyModel = HistoryModel();
  List<Data> get data => _historyModel.data3;
  AppSharedPreferences _sharedPreferences = AppSharedPreferences();
  Repository repository = Repository();
  List<Data> anxiety = [];
  List<Data> constipation = [];
  List<Data> nausea = [];
  List<Data> drySkin = [];
  List<Data> shortnessOfBreath = [];
  List<Data> pain = [];
  List<ChartSeries> allLists = [];
  // get symptoms////

  StreamController<SymptomsResponseModel> getSymptomsCon =
      StreamController<SymptomsResponseModel>.broadcast();
  StreamController<SymptomsResponseModel> get getSymptomsList => getSymptomsCon;
  Future<dynamic> getSymptomsInfo(BuildContext context) async {
    SymptomsResponseModel response;
    try {
      var token = await _sharedPreferences.getToken();
      response = await repository.getSymptoms(context, token);
      if (response != null && response.statusCode == 200) {
        anxiety.clear();
        constipation.clear();
        nausea.clear();
        drySkin.clear();
        shortnessOfBreath.clear();
        response.result.sort((Result model1, Result model2) {
          return DateTime.parse(checkDate(model1.symptomDate))
              .compareTo(DateTime.parse(checkDate(model2.symptomDate)));
        });
        for (int i = 0; i < response.result.length; i++) {
          anxiety.add(Data(response.result[i].anxiety,
              getDate(response.result[i].symptomDate)));
          constipation.add(Data(response.result[i].constipation,
              getDate(response.result[i].symptomDate)));
          nausea.add(Data(response.result[i].nausea,
              getDate(response.result[i].symptomDate)));
          drySkin.add(Data(response.result[i].itchyOrDrySkin,
              getDate(response.result[i].symptomDate)));
          shortnessOfBreath.add(Data(response.result[i].shortnessOfBreath,
              getDate(response.result[i].symptomDate)));
        }
      }
    } catch (e) {}
    return getSymptomsCon.add(response);
  }
  void getPainInfo(BuildContext context) async{
    PainResponseModel response;
    try {
      var token = await _sharedPreferences.getToken();
      response = await repository.getPainsInfo(context, token);
      if (response != null && response.statusCode == 200) {
        pain.clear();
        for (int i = 0; i < response.result.length; i++) {
          pain.add(Data(response.result[i].painLevel,
              getDate(response.result[i].painDate)));
        }
      }
    } catch (e) {}
  }
  String getDate(String date) {
    return AppConfig.date.format(DateTime.parse(date));
  }

  getSeries() {
    return SplineAreaSeries<Data, String>(
        gradient: getGradient(),
        dataSource: getList(),
        xValueMapper: (Data sales, _) => sales.date,
        yValueMapper: (Data sales, _) => getY(sales.pain));
  }

  getList() {
    switch (AppConfig.diagnosisSelected) {
      case '1':
        return anxiety;
        break;
      case '2':
        return constipation;
        break;
      case '3':
        return nausea;
        break;
      case '4':
        return drySkin;
        break;
      case '5':
        return shortnessOfBreath;
        break;
      case '6':
        return pain;
        break;
      default:
        return anxiety;
    }
  }

  num getY(String pain) {
    if (pain.toString() == 'null' || pain.toString() == 'string') {
      pain = "0";
    }
    return num.parse(pain);
  }

  getGradient() {
    switch (AppConfig.diagnosisSelected) {
      case '1':
        return AppConfig.anxietyGradient;
        break;
      case '2':
        return AppConfig.constipationGradient;
        break;
      case '3':
        return AppConfig.nauseaGradient;
        break;
      case '4':
        return AppConfig.drySkinGradient;
        break;
      case '5':
        return AppConfig.shortnessOfBreathGradient;
        break;
      case '6':
        return AppConfig.painGradient;
        break;
    }
  }

  String checkDate(String symptomDate) {
    if (symptomDate != null && symptomDate.trim().isNotEmpty) {
      return symptomDate;
    } else {
      return AppConfig.now.toString();
    }
  }


}

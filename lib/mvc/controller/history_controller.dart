import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tcswecare/mvc/api_utils/repository.dart';
import 'package:tcswecare/mvc/model/history_model.dart';
import 'package:tcswecare/mvc/model/pain_response_model.dart';
import 'package:tcswecare/mvc/model/symptoms_response_model.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
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
  List<Data> discomfort = [];
  List<Data> diarrhea = [];
  List<Data> fatigue = [];
  List<Data> cough = [];
  List<Data> appetite = [];
  List<ChartSeries> allLists = [];


  // static data

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

  void getPainInfo(BuildContext context) async {
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
    return SplineSeries<Data, String>(
        color: getGradient(),
        dataSource: getList(),

        xValueMapper: (Data sales, _) => sales.date,
        yValueMapper: (Data sales, _) => getY(sales.pain));
  }

  getList() {
    switch (AppConfig.diagnosisSelected) {
      case '1':
        return discomfort;
        break;
      case '2':
        return anxiety;
        break;
      case '3':
        return constipation;
        break;
      case '4':
        return cough;
        break;
      case '5':
        return diarrhea;
        break;
      case '6':
        return fatigue;
        break;
      case '7':
        return drySkin;
        break;
      case '8':
        return appetite;
        break;
      case '9':
        return nausea;
        break;
      case '10':
        return pain;
        break;
      case '11':
        return shortnessOfBreath;
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
        return AppColor.discomfortLine;
        break;
      case '2':
        return AppColor.anxietyLine;
        break;
      case '3':
        return AppColor.constipationLine;
        break;
      case '4':
        return AppColor.coughLine;
        break;
      case '5':
        return AppColor.diarrheaLine;
        break;
      case '6':
        return AppColor.fatigueLine;
        break;
      case '7':
        return AppColor.drySkinLine;
        break;
      case '8':
        return AppColor.appetiteLine;
        break;
      case '9':
        return AppColor.nauseaLine;
        break;
      case '10':
        return AppColor.painLine;
        break;
      case '11':
        return AppColor.sobLine;
        break;

      default:
        return AppColor.painLine;
    }
  }

  String checkDate(String symptomDate) {
    if (symptomDate != null && symptomDate.trim().isNotEmpty) {
      return symptomDate;
    } else {
      return AppConfig.now.toString();
    }
  }

  void addData() {
    discomfort.addAll(_historyModel.data);
    anxiety.addAll(_historyModel.data);
    constipation.addAll(_historyModel.data);
    cough.addAll(_historyModel.data);
    diarrhea.addAll(_historyModel.data);
    fatigue.addAll(_historyModel.data);
    drySkin.addAll(_historyModel.data);
    appetite.addAll(_historyModel.data);
    nausea.addAll(_historyModel.data);
    pain.addAll(_historyModel.data);
    shortnessOfBreath.addAll(_historyModel.data);
    setState(() { });
  }
}

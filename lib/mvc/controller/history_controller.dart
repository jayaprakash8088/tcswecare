import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/api_utils/repository.dart';
import 'package:tcswecare/mvc/model/history_model.dart';
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
  //set value
  num getYValue(String pain) {
    int range = 0;
    switch (pain) {
      case 'None':
        range = 0;
        break;
      case 'Mild':
        range = 2;
        break;
      case 'Moderate':
        range = 3;
        break;
      case 'Severe':
        range = 4;
        break;
      case 'Unbearable':
        range = 5;
        break;
    }
    return range;
  }

  // get symptoms////
  Future<SymptomsResponseModel> getSymptomsInfo(BuildContext context) async {
    SymptomsResponseModel response;
    AppConfig.pleaseWait(context);
    try {
      var token = await _sharedPreferences.getToken();
      response = await repository.getSymptomsInfo(context, token);
      Navigator.pop(context);
    } catch (e) {}
    return response;
  }
}

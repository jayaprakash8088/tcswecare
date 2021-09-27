import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/api_utils/repository.dart';
import 'package:tcswecare/mvc/model/pain_level_model.dart';
import 'package:tcswecare/mvc/model/pain_tracker_model.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
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

  PainTrackerModel _model = PainTrackerModel();
  Repository repository = Repository();
  // spinner value
  double spinnerValue;
  //date value
  DateTime dateTime;
  DateTime selectedDate;
  DateTime time;
  DateTime selectedTime;
  DateTime date1;
  DateTime time1;
  double anxietyValue = 0.0;
  double moodValue = 0.0;
  double breathValue = 0.0;
  double drySkinValue = 0.0;
  double constipationValue = 0.0;
  double nauseaValue = 0.0;
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

  dynamic submit(BuildContext context) async {
    PainLevelModel painLevelModel = PainLevelModel(
        painDate: date1.toString(),
        painTime: time.toString(),
        painLevel: spinnerValue.toString(),
        userID: 'ad24ed76-4eac-4095-98b2-8bf45b94fb7d');
    dynamic response =
        await repository.savePatientPainInfo(painLevelModel, context);
    return response;
  }
}

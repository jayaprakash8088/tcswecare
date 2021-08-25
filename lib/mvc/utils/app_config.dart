import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConfig {
  // font family
  static String roboto = 'Roboto';
  static String montserrat = 'Montserrat';
  //font style
  static FontStyle normal = FontStyle.normal;
  static FontStyle italic = FontStyle.italic;
  static LinearGradient gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[AppColor.bg1, AppColor.bg2]);
  static List<Map> languageList = [
    {"id": 0, 'image': Assets.englishFlag, 'name': ConstantStrings.english},
    {'id': 1, 'image': Assets.malayFlag, 'name': ConstantStrings.malay}
  ];
  static List symptomLevels = [
    'None',
    'Mild',
    'Moderate',
    'Severe',
    'Unbearable'
  ];
  static List diagnosisList = [
    'Anxiety',
    'Shortness of\nBreath',
    'Itchy/Dry Skin',
    'Constipation',
    'Nausea'
  ];
  static List moodList = ['Positive', 'Neutral', 'Negative'];
  static String selected;
  static TextStyle blackText = TextStyle(
      fontSize: FontSize.size16,
      fontWeight: FontWeight.w600,
      fontFamily: AppConfig.montserrat,
      fontStyle: AppConfig.normal,
      color: AppColor.black);
  //center text
  static TextStyle centerText = TextStyle(
      fontSize: FontSize.size22,
      fontWeight: FontWeight.w500,
      fontFamily: AppConfig.montserrat,
      fontStyle: AppConfig.normal,
      color: AppColor.black);
  //call function
  static Future<dynamic> urlLauncher(String url) async {
    try {
      await launch(ConstantStrings.tel + url);
    } catch (e) {}
  }

  static var dateFormat = DateFormat('dd/MM/yyyy');
  static var timeFormat = DateFormat().add_jm();
  static DateTime now = DateTime.now();
  static Widget submitBtn() {
    return Center(
      child: Container(
        height: FontSize.size40,
        width: FontSize.size250,
        decoration: BoxDecoration(
          gradient: AppConfig.gradient,
          borderRadius: BorderRadius.all(Radius.circular(FontSize.size20)),
        ),
        child: Center(
          child: Text(
            ConstantStrings.submit,
            style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: FontSize.size14),
          ),
        ),
      ),
    );
  }
}

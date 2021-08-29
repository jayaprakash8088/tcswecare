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
  static LinearGradient blueGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[AppColor.blurGradient1, AppColor.blurGradient2]);
  static LinearGradient redGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
      colors: <Color>[AppColor.gr1, AppColor.gr2]);
  static List<Map> languageList = [
    {"id": 0, 'image': Assets.englishFlag, 'name': ConstantStrings.english},
    {'id': 1, 'image': Assets.malayFlag, 'name': ConstantStrings.malay}
  ];
  static List<Map> monthList = [
    {'id': 0, 'month': 'January'},
    {'id': 1, 'month': 'February'},
    {'id': 2, 'month': 'March'},
    {'id': 3, 'month': 'April'},
    {'id': 4, 'month': 'May'},
    {'id': 5, 'month': 'June'},
    {'id': 6, 'month': 'Jule'},
    {'id': 7, 'month': 'August'},
    {'id': 8, 'month': 'September'},
    {'id': 9, 'month': 'October'},
    {'id': 10, 'month': 'November'},
    {'id': 11, 'month': 'December'},
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
  static List<Map> diagnosisMap = [
    {'id': 0, 'name': 'Anxiety'},
    {'id': 1, 'name': 'Constipation'},
    {'id': 2, 'name': 'Nausea'},
    {'id': 3, 'name': 'Itchy/Dry Skin'},
    {'id': 4, 'name': 'Shortness of Breath'}
  ];
  static List<String> yValue = [
    'None',
    'Mild',
    'Moderate',
    'Severe',
    'Unbearable'
  ];
  static List<String> xValue = [
    '1',
    '3',
    '6',
    '9',
    '12',
    '15',
    '18',
    '21',
    '24',
    '27',
    '30'
  ];

  static String selected;
  static String monthSelected;
  static String diagnosisSelected;
  static TextStyle blackText = TextStyle(
      fontSize: FontSize.size16,
      fontWeight: FontWeight.w600,
      fontFamily: AppConfig.montserrat,
      fontStyle: AppConfig.normal,
      color: AppColor.black);
  static TextStyle normalText = TextStyle(
      fontSize: FontSize.size12,
      fontWeight: FontWeight.w500,
      fontFamily: AppConfig.montserrat,
      fontStyle: AppConfig.normal,
      color: AppColor.black);
  //center text
  static TextStyle centerText = TextStyle(
      fontSize: FontSize.size25,
      fontWeight: FontWeight.w600,
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

  //roboto text
  static TextStyle robotoText = TextStyle(
      color: AppColor.white,
      fontFamily: AppConfig.roboto,
      fontStyle: AppConfig.normal,
      fontWeight: FontWeight.bold,
      fontSize: FontSize.size14);
  static TextStyle robotoTextBlack = TextStyle(
      color: AppColor.black,
      fontFamily: AppConfig.roboto,
      fontStyle: AppConfig.normal,
      fontSize: FontSize.size14);
}

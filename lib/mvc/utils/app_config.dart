import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';

class AppConfig {
  static LinearGradient gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[AppColor.bg1, AppColor.bg2]);
  static List<Map> languageList = [
    {"id": 0, 'image': Assets.englishFlag, 'name': ConstantStrings.english},
    {'id': 1, 'image': Assets.malayFlag, 'name': ConstantStrings.malay}
  ];
  static String selected;
  static TextStyle blackText = TextStyle(
      fontSize: FontSize.size16,
      fontWeight: FontWeight.w500,
      color: AppColor.black);
}

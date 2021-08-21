import 'package:flutter/cupertino.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';

class AppConfig {
  static LinearGradient gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[AppColor.bg1, AppColor.bg2]);
}

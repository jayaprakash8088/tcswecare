import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tcswecare/MyApp.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) => Container(
        child: Center(
          child: Text(
            ConstantStrings.somethingWrong,
            style: TextStyle(
              color: Colors.black,
              fontSize: FontSize.size16,
            ),
          ),
        ),
      );
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ms', 'MYS')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      saveLocale: true,
      child: WeCareApp()));
}

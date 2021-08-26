import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tcswecare/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) => Container(
        child: Center(
          child: Text(
            "Something went wrong",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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

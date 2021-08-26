import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/view/contact_doctor.dart';
import 'package:tcswecare/mvc/view/home_page.dart';
import 'package:tcswecare/mvc/view/initial_page.dart';
import 'package:tcswecare/mvc/view/login_screen.dart';
import 'package:tcswecare/mvc/view/pain_indicator_screen.dart';
import 'package:tcswecare/mvc/view/sign_up_screen.dart';
import 'package:tcswecare/mvc/view/splash_screen.dart';
import 'package:tcswecare/mvc/view/tracker.dart';

class WeCareApp extends AppMVC {
  static MaterialApp _app;
  @override
  Widget build(BuildContext context) {
    _app = MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      title: 'TCS We Care',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/initialPage': (context) => InitialPage(),
        '/login': (context) => LoginScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/homePage': (context) => HomePage(),
        '/contactDoctor': (context) => ContactDoctor(),
        '/painIndicator': (context) => PainIndicatorScreen(),
        '/tracker': (context) => SymptomTrackerPage(),
      },
    );
    return _app;
  }
}

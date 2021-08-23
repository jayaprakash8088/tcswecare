import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/view/contact_doctor.dart';
import 'package:tcswecare/mvc/view/home_page.dart';
import 'package:tcswecare/mvc/view/initial_page.dart';
import 'package:tcswecare/mvc/view/login_screen.dart';
import 'package:tcswecare/mvc/view/sign_up_screen.dart';

class WeCareApp extends AppMVC {
  static MaterialApp _app;
  @override
  Widget build(BuildContext context) {
    _app = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TCS We Care',
      initialRoute: '/',
      routes: {
        '/': (context) => InitialPage(),
        '/login': (context) => LoginScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/homePage': (context) => HomePage(),
        '/contactDoctor': (context) => ContactDoctor(),
      },
    );
    return _app;
  }
}

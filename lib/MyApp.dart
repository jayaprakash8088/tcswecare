import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/view/initial_page.dart';

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
      },
    );
    return _app;
  }
}

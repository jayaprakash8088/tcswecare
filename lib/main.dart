import 'package:flutter/material.dart';
import 'package:tcswecare/MyApp.dart';

void main() {
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
  runApp(WeCareApp());
}

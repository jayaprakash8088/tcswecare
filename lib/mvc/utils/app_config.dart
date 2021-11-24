import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  // spinner value
  static double spinnerValue = 0.0;
  static double anxietyValue = 0.0;
  static double moodValue = 0.0;
  static double breathValue = 0.0;
  static double drySkinValue = 0.0;
  static double constipationValue = 0.0;
  static double nauseaValue = 0.0;

  ///api///////////////
  static String baseUrl = 'http://34.126.104.146/';
  static String bearer = 'Bearer ';
  static String contentType = 'application/json';
  static String token = 'token';
  static String savePatientPainInfo = 'savePatientPainInfo';
  static String savePatientSymptomInfo = 'savePatientSymptomInfo';
  static String getPatientInfo = 'getPatientInfo';
  static String getPatientSymptomInfo = 'getPatientSymptomInfo';
  static String signUp = 'api/Account/register';
  static String resendOtp = 'api/Account/resendOtp';
  static String verifyOtp = 'api/Account/verifyOtp?otp=';
  static String forgotPassword = 'api/Account/forgotPassword';
  static String changePassword = 'api/Account/changePassword';

////////////////////////////////////////////////////////////////////////
  static LinearGradient gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[AppColor.bg1, AppColor.bg2]);
  static Color divider = Color.fromRGBO(231, 231, 231, 1);
  static LinearGradient blueGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[AppColor.blurGradient1, AppColor.blurGradient2]);
  static LinearGradient redGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
      colors: <Color>[AppColor.gr1, AppColor.gr2]);
  static LinearGradient anxietyGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[AppColor.anxiety1, AppColor.white]);
  static LinearGradient nauseaGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[AppColor.nausea, AppColor.white]);
  static LinearGradient constipationGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[AppColor.constipation, AppColor.white]);
  static LinearGradient drySkinGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[AppColor.redGradient2, AppColor.white]);
  static LinearGradient shortnessOfBreathGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[AppColor.blueGradient2, AppColor.white]);
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
    {'id': 0, 'name': 'All'},
    {'id': 1, 'name': 'Anxiety'},
    {'id': 2, 'name': 'Constipation'},
    {'id': 3, 'name': 'Nausea'},
    {'id': 4, 'name': 'Itchy/Dry Skin'},
    {'id': 5, 'name': 'Shortness of Breath'}
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
  static List ageList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  static bool isShowingDialog = false;
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
  static TextStyle text = TextStyle(
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
  static var date = DateFormat.d();

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

  //please wait
  static dynamic pleaseWait(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            // ignore: missing_return
            onWillPop: () {},
            child: AlertDialog(
              content: Container(
                  child: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: FontSize.size15, right: FontSize.size15),
                      child: Text(
                        ConstantStrings.pleaseWait,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              )),
            ),
          );
        });
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

  //no internet pop up
  static dynamic noInternetPopUp(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              ConstantStrings.weCare,
              style: TextStyle(color: AppColor.bgBlue),
            ),
            content: getContent(context),
          );
        });
  }

  static getContent(BuildContext context) {
    isShowingDialog = true;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(ConstantStrings.noInternet),
        InkWell(
          onTap: () {
            isShowingDialog = false;
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              height: FontSize.size50,
              width: double.infinity,
              child: Center(
                  child: Text(ConstantStrings.ok,
                      style: TextStyle(color: Colors.blueAccent))),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blueAccent)),
            ),
          ),
        )
      ],
    );
  }

  static void showToast(BuildContext context, String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: AppColor.grey);
  }

  static List rangeList = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  static List hurtList = [
    'No\nHurt',
    'Hurts\nLittle Bit',
    'Hurts\nLittle More',
    'Hurts\nEven More',
    'Hurts\nWhole Lots',
    'Hurts\nWorst'
  ];

  //password patter
  static String passwordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static String mailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
}

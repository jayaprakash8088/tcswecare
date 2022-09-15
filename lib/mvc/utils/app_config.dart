import 'dart:ui';

import 'package:easy_localization/src/public_ext.dart';
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
  static double discomfortValue = 0.0;
  static double anxietyValue = 0.0;
  static double constipationValue = 0.0;
  static double coughValue = 0.0;
  static double diarrheaValue = 0.0;
  static double fatigueValue = 0.0;
  static double drySkinValue = 0.0;
  static double appetiteValue=0.0;
  static double nauseaValue = 0.0;
  static double breathValue = 0.0;
  static double moodValue = 0.0;

  ///api///////////////
  static String baseUrl = 'http://34.126.104.146/';
  static String bearer = 'Bearer ';
  static String contentType = 'application/json';
  static String token = 'token';
  static String savePatientPainInfo = 'savePatientPainInfo';
  static String savePatientSymptomInfo = 'savePatientSymptomInfo';
  static String getPatientInfo = 'getPatientInfo';
  static String getPatientSymptomInfo = 'getPatientSymptomInfo';
  static String getPatientPainInfo = 'getPatientPainInfo';
  static String signUp = 'api/Account/register';
  static String logOut = 'api/Account/Logout';
  static String resendOtp = 'api/Account/resendOtp';
  static String verifyOtp = 'api/Account/verifyOtp?otp=';
  static String forgotPassword = 'api/Account/forgotPassword';
  static String changePassword = 'api/Account/changePassword';

////////////////////////////////////////////////////////////////////////
  static LinearGradient gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[AppColor.bg1,
        AppColor.bg2]);
  static LinearGradient sliderGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        AppColor.slider0,
        AppColor.slider1,
        AppColor.slider2,
        AppColor.slider3,
        AppColor.slider4,
        AppColor.slider5,
        AppColor.slider6,
        AppColor.slider7,
        AppColor.slider8,
        AppColor.slider9,
        AppColor.slider10,
      ]);
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
  static LinearGradient painGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[AppColor.painGradient1, AppColor.white]);
  static List<Map> languageList = [
    {"id": 0, 'image': Assets.englishFlag, 'name': ConstantStrings.english},
    {'id': 1, 'image': Assets.malayFlag, 'name': ConstantStrings.malay},
//    {'id': 2, 'image': Assets.malayFlag, 'name': ConstantStrings.tamil},
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
  ];
  static List symptomLevelsMalay = [
    'Tiada',
    'Ringan',
    'Sederhana',
    'Teruk',
  ];
  static List diagnosisList = [
    'Abdominal pain/ discomfort',
    'Anxiety',
    'Constipation',
    'Cough',
    'Diarrhea',
    'Fatigue',
    'Shortness of\nBreath',
    'Itchy/Dry Skin',
    'Loss of appetite',
    'Nausea'
  ];
  static List diagnosisListMalay = [
    'Sakit perut/ ketidakselesaan',
    'Kebimbangan',
    'Sembelit',
    'batuk',
    'Cirit-birit',
    'Keletihan',
    'Sesak nafas',
    'Kulit gatal/kering',
    'Hilang selera makan'
    'Loya'
  ];
  static List<Map> diagnosisMap = [
    {'id': 0, 'name': 'All'},
    {'id': 1, 'name': 'Anxiety'},
    {'id': 2, 'name': 'Constipation'},
    {'id': 3, 'name': 'Nausea'},
    {'id': 4, 'name': 'Itchy/Dry Skin'},
    {'id': 5, 'name': 'Shortness of Breath'},
    {'id': 6, 'name': 'Pain'},
  ];
  static List<Map> diagnosisMapMalay = [
    {'id': 0, 'name': 'Semua'},
    {'id': 1, 'name': 'Kebimbangan'},
    {'id': 2, 'name': 'Sembelit'},
    {'id': 3, 'name': 'Loya'},
    {'id': 4, 'name': 'Kulit gatal/kering'},
    {'id': 5, 'name': 'Sesak nafas'},
    {'id': 6, 'name': 'Kesakitan'},
  ];
  static List<String> yValueMalay = symptomLevelsMalay;
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
            'submit'.tr(),
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
                        "pleaseWait".tr(),
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
static TextStyle startText=TextStyle(
    color: AppColor.black,
    fontFamily: AppConfig.roboto,
    fontStyle: AppConfig.normal,
    fontWeight: FontWeight.w600,
    fontSize: FontSize.size24
);
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
                  child: Text( 'ok'.tr(),
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
  static List hurtListMalay = [
    'Tiada\nSakit',
    'Sakit\nSedikit',
    'Sakit\nSedikit Lagi',
    'Sakit\nLebih',
    'Sakit\nLebih Banyak',
    'Sakit\nPaling Teruk'
  ];

  //password patter
  static String passwordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static String mailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';


  static String passwordCondition='*Password should contains at least 8 character including '
      '1 upper case letter,1 lower case letter,1 number and 1 special character';
}

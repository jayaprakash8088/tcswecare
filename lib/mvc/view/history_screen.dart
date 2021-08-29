import 'package:charts_flutter/flutter.dart' as charts;
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/utils/locale_drop_down.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key key}) : super(key: key);

  @override
  _HistoryScreenState createState() {
    return _HistoryScreenState();
  }
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<charts.Series<Sales, int>> _seriesLineData;

  @override
  void initState() {
    super.initState();
    _seriesLineData = <charts.Series<Sales, int>>[];
  }

  final List<Feature> features = [
    Feature(
      color: Colors.blue,
      data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
    ),
    Feature(
      color: Colors.black,
      data: [1, 0.8, 0.6, 0.7, 0.3, 0.1],
    ),
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgWhite,
      body: SingleChildScrollView(
        physics: ScrollPhysics(parent: ScrollPhysics()),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: AppColor.bgWhite,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                Assets.smallBlueRect,
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
                top: FontSize.size10,
                right: FontSize.size20,
                child: Container(
                    height: FontSize.size100,
                    width: FontSize.size140,
                    child: Center(child: LocaleDropDown()))),
            Padding(
              padding: EdgeInsets.only(
                  top: FontSize.size100, bottom: FontSize.size20),
              child: buildUI(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          ConstantStrings.history,
          style: TextStyle(
              fontSize: FontSize.size25,
              fontWeight: FontWeight.w500,
              fontFamily: AppConfig.montserrat,
              fontStyle: AppConfig.normal,
              color: AppColor.black),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: FontSize.size150, bottom: FontSize.size20),
          child: Text(
            ConstantStrings.symptomsOverTime,
            style: AppConfig.blackText,
          ),
        ),
        dropDownBox(),
        Padding(
            padding: EdgeInsets.only(top: FontSize.size20),
            // child: areaGraph(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: areaChart(),
            ))
      ],
    );
  }

  Widget dropDownBox() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [monthDropDown(), diagnosisDropDown()],
      ),
    );
  }

  Widget monthDropDown() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColor.black)),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            isDense: true,
            hint: Text(
              ConstantStrings.january,
              style: AppConfig.robotoTextBlack,
            ),
            value: AppConfig.monthSelected,
            onChanged: (String newValue) {
              setState(() {
                AppConfig.monthSelected = newValue;
                if (newValue == '0') {
                } else {}
              });
            },
            items: AppConfig.monthList.map((Map map) {
              return new DropdownMenuItem<String>(
                value: map["id"].toString(),
                // value: _mySelection,
                child: Container(
                    margin: EdgeInsets.only(left: FontSize.size10),
                    child: Text(map["month"])),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget diagnosisDropDown() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColor.black)),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            isDense: true,
            value: AppConfig.diagnosisSelected,
            hint: Text(
              ConstantStrings.diagnosis,
              style: AppConfig.robotoTextBlack,
            ),
            onChanged: (String newValue) {
              setState(() {
                AppConfig.diagnosisSelected = newValue;
                if (newValue == '0') {
                } else {}
              });
            },
            items: AppConfig.diagnosisMap.map((Map map) {
              return new DropdownMenuItem<String>(
                value: map["id"].toString(),
                child: Container(
                    margin: EdgeInsets.only(left: FontSize.size10),
                    child: Text(map["name"])),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget areaChart() {
    return charts.LineChart(
      _seriesLineData,
      defaultRenderer:
          new charts.LineRendererConfig(includeArea: true, stacked: true),
      animate: true,
      animationDuration: Duration(seconds: 5),
    );
  }
}

class Sales {
  int date;
  String diagnosis;

  Sales(this.date, this.diagnosis);
}

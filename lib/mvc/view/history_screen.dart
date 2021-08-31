import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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
  List<SalesData> data = [
    SalesData('None', '1'),
    SalesData('Mild', '2'),
    SalesData('Moderate', '3'),
    SalesData('Severe', '3'),
    SalesData('Unbearable', '4')
  ];
  List<SalesData> data1 = [
    SalesData('None', '10'),
    SalesData('Mild', '21'),
    SalesData('Moderate', '23'),
    SalesData('Severe', '30'),
    SalesData('Unbearable', '24')
  ];
  @override
  void initState() {
    super.initState();
  }

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
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: graph(),
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

  Widget graph() {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: CategoryAxis(),
        series: <ChartSeries<SalesData, String>>[
          SplineAreaSeries<SalesData, String>(
              dataSource: data,
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => 1),
          SplineAreaSeries<SalesData, String>(
              dataSource: data1,
              color: AppColor.red,
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => 2),
        ]);
  }
}

class SalesData {
  final String pain;
  final String date;
  SalesData(this.pain, this.date);
}

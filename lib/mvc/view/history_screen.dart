import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tcswecare/mvc/controller/history_controller.dart';
import 'package:tcswecare/mvc/model/history_model.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/utils/locale_drop_down.dart';
import 'package:tcswecare/mvc/view/home_page.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key key}) : super(key: key);

  @override
  _HistoryScreenState createState() {
    return _HistoryScreenState();
  }
}

class _HistoryScreenState extends StateMVC<HistoryScreen> {
  _HistoryScreenState() : super(HisToryController()) {
    _controller = controller;
  }
  HisToryController _controller;
  ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    super.initState();
    callApi();
    _zoomPanBehavior = ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        enableDoubleTapZooming: true,
        enableSelectionZooming: true);
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
        Padding(
          padding: EdgeInsets.only(bottom: FontSize.size20),
          child: dropDownBox(),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: FontSize.size10),
              child: Text(ConstantStrings.severity),
            )),
        Padding(
          padding: EdgeInsets.only(top: FontSize.size20),
          child: graph(),
        ),
        Center(
          child: Text(ConstantStrings.days),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
            },
            child: Padding(
              padding: EdgeInsets.only(top: FontSize.size25),
              child: Center(
                child: Container(
                  height: FontSize.size40,
                  width: FontSize.size200,
                  decoration: BoxDecoration(
                    gradient: AppConfig.gradient,
                    borderRadius:
                        BorderRadius.all(Radius.circular(FontSize.size20)),
                  ),
                  child: Center(
                    child: Text(
                      ConstantStrings.home,
                      style: AppConfig.robotoText,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
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
              ConstantStrings.anxiety,
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
        enableMultiSelection: true,
        zoomPanBehavior: _zoomPanBehavior,
        primaryYAxis: NumericAxis(maximum: FontSize.size10),
        series: <ChartSeries>[
          SplineAreaSeries<Data, String>(
              gradient: AppConfig.nauseaGradient,
              dataSource: _controller.data,
              xValueMapper: (Data sales, _) => sales.date,
              yValueMapper: (Data sales, _) =>
                  _controller.getYValue(sales.pain)),
        ]);
  }

  DateTime getStartDate() {
    return DateTime(
        AppConfig.now.year, AppConfig.now.month, AppConfig.now.day - 30);
  }

  void callApi() {}
}

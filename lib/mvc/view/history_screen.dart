import 'package:easy_localization/src/public_ext.dart';
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
                top: FontSize.size20,
                right: FontSize.size20,
                child: Container(
                    height: FontSize.size100,
                    width: FontSize.size160,
                    child: Center(child: LocaleDropDown()))),
            Padding(
              padding: EdgeInsets.only(
                  top: FontSize.size100, bottom: FontSize.size20),
              child: StreamBuilder<Object>(
                stream: _controller.getSymptomsCon.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData != null &&
                      !snapshot.hasError &&
                      snapshot.hasData) {
                    return buildUI();
                  } else {
                    return buildUI();
                    // return Padding(
                    //   padding: EdgeInsets.only(
                    //       top: MediaQuery.of(context).size.height * 0.4),
                    //   child: GraphShimmer(),
                    // );
                  }
                },
              ),
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
          'history'.tr(),
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
            'symptomsOverTime'.tr(),
            style: AppConfig.blackText,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: FontSize.size20, right: FontSize.size6),
          child: dropDownBox(),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: FontSize.size10),
              child: Text(
                'severity'.tr(),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(top: FontSize.size20),
          child: graph(),
        ),
        Center(
          child: Text(
            'days'.tr(),
          ),
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
                      'home'.tr(),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          monthDropDown(),
          SizedBox(width: 10,),
          diagnosisDropDown()],
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
                    // margin: EdgeInsets.only(left: FontSize.size10),
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
              'all'.tr(),
              style: AppConfig.robotoTextBlack,
            ),
            onChanged: (String newValue) {
              setState(() {
                AppConfig.diagnosisSelected = newValue;
              });
            },
            items: AppConfig.selected == '0'
                ? AppConfig.diagnosisMap.map((Map map) {
                    return new DropdownMenuItem<String>(
                      value: map["id"].toString(),
                      child: Container(
                          // margin: EdgeInsets.only(left: FontSize.size10),
                          child: Text(map["name"])),
                    );
                  }).toList()
                : AppConfig.diagnosisMapMalay.map((Map map) {
                    return new DropdownMenuItem<String>(
                      value: map["id"].toString(),
                      child: Container(
                          // margin: EdgeInsets.only(left: FontSize.size10),
                          child: Text(map["name"])),
                    );
                  }).toList(),
          ),
        ),
      ),
    );
  }

  Widget graph() {
    return getSelectedGraph();
  }

  DateTime getStartDate() {
    return DateTime(
        AppConfig.now.year, AppConfig.now.month, AppConfig.now.day - 30);
  }

  Future callApi() async {
    // _controller.getSymptomsInfo(context);
    // _controller.getPainInfo(context);
    _controller.addData();
  }

  Widget getSelectedGraph() {
    if (AppConfig.diagnosisSelected != null &&
        AppConfig.diagnosisSelected != '0') {
      return SfCartesianChart(
          enableMultiSelection: true,
          zoomPanBehavior: _zoomPanBehavior,
          primaryYAxis: NumericAxis(maximum: FontSize.size10),
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[_controller.getSeries()]);
    } else  {
      return SfCartesianChart(
          enableMultiSelection: true,
          zoomPanBehavior: _zoomPanBehavior,
          primaryYAxis: NumericAxis(maximum: FontSize.size10),
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            SplineSeries<Data, String>(
                color: AppColor.discomfortLine,
                yAxisName: ConstantStrings.severity,
                dataSource: _controller.discomfort,
                xValueMapper: (Data sales, _) => sales.date,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain)),
            SplineSeries<Data, String>(
                color: AppColor.anxietyLine,
                dataSource: _controller.anxiety,
                yAxisName: ConstantStrings.severity,
                xValueMapper: (Data sales, _) => sales.date,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain)),
            SplineSeries<Data, String>(
                color: AppColor.constipationLine,
                dataSource: _controller.nausea,
                xValueMapper: (Data sales, _) => sales.date,
                yAxisName: ConstantStrings.severity,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain)),
            SplineSeries<Data, String>(
                color: AppColor.coughLine,
                dataSource: _controller.drySkin,
                xValueMapper: (Data sales, _) => sales.date,
                yAxisName: ConstantStrings.severity,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain)),
            SplineSeries<Data, String>(
                color: AppColor.diarrheaLine,
                dataSource: _controller.shortnessOfBreath,
                xValueMapper: (Data sales, _) => sales.date,
                yAxisName: ConstantStrings.severity,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain)),
            SplineSeries<Data, String>(
                color: AppColor.fatigueLine,
                dataSource: _controller.shortnessOfBreath,
                yAxisName: ConstantStrings.severity,
                xValueMapper: (Data sales, _) => sales.date,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain)),
            SplineSeries<Data, String>(
                color: AppColor.drySkinLine,
                dataSource: _controller.shortnessOfBreath,
                yAxisName: ConstantStrings.severity,
                xValueMapper: (Data sales, _) => sales.date,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain)),
            SplineSeries<Data, String>(
                color: AppColor.appetiteLine,
                dataSource: _controller.shortnessOfBreath,
                yAxisName: ConstantStrings.severity,
                xValueMapper: (Data sales, _) => sales.date,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain)),
            SplineSeries<Data, String>(
                color: AppColor.nauseaLine,
                dataSource: _controller.shortnessOfBreath,
                yAxisName: ConstantStrings.severity,
                xValueMapper: (Data sales, _) => sales.date,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain)),
            SplineSeries<Data, String>(
                color: AppColor.painLine,
                dataSource: _controller.pain,
                yAxisName: ConstantStrings.severity,
                xValueMapper: (Data sales, _) => sales.date,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain)),
            SplineSeries<Data, String>(
                color: AppColor.sobLine,
                dataSource: _controller.shortnessOfBreath,
                yAxisName: ConstantStrings.severity,
                xValueMapper: (Data sales, _) => sales.date,
                yValueMapper: (Data sales, _) => _controller.getY(sales.pain))
          ]);
    }
  }

}

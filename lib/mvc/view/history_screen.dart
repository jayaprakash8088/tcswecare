import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tcswecare/mvc/controller/history_controller.dart';
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
  List<Data> data = [
    Data('Severe', '1'),
    Data('Severe', '2'),
    Data('Moderate', '3'),
    Data('Severe', '4'),
    Data('Unbearable', '5'),
    Data('Mild', '6'),
    Data('Mild', '7'),
    Data('Moderate', '8'),
    Data('None', '9'),
    Data('None', '10'),
    Data('None', '11'),
    Data('Moderate', '12'),
    Data('Moderate', '13'),
    Data('Severe', '14'),
    Data('Severe', '15'),
    Data('Unbearable', '16'),
    Data('None', '17'),
    Data('None', '18'),
    Data('Mild', '19'),
    Data('Mild', '20'),
    Data('Severe', '21'),
    Data('Severe', '22'),
    Data('None', '23'),
    Data('None', '24'),
    Data('Mild', '25'),
    Data('Mild', '26'),
    Data('Unbearable', '27'),
    Data('Unbearable', '28'),
    Data('Mild', '29'),
    Data('Severe', '30')
  ];
  List<Data> data1 = [
    Data('None', '1'),
    Data('Mild', '2'),
    Data('Moderate', '3'),
    Data('Severe', '4'),
    Data('Unbearable', '5'),
    Data('Unbearable', '6'),
    Data('Unbearable', '7'),
    Data('Unbearable', '8'),
    Data('Unbearable', '9'),
    Data('None', '10'),
    Data('None', '11'),
    Data('None', '12'),
    Data('None', '13'),
    Data('None', '14'),
    Data('None', '15'),
    Data('None', '16'),
    Data('None', '17'),
    Data('None', '18'),
    Data('None', '19'),
    Data('None', '20'),
    Data('Mild', '21'),
    Data('Mild', '22'),
    Data('Moderate', '23'),
    Data('Unbearable', '24'),
    Data('Unbearable', '25'),
    Data('Unbearable', '26'),
    Data('Unbearable', '27'),
    Data('Unbearable', '28'),
    Data('Unbearable', '29'),
    Data('Mild', '30')
  ];
  List<Data> data3 = [
    Data('None', '1'),
    Data('None', '2'),
    Data('Mild', '3'),
    Data('Severe', '4'),
    Data('Moderate', '5'),
    Data('Severe', '6'),
    Data('Mild', '7'),
    Data('None', '8'),
    Data('None', '9'),
    Data('None', '10'),
    Data('Mild', '11'),
    Data('Mild', '12'),
    Data('Mild', '13'),
    Data('Moderate', '14'),
    Data('Moderate', '15'),
    Data('Moderate', '16'),
    Data('Severe', '17'),
    Data('Severe', '18'),
    Data('Severe', '19'),
    Data('Severe', '20'),
    Data('Unbearable', '21'),
    Data('Unbearable', '22'),
    Data('Unbearable', '23'),
    Data('None', '24'),
    Data('None', '25'),
    Data('None', '26'),
    Data('None', '27'),
    Data('None', '28'),
    Data('Unbearable', '29'),
    Data('Unbearable', '30'),
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
              // child: graph(),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: ListView.builder(
                        physics: ScrollPhysics(parent: ScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        itemCount: 5,
                        shrinkWrap: true,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 25.0, left: 5.0),
                            child: Text(
                              AppConfig.symptomLevels[index],
                              style: AppConfig.normalText,
                            ),
                          );
                        }),
                  ),
                  graph(),
                ],
              ),
            )),
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
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
        primaryXAxis: CategoryAxis(maximum: 30.0),
        primaryYAxis: CategoryAxis(),
        series: <ChartSeries>[
          // SplineAreaSeries<Data, String>(
          //     gradient: AppConfig.anxietyGradient,
          //     dataSource: data,
          //     xValueMapper: (Data sales, _) => sales.date,
          //     yValueMapper: (Data sales, _) => getYValue(sales.pain)),
          SplineAreaSeries<Data, String>(
              gradient: AppConfig.nauseaGradient,
              dataSource: data3,
              xValueMapper: (Data sales, _) => sales.date,
              yValueMapper: (Data sales, _) => getYValue(sales.pain)),
          // SplineAreaSeries<Data, String>(
          //     gradient: AppConfig.constipationGradient,
          //     dataSource: data1,
          //     xValueMapper: (Data sales, _) => sales.date,
          //     yValueMapper: (Data sales, _) => getYValue(sales.pain)),
        ]);
  }

  num getYValue(String pain) {
    int range = 0;
    switch (pain) {
      case 'None':
        range = 1;
        break;
      case 'Mild':
        range = 2;
        break;
      case 'Moderate':
        range = 3;
        break;
      case 'Severe':
        range = 4;
        break;
      case 'Unbearable':
        range = 5;
        break;
    }
    return range;
  }
}

class Data {
  final String pain;
  final String date;
  Data(this.pain, this.date);
}

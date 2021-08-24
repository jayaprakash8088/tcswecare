import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/pain_indicator_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/date_time_ui.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';

class SymptomTrackerPage extends StatefulWidget {
  SymptomTrackerPage({Key key}) : super(key: key);

  @override
  _SymptomTrackerPageState createState() {
    return _SymptomTrackerPageState();
  }
}

class _SymptomTrackerPageState extends StateMVC<SymptomTrackerPage> {
  _SymptomTrackerPageState() : super(PainIndicatorController()) {
    _controller = controller;
  }
  PainIndicatorController _controller;
  @override
  void initState() {
    super.initState();
    _controller.date1 = null;
    _controller.time1 = null;
    _controller.time = null;
    _controller.dateTime = null;
    _controller.selectedTime = null;
    _controller.selectedDate = null;
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
                top: FontSize.size50,
                right: FontSize.size20,
                child: getLanguageDropdown()),
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
      children: [
        Center(
          child: Text(
            ConstantStrings.symptomDiary,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColor.black,
                fontFamily: AppConfig.montserrat,
                fontSize: FontSize.size25,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: FontSize.size10),
          child: Center(
            child: Text(
              ConstantStrings.trackDiary,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColor.black,
                  fontFamily: AppConfig.montserrat,
                  fontSize: FontSize.size15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: FontSize.size100),
          child: Container(height: 100.0, child: DateTimeUI(context)),
        ),
        symptomsList()
      ],
    );
  }

  Widget getLanguageDropdown() {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          isDense: true,
          hint: getFlagAndCountryName(),
          value: AppConfig.selected,
          onChanged: (String newValue) {
            setState(() {
              AppConfig.selected = newValue;
            });
          },
          items: AppConfig.languageList.map((Map map) {
            return new DropdownMenuItem<String>(
              value: map["id"].toString(),
              // value: _mySelection,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    map["image"],
                    width: FontSize.size25,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: FontSize.size10),
                      child: Text(map["name"])),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget getFlagAndCountryName() {
    return Row(
      children: <Widget>[
        Image.asset(
          Assets.englishFlag,
          width: FontSize.size25,
        ),
        Container(
            margin: EdgeInsets.only(left: FontSize.size10),
            child: Text(
              ConstantStrings.english,
              style: TextStyle(color: AppColor.black),
            )),
      ],
    );
  }

  Widget symptomsList() {
    return Container(
      child: ListView.builder(
          physics: ScrollPhysics(parent: ScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemCount: AppConfig.symptomLevels.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Text(AppConfig.symptomLevels[index]);
          }),
    );
  }
}

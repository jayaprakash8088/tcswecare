import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/symptom_tracker_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';

class SymptomTrackerPage extends StatefulWidget {
  SymptomTrackerPage({Key key}) : super(key: key);

  @override
  _SymptomTrackerPageState createState() {
    return _SymptomTrackerPageState();
  }
}

class _SymptomTrackerPageState extends StateMVC<SymptomTrackerPage> {
  _SymptomTrackerPageState() : super(SymptomTrackerController()) {
    _controller = controller;
  }
  SymptomTrackerController _controller;
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
          child: Center(
            child: Text(
              ConstantStrings.symptoms,
              textAlign: TextAlign.center,
              style: AppConfig.blackText,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: FontSize.size20, bottom: FontSize.size20),
          child: dateAndTime(),
        ),
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

  Widget dateAndTime() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              callDatePicker();
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: FontSize.size5),
                  child: SvgPicture.asset(Assets.calendar),
                ),
                Text(
                  AppConfig.dateFormat.format(getDate()),
                  style: TextStyle(
                      color: AppColor.black,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSize.size16,
                      fontFamily: AppConfig.montserrat),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              callTimePicker();
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: FontSize.size5),
                  child: SvgPicture.asset(Assets.clock),
                ),
                Text(
                  AppConfig.timeFormat.format(getTime()),
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSize.size16,
                      decoration: TextDecoration.underline,
                      fontFamily: AppConfig.montserrat),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void callDatePicker() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: CupertinoDatePicker(
                initialDateTime: getDate(),
                maximumDate: DateTime(2050, 12, 31),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: _dateChanged),
          );
        });
  }

  void callTimePicker() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: CupertinoDatePicker(
                initialDateTime: getTime(),
                maximumDate: DateTime(2050, 12, 31),
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: _timeChanged),
          );
        });
  }

  void _dateChanged(DateTime value) {
    setState(() {
      _controller.dateTime = value;
    });
  }

  void _timeChanged(DateTime value) {
    setState(() {
      _controller.time = value;
    });
  }

  DateTime getDate() {
    var date;
    if (_controller.dateTime != null) {
      date = _controller.dateTime;
    } else {
      date = AppConfig.now;
    }
    return date;
  }

  DateTime getTime() {
    var time;
    if (_controller.time != null) {
      time = _controller.time;
    } else {
      time = AppConfig.now;
    }
    return time;
  }
}

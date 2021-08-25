import 'dart:ui';

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
import 'package:tcswecare/mvc/utils/slider_shape.dart';

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
          child:
              Container(height: FontSize.size100, child: DateTimeUI(context)),
        ),
        symptomsList(),
        diagnosisList(),
        moodList(),
        moodSlider(),
        commentsSection(),
        Padding(
          padding: EdgeInsets.only(top: FontSize.size20),
          child: AppConfig.submitBtn(),
        )
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
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
      child: Container(
        height: FontSize.size20,
        child: ListView.builder(
            physics: ScrollPhysics(parent: ScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: AppConfig.symptomLevels.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: FontSize.size8),
                child: Text(
                  AppConfig.symptomLevels[index],
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.size12,
                      fontFamily: AppConfig.montserrat),
                ),
              );
            }),
      ),
    );
  }

  Widget diagnosisList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: AppConfig.diagnosisList.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(FontSize.size0),
        physics: ScrollPhysics(parent: ScrollPhysics()),
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(top: FontSize.size20, left: FontSize.size20),
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: FontSize.size80,
                    child: Text(
                      AppConfig.diagnosisList[index],
                      textAlign: TextAlign.end,
                      softWrap: true,
                      style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: FontSize.size12,
                          fontFamily: AppConfig.montserrat),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: FontSize.size10),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            trackShape: GradientRectSliderTrackShape(
                                gradient: AppConfig.gradient,
                                darkenInactive: true),
                            overlayShape: RoundSliderOverlayShape(
                                overlayRadius: FontSize.size0),
                            trackHeight: FontSize.size10),
                        child: Slider(
                            activeColor: AppColor.white,
                            value: getValue(index),
                            min: FontSize.size0,
                            max: FontSize.size5,
                            onChanged: (values) {
                              _onChanged(values, index);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _onChanged(double selectedValue, int index) {
    setState(() {
      setValue(index, selectedValue);
    });
  }

  getValue(int index) {
    double value;
    switch (index) {
      case 0:
        value = _controller.anxietyValue;
        break;
      case 1:
        value = _controller.breathValue;
        break;
      case 2:
        value = _controller.drySkinValue;
        break;
      case 3:
        value = _controller.constipationValue;
        break;
      case 4:
        value = _controller.nauseaValue;
        break;
    }
    return value;
  }

  void setValue(int index, double selectedValue) {
    switch (index) {
      case 0:
        _controller.anxietyValue = selectedValue;
        print('0' + selectedValue.toString());
        break;
      case 1:
        _controller.breathValue = selectedValue;
        print('1' + selectedValue.toString());
        break;
      case 2:
        _controller.drySkinValue = selectedValue;
        print('2' + selectedValue.toString());
        break;
      case 3:
        _controller.constipationValue = selectedValue;
        print('3' + selectedValue.toString());
        break;
      case 4:
        _controller.nauseaValue = selectedValue;
        print('4' + selectedValue.toString());
        break;
      case 5:
        _controller.moodValue = selectedValue;
        print('5' + selectedValue.toString());
        break;
    }
  }

  Widget moodList() {
    return Padding(
      padding: EdgeInsets.only(
          top: FontSize.size20, left: MediaQuery.of(context).size.width * 0.2),
      child: Container(
        height: FontSize.size20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              ConstantStrings.positive,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                  fontSize: FontSize.size12,
                  fontFamily: AppConfig.montserrat),
            ),
            Text(
              ConstantStrings.neutral,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                  fontSize: FontSize.size12,
                  fontFamily: AppConfig.montserrat),
            ),
            Text(
              ConstantStrings.negative,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                  fontSize: FontSize.size12,
                  fontFamily: AppConfig.montserrat),
            ),
          ],
        ),
      ),
    );
  }

  Widget moodSlider() {
    return Padding(
      padding: EdgeInsets.only(top: FontSize.size20, left: FontSize.size20),
      child: Container(
        child: Row(
          children: [
            Container(
              width: FontSize.size80,
              child: Text(
                ConstantStrings.mood,
                textAlign: TextAlign.end,
                softWrap: true,
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.size12,
                    fontFamily: AppConfig.montserrat),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: FontSize.size10),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      trackShape: GradientRectSliderTrackShape(
                          gradient: AppConfig.gradient, darkenInactive: true),
                      overlayShape: RoundSliderOverlayShape(
                          overlayRadius: FontSize.size0),
                      trackHeight: FontSize.size10),
                  child: Slider(
                      activeColor: AppColor.white,
                      value: _controller.moodValue,
                      min: FontSize.size0,
                      max: FontSize.size3,
                      onChanged: (values) {
                        _onChanged(values, 5);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: FontSize.size10,
            left: FontSize.size30,
          ),
          child: Text(
            ConstantStrings.otherComments,
            textAlign: TextAlign.end,
            softWrap: true,
            style: TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                fontSize: FontSize.size14,
                fontFamily: AppConfig.montserrat),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: FontSize.size10,
              left: FontSize.size30,
              right: FontSize.size30,
              bottom: FontSize.size10),
          child: Container(
              height: FontSize.size40,
              decoration: BoxDecoration(
                color: AppColor.bgText,
                borderRadius:
                    BorderRadius.all(Radius.circular(FontSize.size10)),
              ),
              child: TextField(
                  controller: _controller.comments,
                  decoration: InputDecoration(
                    hintText: ConstantStrings.typeHere,
                    contentPadding: EdgeInsets.all(FontSize.size8),
                    hintStyle: TextStyle(
                        color: AppColor.hintText,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: FontSize.size14,
                        fontFamily: AppConfig.montserrat),
                    fillColor: AppColor.black,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(FontSize.size10)),
                    ),
                  ))),
        ),
      ],
    );
  }
}

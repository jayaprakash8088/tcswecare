import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tcswecare/mvc/controller/pain_indicator_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';

class PainIndicatorScreen extends StatefulWidget {
  PainIndicatorScreen({Key key}) : super(key: key);

  @override
  _PainIndicatorScreenState createState() {
    return _PainIndicatorScreenState();
  }
}

class _PainIndicatorScreenState extends StateMVC<PainIndicatorScreen> {
  _PainIndicatorScreenState() : super(PainIndicatorController()) {
    _controller = controller;
  }

  PainIndicatorController _controller;

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
                Assets.blueRectangle,
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

  Widget buildUI() {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(
                top: FontSize.size15,
                left: FontSize.size35,
                bottom: FontSize.size15),
            child: Image.asset(Assets.framePng),
          ),
        ),
        Center(
          child: Text(
            ConstantStrings.feeling,
            textAlign: TextAlign.center,
            style: AppConfig.centerText,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: FontSize.size10),
          child: Center(
            child: slider,
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                ConstantStrings.noPain,
                style: AppConfig.blackText,
              ),
              Text(
                ConstantStrings.tooPain,
                style: AppConfig.blackText,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: FontSize.size10),
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
        submitBtn()
      ],
    );
  }

  final slider = SleekCircularSlider(
    initialValue: FontSize.size0,
    appearance: CircularSliderAppearance(
        size: FontSize.size200,
        animationEnabled: true,
        customWidths: CustomSliderWidths(
            handlerSize: FontSize.size10,
            progressBarWidth: FontSize.size10,
            trackWidth: FontSize.size10),
        customColors: CustomSliderColors(
            dotColor: AppColor.white,
            trackColor: AppColor.grey,
            dynamicGradient: true,
            progressBarColors: [AppColor.bg1, AppColor.bg2])),
    min: FontSize.size0,
    max: FontSize.size4,
    innerWidget: (double value) {
      return Container();
    },
    onChangeEnd: (double endValue) {},
  );

  Widget dateAndTime() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              _controller.date1 = getDate();
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
              _controller.time1 = getTime();
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

  Widget submitBtn() {
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

  void callDatePicker() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              children: [
                okCancelUI(1),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: CupertinoDatePicker(
                      initialDateTime: getDate(),
                      maximumDate: DateTime(2050, 12, 31),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: _dateChanged),
                ),
              ],
            ),
          );
        });
  }

  void callTimePicker() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              children: [
                okCancelUI(2),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: CupertinoDatePicker(
                      initialDateTime: getTime(),
                      maximumDate: DateTime(2050, 12, 31),
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: _timeChanged),
                ),
              ],
            ),
          );
        });
  }

  void _dateChanged(DateTime value) {
    _controller.selectedDate = value;
  }

  void _timeChanged(DateTime value) {
    _controller.selectedTime = value;
  }

  void changeDate() {
    setState(() {
      _controller.dateTime = _controller.selectedDate;
    });
  }

  void changeTime() {
    setState(() {
      _controller.time = _controller.selectedTime;
    });
    Navigator.pop(context);
  }

  cancelClicked() {
    setState(() {
      _controller.time = _controller.time1;
      _controller.dateTime = _controller.date1;
    });
    Navigator.pop(context);
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

  okCancelUI(int i) {
    return Container(
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  cancelClicked();
                },
                child: Text(
                  ConstantStrings.cancel,
                  style: AppConfig.blackText,
                )),
            GestureDetector(
                onTap: () {
                  if (i == 1) {
                    changeDate();
                  } else {
                    changeTime();
                  }
                },
                child: Text(
                  ConstantStrings.ok,
                  style: AppConfig.blackText,
                )),
          ],
        ),
      ),
    );
  }
}

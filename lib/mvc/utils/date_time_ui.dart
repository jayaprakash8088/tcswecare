import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/pain_indicator_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';

class DateTimeUI extends StatefulWidget {
  DateTimeUI(this.context) : super();
  BuildContext context;
  @override
  _DateTimeUIState createState() {
    return _DateTimeUIState();
  }
}

class _DateTimeUIState extends StateMVC<DateTimeUI> {
  _DateTimeUIState() : super(PainIndicatorController()) {
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
      body: Column(
        children: [
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
        ],
      ),
    );
  }

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
    Navigator.pop(widget.context);
  }

  void changeTime() {
    setState(() {
      _controller.time = _controller.selectedTime;
    });
    Navigator.pop(widget.context);
  }

  cancelClicked() {
    setState(() {
      _controller.time = _controller.time1;
      _controller.dateTime = _controller.date1;
    });
    Navigator.pop(widget.context);
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
                child: Container(
                  height: FontSize.size50,
                  width: FontSize.size100,
                  child: Center(
                    child: Text(
                      ConstantStrings.cancel,
                      style: AppConfig.blackText,
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  if (i == 1) {
                    changeDate();
                  } else {
                    changeTime();
                  }
                },
                child: Container(
                  height: FontSize.size50,
                  width: FontSize.size100,
                  child: Center(
                    child: Text(
                      ConstantStrings.ok,
                      style: AppConfig.blackText,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

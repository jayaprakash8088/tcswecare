// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/pain_indicator_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
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
      backgroundColor: AppColor.transparent,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: FontSize.size10),
            child: Center(
              child: Text(
                'symptoms'.tr(),
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
              _controller.date1 = _controller.getDate();
              callDatePicker();
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: FontSize.size5),
                  child: SvgPicture.asset(Assets.calendar),
                ),
                Text(
                  AppConfig.dateFormat.format(_controller.getDate()),
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
              _controller.time1 = _controller.getTime();
              callTimePicker();
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: FontSize.size5),
                  child: SvgPicture.asset(Assets.clock),
                ),
                Text(
                  AppConfig.timeFormat.format(_controller.getTime()),
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


   callDatePicker()async {
     final time=AppConfig.now;
 var date= await showDatePicker(initialDate:time,
 firstDate:DateTime(2020),lastDate: DateTime(2050),context: context);
 _dateChanged(date);
  }

   callTimePicker() async{
    final time=TimeOfDay.now();
  TimeOfDay selectedTime=await
  showTimePicker(context: context, initialTime:time,
  cancelText: cancelClicked()
     );
  var t=DateTime(AppConfig.now.year,AppConfig.now.month,AppConfig.now.day,selectedTime.hour,selectedTime.minute);
  _timeChanged(t);
  }

   _dateChanged(DateTime value) {
    _controller.selectedDate = value;
    changeDate();
  }

  void _timeChanged(DateTime value) {
    _controller.selectedTime = value;
  changeTime();
  }

  void changeDate() {
    setState(() {
      _controller.dateTime = _controller.selectedDate;
    });
    // Navigator.pop(widget.context);
  }

  void changeTime() {
    setState(() {
      _controller.time = _controller.selectedTime;
    });
    // Navigator.pop(widget.context);
  }

  cancelClicked() {
    setState(() {
      _controller.time = _controller.time1;
      _controller.dateTime = _controller.date1;
    });
  }

}

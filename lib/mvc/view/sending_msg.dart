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
import 'package:tcswecare/mvc/utils/locale_drop_down.dart';
import 'package:tcswecare/mvc/view/message_received.dart';

class TransmittingMessage extends StatefulWidget {
  TransmittingMessage({Key key}) : super(key: key);

  @override
  _TransmittingMessageState createState() {
    return _TransmittingMessageState();
  }
}

class _TransmittingMessageState extends StateMVC<TransmittingMessage> {
  PainIndicatorController _painIndicatorController;
  _TransmittingMessageState() : super(PainIndicatorController()) {
    _painIndicatorController = controller;
  }
  @override
  void initState() {
    super.initState();
    _move();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgBlue,
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                height: FontSize.size100,
                width: FontSize.size140,
                child: LocaleDropDown()),
          ),
          buildUI(),
        ],
      ),
    );
  }

  Widget buildUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          ConstantStrings.msgTransmitted,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: FontSize.size25,
              fontWeight: FontWeight.w600,
              fontFamily: AppConfig.montserrat,
              fontStyle: AppConfig.normal,
              color: AppColor.black),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: FontSize.size40, bottom: FontSize.size70),
          child: SvgPicture.asset(Assets.frameWorld),
        ),
        SvgPicture.asset(
          getImage(i),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: FontSize.size15,
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  ConstantStrings.collectingInfo,
                  textAlign: TextAlign.center,
                  style: AppConfig.normalText,
                ),
                Text(
                  ConstantStrings.sendingMsg,
                  textAlign: TextAlign.center,
                  style: AppConfig.normalText,
                ),
                Text(
                  ConstantStrings.msgSent,
                  textAlign: TextAlign.center,
                  style: getStyle(i),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  TextStyle getStyle(int i) {
    TextStyle style;
    if (i == 1) {
      style = AppConfig.normalText;
    } else {
      style = TextStyle(
          fontSize: FontSize.size12,
          fontWeight: FontWeight.w500,
          fontFamily: AppConfig.montserrat,
          fontStyle: AppConfig.normal,
          color: AppColor.hintText);
    }
    return style;
  }

  String getImage(int i) {
    if (i == 1) {
      return Assets.loadingCompleted;
    } else
      return Assets.loading;
  }

  void _move() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        i = 1;
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MessageReceived()),
          (route) => false);
    });
  }
}

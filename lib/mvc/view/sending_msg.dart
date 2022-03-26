import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/pain_indicator_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/utils/locale_drop_down.dart';
import 'package:tcswecare/mvc/view/home_page.dart';

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
          Padding(
            padding: EdgeInsets.only(top: FontSize.size20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                  height: FontSize.size100,
                  width: FontSize.size160,
                  child: LocaleDropDown()),
            ),
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
          'msgTransmitted'.tr(),
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
          child: Image.asset(Assets.image1),
        ),
        SvgPicture.asset(
          _painIndicatorController.getImage(i),
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
                  'collectingInfo'.tr(),
                  textAlign: TextAlign.center,
                  style: AppConfig.normalText,
                ),
                Text(
                  'sendingMsg'.tr(),
                  textAlign: TextAlign.center,
                  style: AppConfig.normalText,
                ),
                Text(
                  'msgSent'.tr(),
                  textAlign: TextAlign.center,
                  style: _painIndicatorController.getStyle(i),
                )
              ],
            ),
          ),
        ),
        homeBtn()
      ],
    );
  }

  void _move() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        i = 1;
      });
    });
  }

  Widget homeBtn() {
    return Center(
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
    );
  }
}

import 'dart:ui';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/pain_indicator_controller.dart';
import 'package:tcswecare/mvc/model/pain_record_model.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/date_time_ui.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/utils/locale_drop_down.dart';
import 'package:tcswecare/mvc/utils/slider_shape.dart';
import 'package:tcswecare/mvc/view/sending_msg.dart';

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
    setValueNull();
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
            'symptomDiary'.tr(),
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
              'trackDiary'.tr(),
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
        numberList(),
        diagnosisList(),
        moodList(),
        moodSlider(),
        commentsSection(),
        Padding(
          padding: EdgeInsets.only(top: FontSize.size20),
          child: GestureDetector(
              onTap: () async {
                // AppConfig.pleaseWait(context);
                // PainRecordModelResponse response =
                //     await _controller.submitSymptoms(context);
                // if (response != null && response.statusCode == 200) {
                //   Navigator.pop(context);
                //   Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => TransmittingMessage()),
                //       (route) => false);
                // } else {
                //   Navigator.pop(context);
                //   AppConfig.showToast(context, ConstantStrings.somethingWrong);
                // }
              },
              child: AppConfig.submitBtn()),
        )
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
            itemCount:
            AppConfig.selected=='0'?AppConfig.symptomLevels.length:
            AppConfig.symptomLevelsMalay.length,
            itemExtent: 70,
            itemBuilder: (context, index) {
              return Text(
                AppConfig.selected=='0'?AppConfig.symptomLevels[index]:
                AppConfig.symptomLevelsMalay[index],
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.size12,
                    fontFamily: AppConfig.montserrat),
              );
            }),
      ),
    );
  }

  Widget diagnosisList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: AppConfig.selected=='0'?AppConfig.diagnosisList.length:
        AppConfig.diagnosisListMalay.length,
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
                      AppConfig.selected=='0'?AppConfig.diagnosisList[index]:
                      AppConfig.diagnosisListMalay[index],
                      textAlign: TextAlign.end,
                      softWrap: true,
                      style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: FontSize.size10,
                          fontFamily: AppConfig.montserrat),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: FontSize.size10),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            trackShape: GradientRectSliderTrackShape(
                                gradient: AppConfig.sliderGradient,
                                darkenInactive: true),
                            overlayShape: RoundSliderOverlayShape(
                                overlayRadius: FontSize.size0),
                            trackHeight: FontSize.size10),
                        child: Slider(
                            activeColor: AppColor.white,
                          thumbColor: AppColor.white,
                            value: getValue(index),
                            min: FontSize.size0,
                            max: FontSize.size10,
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
        value = AppConfig.discomfortValue;
        break;
      case 1:
        value = AppConfig.anxietyValue;
        break;
      case 2:
        value = AppConfig.constipationValue;
        break;
      case 3:
        value = AppConfig.coughValue;
        break;
      case 4:
        value = AppConfig.diarrheaValue;
        break;
      case 5:
        value = AppConfig.fatigueValue;
        break;
      case 6:
        value = AppConfig.drySkinValue;
        break;
      case 7:
        value = AppConfig.appetiteValue;
        break;
      case 8:
        value = AppConfig.nauseaValue;
        break;
      case 9:
        value = AppConfig.breathValue;
        break;
      case 10:
        value = AppConfig.moodValue;
        break;
    }
    return value;
  }

  void setValue(int index, double selectedValue) {
    switch (index) {
      case 0:
        AppConfig.discomfortValue = selectedValue;
        break;
      case 1:
        AppConfig.anxietyValue = selectedValue;
        break;
      case 2:
        AppConfig.constipationValue = selectedValue;
        break;
      case 3:
        AppConfig.coughValue = selectedValue;
        break;
      case 4:
        AppConfig.diarrheaValue = selectedValue;
        break;
      case 5:
        AppConfig.fatigueValue = selectedValue;
        break;
      case 6:
        AppConfig.drySkinValue = selectedValue;
        break;
      case 7:
        AppConfig.appetiteValue = selectedValue;
        break;
      case 8:
        AppConfig.nauseaValue = selectedValue;
        break;
      case 9:
        AppConfig.breathValue = selectedValue;
        break;
      case 10:
        AppConfig.moodValue = selectedValue;
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
              'positive'.tr(),
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                  fontSize: FontSize.size12,
                  fontFamily: AppConfig.montserrat),
            ),
            Text(
              'neutral'.tr(),
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                  fontSize: FontSize.size12,
                  fontFamily: AppConfig.montserrat),
            ),
            Text(
              'negative'.tr(),
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
                'mood'.tr(),
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
                          gradient: AppConfig.sliderGradient, darkenInactive: true),
                      overlayShape: RoundSliderOverlayShape(
                          overlayRadius: FontSize.size0),
                      trackHeight: FontSize.size10),
                  child: Slider(
                      activeColor: AppColor.white,
                      value: AppConfig.moodValue,
                      min: FontSize.size0,
                      max: FontSize.size3,
                      onChanged: (values) {
                        _onChanged(values, 10);
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
            'otherComments'.tr(),
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
                    hintText: 'typeHere'.tr(),
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

  void setValueNull() {
    AppConfig.anxietyValue=0;
     AppConfig.breathValue=0;
     AppConfig.drySkinValue=0;
   AppConfig.constipationValue=0;
     AppConfig.nauseaValue=0;
  }

  numberList() {
    return Padding(
      padding: EdgeInsets.only(left: 100),
      child: Container(
        height: FontSize.size20,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 11,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(left:8.0,right:8.0),
                child: Text(index.toString(),style:TextStyle(   fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: FontSize.size14,
                    fontFamily: AppConfig.montserrat) ,),
              );
            }),
      ),
    );
  }
}

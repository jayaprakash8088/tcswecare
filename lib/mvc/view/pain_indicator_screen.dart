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
    AppConfig.spinnerValue=0.0;
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
            'feeling'.tr(),
            textAlign: TextAlign.center,
            style: AppConfig.text,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Container(height: FontSize.size80, child: imageList()),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: FontSize.size10, bottom: FontSize.size10),
          child: Center(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  trackShape: GradientRectSliderTrackShape(
                      gradient: AppConfig.gradient, darkenInactive: true),
                  overlayShape:
                      RoundSliderOverlayShape(overlayRadius: FontSize.size0),
                  trackHeight: FontSize.size10),
              child: Slider(
                  activeColor: AppColor.white,
                  value: AppConfig.spinnerValue,
                  min: FontSize.size0,
                  max: FontSize.size10,
                  onChanged: (values) {
                    setState(() {
                      _controller.onChanges(values);
                    });
                  }),
            ),
          ),
        ),
        Container(height: FontSize.size30, child: rangeList()),
        Padding(
          padding:
              EdgeInsets.only(top: FontSize.size10, bottom: FontSize.size20),
          child:
              Container(height: FontSize.size100, child: DateTimeUI(context)),
        ),
        GestureDetector(
            onTap: () async {
              AppConfig.pleaseWait(context);
              PainRecordModelResponse response =
                  await _controller.submit(context);
              if (response != null && response.statusCode == 200) {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TransmittingMessage()),
                    (route) => false);
              } else {
                Navigator.pop(context);
                AppConfig.showToast(context, ConstantStrings.somethingWrong);
              }
            },
            child: AppConfig.submitBtn())
      ],
    );
  }

  Widget rangeList() {
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: AppConfig.rangeList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              AppConfig.rangeList[index],
              textAlign: TextAlign.center,
              style: AppConfig.text,
            ),
          );
        });
  }

  Widget imageList() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  bottom: 10.0,
                ),
                child: SvgPicture.asset(
                  loadImages(index),
                  width: FontSize.size35,
                  height: FontSize.size35,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: hurtRange(index),
              ),
            ],
          );
        });
  }

  String loadImages(int index) {
    var image;
    switch (index) {
      case 0:
        if (AppConfig.spinnerValue <= 2) {
          image = Assets.range0Selected;
        } else {
          image = Assets.range0;
        }
        break;
      case 1:
        if (AppConfig.spinnerValue > 2 && AppConfig.spinnerValue <= 4) {
          image = Assets.range1Selected;
        } else {
          image = Assets.range1;
        }
        break;
      case 2:
        if (AppConfig.spinnerValue <= 6 && AppConfig.spinnerValue > 4) {
          image = Assets.range2Selected;
        } else {
          image = Assets.range2;
        }
        break;
      case 3:
        if (AppConfig.spinnerValue <= 7.5 && AppConfig.spinnerValue > 6) {
          image = Assets.range3Selected;
        } else {
          image = Assets.range3;
        }
        break;
      case 4:
        if (AppConfig.spinnerValue <= 9 && AppConfig.spinnerValue > 7.5) {
          image = Assets.range4Selected;
        } else {
          image = Assets.range4;
        }
        break;
      case 5:
        if (AppConfig.spinnerValue <= 10 && AppConfig.spinnerValue > 9) {
          image = Assets.range5Selected;
        } else {
          image = Assets.range5;
        }
        break;
    }
    return image;
  }

  Widget hurtRange(int index) {
    return Text(AppConfig.selected=='0'?
      AppConfig.hurtList[index]:AppConfig.hurtListMalay[index],
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: FontSize.size8,
          fontWeight: FontWeight.w600,
          fontFamily: AppConfig.montserrat,
          fontStyle: AppConfig.normal,
          color: AppColor.black),
    );
  }
}

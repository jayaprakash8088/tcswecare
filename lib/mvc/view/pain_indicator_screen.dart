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
import 'package:tcswecare/mvc/utils/date_time_ui.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/utils/locale_drop_down.dart';
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
                top: FontSize.size10,
                right: FontSize.size20,
                child: Container(
                    height: FontSize.size100,
                    width: FontSize.size140,
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
          padding:
              EdgeInsets.only(top: FontSize.size20, bottom: FontSize.size20),
          child:
              Container(height: FontSize.size100, child: DateTimeUI(context)),
        ),
        GestureDetector(
            onTap: () async {
              var response = await _controller.submit(context);
              if (response != null && response.StatusCode == 200) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TransmittingMessage()),
                    (route) => false);
              }
            },
            child: AppConfig.submitBtn())
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
            trackColor: AppColor.unSelectedColor,
            dynamicGradient: true,
            progressBarColors: [AppColor.bg1, AppColor.bg2])),
    min: FontSize.size0,
    max: FontSize.size4,
    innerWidget: (double value) {
      return Container();
    },
    onChangeEnd: (double endValue) {},
  );
}

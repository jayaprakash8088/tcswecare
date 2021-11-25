import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/pain_indicator_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/utils/locale_drop_down.dart';
import 'package:tcswecare/mvc/view/contact_doctor.dart';
import 'package:tcswecare/mvc/view/home_page.dart';

class MessageReceived extends StatefulWidget {
  MessageReceived({Key key}) : super(key: key);

  @override
  _MessageReceivedState createState() {
    return _MessageReceivedState();
  }
}

class _MessageReceivedState extends StateMVC<MessageReceived> {
  PainIndicatorController _painIndicatorController;
  _MessageReceivedState() : super(PainIndicatorController()) {
    _painIndicatorController = controller;
  }

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
        physics: ScrollPhysics(),
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
            ConstantStrings.painPersists,
            textAlign: TextAlign.center,
            style: AppConfig.blackText,
          ),
        ),
        Center(child: cardsUI()),
        Center(
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
                      ConstantStrings.home,
                      style: AppConfig.robotoText,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget cardsUI() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: FontSize.size14),
      child: StaggeredGridView.countBuilder(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(parent: ScrollPhysics()),
          shrinkWrap: true,
          itemCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  moveToNextPage(index);
                },
                child: Padding(
                  padding: EdgeInsets.all(FontSize.size8),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: index == 0
                            ? AppConfig.gradient
                            : AppConfig.blueGradient,
                        borderRadius:
                            BorderRadius.all(Radius.circular(FontSize.size20))),
                    height: FontSize.size102,
                    width: FontSize.size102,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: FontSize.size15, left: FontSize.size15),
                          child: Text(
                            _painIndicatorController.getCardsText(index),
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: FontSize.size18,
                                fontFamily: AppConfig.montserrat,
                                fontStyle: AppConfig.normal,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: FontSize.size20,
                                bottom: FontSize.size20),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(_painIndicatorController
                                    .getCardsImages(index))),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(1, 1);
          }),
    );
  }

  void moveToNextPage(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        contactDoctor();
        break;
      case 2:
        break;
    }
  }

  void contactDoctor() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ContactDoctor()));
  }
}

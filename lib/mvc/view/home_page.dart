import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/home_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/utils/locale_drop_down.dart';
import 'package:tcswecare/mvc/view/contact_doctor.dart';
import 'package:tcswecare/mvc/view/history_screen.dart';
import 'package:tcswecare/mvc/view/pain_indicator_screen.dart';
import 'package:tcswecare/mvc/view/tracker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends StateMVC<HomePage> {
  _HomePageState() : super(HomePageController()) {
    _controller = controller;
  }

  HomePageController _controller;

  @override
  void initState() {
    super.initState();
    // visible both status bar and bottom nav buttons
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: AppColor.bgWhite,
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset(
            Assets.smallRectangle,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        Scaffold(
          backgroundColor: AppColor.transparent,
          appBar: getAppBar(),
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(parent: ScrollPhysics()),
              child: buildUI()),
        ),
      ],
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: AppColor.transparent,
      elevation: FontSize.size0,
      actions: [
        Padding(
          padding: EdgeInsets.only(top: FontSize.size20),
          child: Container(
              width: FontSize.size160, child: Center(child: LocaleDropDown())),
        )
      ],
      centerTitle: false,
      title: SvgPicture.asset(
        Assets.logo,
        height: FontSize.size22,
        width: FontSize.size120,
      ),
    );
  }

  Widget buildUI() {
    return Padding(
      padding: EdgeInsets.only(top: FontSize.size35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'gm'.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: FontSize.size25,
                color: AppColor.black,
                fontFamily: AppConfig.montserrat,
                fontStyle: AppConfig.normal,
                fontWeight: FontWeight.w600),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: FontSize.size15,
                  left: FontSize.size35,
                  bottom: FontSize.size15),
              child: Image.asset(Assets.framePng),
            ),
          ),
          Text(
            'homePageText'.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: FontSize.size15,
                fontWeight: FontWeight.w500,
                fontStyle: AppConfig.normal,
                fontFamily: AppConfig.montserrat,
                color: AppColor.black),
          ),
          Padding(
            padding: EdgeInsets.only(top: FontSize.size20),
            child: cardsUI(),
          )
        ],
      ),
    );
  }

  Widget cardsUI() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: FontSize.size14),
      child: StaggeredGridView.countBuilder(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(parent: ScrollPhysics()),
          shrinkWrap: true,
          itemCount: 4,
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
                        borderRadius:
                            BorderRadius.all(Radius.circular(FontSize.size20)),
                        color: _controller.getColor(index)),
                    height: FontSize.size102,
                    width: FontSize.size102,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: FontSize.size15, left: FontSize.size15),
                          child: Text(
                            _controller.getCardsText(index),
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
                                child: SvgPicture.asset(
                                    _controller.getCardsImages(index))),
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
        history();
        break;
      case 1:
        recordSymptom();
        break;
      case 2:
        recordPain();
        break;
      case 3:
        contactDoctor();
        break;
    }
  }

  void contactDoctor() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ContactDoctor()));
  }

  void recordPain() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PainIndicatorScreen()));
  }

  void recordSymptom() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SymptomTrackerPage()));
  }

  void history() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HistoryScreen()));
  }
}

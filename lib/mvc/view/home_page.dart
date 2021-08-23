import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/home_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/view/contact_doctor.dart';

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
          drawer: Drawer(),
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
      actions: [getLanguageDropdown()],
      leading: Image.asset(Assets.hamburgerIcon),
      centerTitle: false,
      leadingWidth: FontSize.size30,
      title: SvgPicture.asset(
        Assets.logo,
        height: FontSize.size22,
        width: FontSize.size120,
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
    return Padding(
      padding: EdgeInsets.only(top: FontSize.size35),
      child: Column(
        children: [
          Center(
            child: Text(
              'Good Morning !',
              style: TextStyle(
                  fontSize: FontSize.size25,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600),
            ),
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
            ConstantStrings.homePageText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: FontSize.size15,
                fontWeight: FontWeight.w500,
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
                        color: getColor(index)),
                    height: FontSize.size102,
                    width: FontSize.size102,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: FontSize.size15, left: FontSize.size15),
                          child: Text(
                            getCardsText(index),
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: FontSize.size18,
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
                                child: SvgPicture.asset(getCardsImages(index))),
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

  Color getColor(int index) {
    Color cardColor;
    switch (index) {
      case 0:
        cardColor = AppColor.thickGrayCard;
        break;
      case 1:
        cardColor = AppColor.blueCard;
        break;
      case 2:
        cardColor = AppColor.greenCard;
        break;
      case 3:
        cardColor = AppColor.grayCard;
        break;
    }
    return cardColor;
  }

  String getCardsText(int index) {
    String text = '';
    switch (index) {
      case 0:
        text = ConstantStrings.card1Text;
        break;
      case 1:
        text = ConstantStrings.card2Text;
        break;
      case 2:
        text = ConstantStrings.card3Text;
        break;
      case 3:
        text = ConstantStrings.card4Text;
        break;
    }
    return text;
  }

  String getCardsImages(int index) {
    String image;
    switch (index) {
      case 0:
        image = Assets.graph;
        break;
      case 1:
        image = Assets.notes;
        break;
      case 2:
        image = Assets.manFace;
        break;
      case 3:
        image = Assets.contactDoctor;
        break;
    }
    return image;
  }

  void moveToNextPage(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
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
}

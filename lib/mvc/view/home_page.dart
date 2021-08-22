import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends StateMVC<HomePage> {
  List<Map> languageList = [
    {"id": 0, 'image': Assets.englishFlag, 'name': ConstantStrings.english},
    {'id': 1, 'image': Assets.malayFlag, 'name': ConstantStrings.malay}
  ];
  String selected;
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
      elevation: 0.0,
      actions: [getLanguageDropdown()],
      title: SvgPicture.asset(
        Assets.logo,
        height: 22.0,
        width: 120.0,
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
          value: selected,
          onChanged: (String newValue) {
            setState(() {
              selected = newValue;
            });
          },
          items: languageList.map((Map map) {
            return new DropdownMenuItem<String>(
              value: map["id"].toString(),
              // value: _mySelection,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    map["image"],
                    width: 25,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
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
          width: 25,
        ),
        Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              ConstantStrings.english,
              style: TextStyle(color: AppColor.black),
            )),
      ],
    );
  }

  Widget buildUI() {
    return Padding(
      padding: EdgeInsets.only(top: 35.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'Good Morning !',
              style: TextStyle(
                  fontSize: 25.0,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 35.0, bottom: 15.0),
              child: SvgPicture.asset(Assets.frame),
            ),
          ),
          Text(
            ConstantStrings.homePageText,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: AppColor.black),
          ),
          cardsUI()
        ],
      ),
    );
  }

  Widget cardsUI() {
    return GridView.builder(
        itemCount: 4,
        physics: ScrollPhysics(parent: ScrollPhysics()),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width / 180),
        itemBuilder: (context, index) {
          return Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: getColor(index)),
            child: Column(
              children: [
                Text(
                  getCardsText(index),
                  style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0),
                ),
              ],
            ),
          );
        });
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
}

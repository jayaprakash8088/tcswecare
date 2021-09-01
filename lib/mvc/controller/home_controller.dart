import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';

class HomePageController extends ControllerMVC {
  factory HomePageController() {
    return _this ??= HomePageController._();
  }
  static HomePageController _this;
  HomePageController._();
  static HomePageController get con => _this;

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
}

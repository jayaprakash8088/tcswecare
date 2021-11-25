import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';

class LocaleDropDown extends StatefulWidget {
  LocaleDropDown({Key key}) : super(key: key);

  @override
  _LocaleDropDownState createState() {
    return _LocaleDropDownState();
  }
}

class _LocaleDropDownState extends State<LocaleDropDown> {
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
      backgroundColor: AppColor.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [getLanguageDropdown(),
        logout()],
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
              if (newValue == '0') {
                context.setLocale(Locale('en', 'US'));
              } else {
                context.setLocale(Locale('ms', 'MYS'));
              }
            });
          },
          items: AppConfig.languageList.map((Map map) {
            return new DropdownMenuItem<String>(
              value: map["id"].toString(),
              child: Row(
                children: <Widget>[
                  // Image.asset(
                  //   map["image"],
                  //   width: FontSize.size25,
                  // ),
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

  Widget logout() {
    return GestureDetector(
      onTap: (){
        _logOutPopUp();
      },
      child: SvgPicture.asset(
        Assets.logOut,
      ),
    );
  }

  void _logOutPopUp() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content:Container(
              height: 170.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(ConstantStrings.logOutText,
                  style: TextStyle(fontSize: FontSize.size15,
                  color: AppColor.black,fontFamily:AppConfig.montserrat),),
                  Divider(
                    height: FontSize.size2,color: AppColor.grey,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(ConstantStrings.cancel,
                            style: TextStyle(fontSize: FontSize.size15,
                                color: AppColor.black,fontFamily:AppConfig.montserrat),),
                        ),
                        Container(color: AppColor.grey,width: 2,),
                        Center(
                          child: Text(ConstantStrings.logOut,
                            style: TextStyle(fontSize: FontSize.size15,
                                color: AppColor.black,fontFamily:AppConfig.montserrat),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

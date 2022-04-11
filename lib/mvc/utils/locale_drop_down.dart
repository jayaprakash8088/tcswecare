import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcswecare/mvc/api_utils/repository.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/app_shared_preferences.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/view/initial_page.dart';

class LocaleDropDown extends StatefulWidget {
  LocaleDropDown({Key key}) : super(key: key);

  @override
  _LocaleDropDownState createState() {
    return _LocaleDropDownState();
  }
}

class _LocaleDropDownState extends State<LocaleDropDown> {
  Repository repository=Repository();
  AppSharedPreferences _sharedPreferences=AppSharedPreferences();
  @override
  void initState() {
  setValue();
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
          onChanged: (String newValue) async{
            setState(() {
              AppConfig.selected = newValue;
              if (newValue == '0') {
                context.setLocale(Locale('en', 'US'));
                _sharedPreferences.setLanguage('0');
              } else {
                context.setLocale(Locale('ms', 'MYS'));
                _sharedPreferences.setLanguage('1');
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
              height: FontSize.size100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: FontSize.size10,
                    bottom: FontSize.size30),
                    child: Text('logOutText'.tr(),
                    style: TextStyle(fontSize: FontSize.size15,
                    color: AppColor.black,fontFamily:AppConfig.montserrat),),
                  ),
                  Divider(
                    height: FontSize.size2,color: AppColor.grey,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:FontSize.size10),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text( 'cancel'.tr(),
                                style: TextStyle(fontSize: FontSize.size15,
                                    color: AppColor.black,fontFamily:AppConfig.montserrat),),
                            ),
                          ),
                          Container(color: AppColor.grey,width:1,
                          height: 20.0,),
                          GestureDetector(
                            onTap: ()async{
                              String token=await _sharedPreferences.getToken();
                            var response=await repository.logOutApi(context,token);
                            if(response){
                             await _sharedPreferences.clearAll();
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder:(context)=> InitialPage()), (route) => false);
                            }else{
                              Navigator.pop(context);
                              AppConfig.showToast(context, ConstantStrings.somethingWrong);
                            }
                            },
                            child: Center(
                              child: Text('logOut'.tr(),
                                style: TextStyle(fontSize: FontSize.size15,
                                    color: AppColor.black,fontFamily:AppConfig.montserrat),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future setValue()async {
    String value=await _sharedPreferences.getLang();
    AppConfig.selected=value??'0';
  }

}

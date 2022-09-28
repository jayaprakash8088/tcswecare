// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/utils/locale_drop_down.dart';
import 'package:tcswecare/mvc/view/home_page.dart';

class ContactDoctor extends StatefulWidget {
  ContactDoctor({Key key}) : super(key: key);

  @override
  _ContactDoctorState createState() {
    return _ContactDoctorState();
  }
}

class _ContactDoctorState extends State<ContactDoctor> {
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Text(
          'card4Text'.tr(),
          textAlign: TextAlign.center,
          style: AppConfig.blackText,
        ),
       contactDoctorList(1),
       contactDoctorList(2),
       contactDoctorList(3),
        SizedBox(height: FontSize.size20,),
        GestureDetector(
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
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Center(
                  child: Text(
                    'home'.tr(),
                    style: AppConfig.robotoText,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  contactDoctorList(int pos) {
    return Padding(
      padding:  EdgeInsets.only(left:FontSize.size10,
      right: FontSize.size10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: FontSize.size5,),
          Text(pos==1?'mainContact'.tr():pos==2?'backupContact1'.tr():'backupContact2'.tr(),
            textAlign: TextAlign.start,
            style: AppConfig.blackText,),
          SizedBox(height: FontSize.size5,),
          contact(pos)
        ],
      ),
    );
  }
 contact(int  pos){
    return  GestureDetector(
      onTap: () {
        AppConfig.urlLauncher('+60 123456789');
      },
      child: Container(
        height: FontSize.size75,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.all(Radius.circular(FontSize.size15)),
            color: pos==1?AppColor.red:
            pos==2?AppColor.yellow:AppColor.lightBlue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '+601234567',
              style: TextStyle(
                  color: AppColor.white,
                  fontFamily: AppConfig.montserrat,
                  fontStyle: AppConfig.normal,
                  fontSize: FontSize.size24,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: FontSize.size20),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(Assets.contactDoctor)),
            )
          ],
        ),
      ),
    );
 }
}

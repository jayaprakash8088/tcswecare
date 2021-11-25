import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
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
            ConstantStrings.contactDoctorText,
            textAlign: TextAlign.center,
            style: AppConfig.blackText,
          ),
        ),
        Center(child: cardsUI()),
        Center(
          child: Text(
            'Contact Your Doctor',
            style: AppConfig.blackText,
          ),
        ),
        GestureDetector(
          onTap: () {
            AppConfig.urlLauncher('+60 123456789');
          },
          child: Padding(
            padding: EdgeInsets.only(
                left: FontSize.size30,
                right: FontSize.size30,
                top: FontSize.size10),
            child: Container(
              height: FontSize.size75,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(FontSize.size15)),
                  color: AppColor.lightBlue),
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
          ),
        ),
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
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(FontSize.size8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(FontSize.size20)),
                      color: AppColor.purple),
                  height: FontSize.size150,
                  width: FontSize.size150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: FontSize.size15, left: FontSize.size15),
                        child: Text(
                          ConstantStrings.takeExtraDose,
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: FontSize.size18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: SvgPicture.asset(Assets.medicine)),
                      )
                    ],
                  ),
                ),
              )),
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(FontSize.size8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(FontSize.size20)),
                      color: AppColor.lightGreen),
                  height: FontSize.size150,
                  width: FontSize.size150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: FontSize.size15, left: FontSize.size15),
                        child: Text(
                          ConstantStrings.restWell,
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: FontSize.size18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: FontSize.size20, bottom: FontSize.size20),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(Assets.sleep)),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

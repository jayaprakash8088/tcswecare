import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/view/login_screen.dart';
import 'package:tcswecare/mvc/view/sign_up_screen.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key key}) : super(key: key);

  @override
  _InitialPageState createState() {
    return _InitialPageState();
  }
}

class _InitialPageState extends State<InitialPage> {
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
    return Material(
      child: Stack(
        children: [
          Container(
            color: AppColor.white,
            height: MediaQuery.of(context).size.height,
            child: Image(
              image: AssetImage(Assets.bigRectanglePng),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: SvgPicture.asset(Assets.logo)),
                Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Center(child: SvgPicture.asset(Assets.astronaut)),
                ),
                GestureDetector(
                  onTap: () {
                    moveToSignUp();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 180.0),
                    child: Center(
                      child: Container(
                        height: 40.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                          gradient: AppConfig.gradient,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Center(
                          child: Text(
                            ConstantStrings.singUp,
                            style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    moveToLogin();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: FontSize.size20),
                    child: Center(
                      child: Container(
                        height: FontSize.size40,
                        width: FontSize.size160,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.bg1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(FontSize.size20))),
                        child: Center(
                          child: Text(
                            ConstantStrings.login,
                            style: TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                                fontSize: FontSize.size14),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void moveToLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void moveToSignUp() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  }
}

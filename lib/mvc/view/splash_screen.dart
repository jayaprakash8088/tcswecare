import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_shared_preferences.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/view/home_page.dart';
import 'package:tcswecare/mvc/view/initial_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  AppSharedPreferences _sharedPreferences = AppSharedPreferences();
  @override
  void initState() {
    super.initState();
    // un visible status and nav buttons
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 3), () async {
      var isLoggedUser = await _sharedPreferences.isLoggedUser();
      if (isLoggedUser != null && isLoggedUser) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => InitialPage()));
    });
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
            Assets.splashBg,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.framePng,
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
              SvgPicture.asset(
                Assets.logo,
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

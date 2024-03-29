import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/login_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/view/forgot_password.dart';
import 'package:tcswecare/mvc/view/home_page.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  _LoginScreenState() : super(LoginController()) {
    _controller = controller;
  }

  LoginController _controller;

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
        physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                Assets.smallRectangle,
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: FontSize.size90,
              right: FontSize.size0,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: FontSize.size50),
                  child: SvgPicture.asset(
                    Assets.frameSide,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: FontSize.size50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: SvgPicture.asset(Assets.supportLogo)),  Padding(
                    padding: EdgeInsets.only(top: FontSize.size30),
                    child: Text(
                      ConstantStrings.startText,
                      textAlign: TextAlign.center,
                      style: AppConfig.startText,
                    ),
                  ),
                  userDetailUI(_controller),
                  GestureDetector(
                    onTap: () {
                      loginClicked();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: FontSize.size50),
                      child: Center(
                        child: Container(
                          height: FontSize.size40,
                          width: FontSize.size160,
                          decoration: BoxDecoration(
                            gradient: AppConfig.gradient,
                            borderRadius: BorderRadius.all(
                                Radius.circular(FontSize.size20)),
                          ),
                          child: Center(
                            child: Text(
                              ConstantStrings.login,
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSize.size14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userDetailUI(LoginController controller) {
    return Padding(
      padding: EdgeInsets.only(
          right: FontSize.size20, left: FontSize.size20, top: FontSize.size350),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: FontSize.size10),
            child: Text(
              ConstantStrings.userName,
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppConfig.montserrat,
                  fontStyle: AppConfig.normal,
                  fontSize: FontSize.size16),
            ),
          ),
          Container(
            height: FontSize.size40,
            decoration: BoxDecoration(
              color: AppColor.bgText,
              borderRadius: BorderRadius.all(Radius.circular(FontSize.size10)),
            ),
            child: TextField(
                controller: _controller.userNameController,
                decoration: InputDecoration(
                    fillColor: AppColor.black,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(FontSize.size10)),
                    ))),
          ),
          Padding(
            padding:
                EdgeInsets.only(bottom: FontSize.size10, top: FontSize.size10),
            child: Text(
              ConstantStrings.password,
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppConfig.montserrat,
                  fontStyle: AppConfig.normal,
                  fontSize: FontSize.size16),
            ),
          ),
          Container(
            height: FontSize.size40,
            decoration: BoxDecoration(
              color: AppColor.bgText,
              borderRadius: BorderRadius.all(Radius.circular(FontSize.size10)),
            ),
            child: TextField(
                controller: _controller.passwordController,
                obscureText: true,
                maxLength: 12,
                buildCounter: (BuildContext context,
                        {int currentLength, int maxLength, bool isFocused}) =>
                    null,
                enableSuggestions: false,
                decoration: InputDecoration(
                    fillColor: AppColor.black,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(FontSize.size10)),
                    ))),
          ),
          GestureDetector(
            onTap: (){
              moveToForgotPassword();
            },
            child: Padding(
              padding:
              EdgeInsets.only(bottom: FontSize.size10, top: FontSize.size10),
              child: Text(
                ConstantStrings.forgotPassword,
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppConfig.montserrat,
                    fontStyle: AppConfig.normal,
                    fontSize: FontSize.size16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loginClicked() async {
    if (_controller.userNameController.text.trim().isNotEmpty &&
        _controller.passwordController.text.trim().isNotEmpty) {
      AppConfig.pleaseWait(context);
      bool isSuccess = await _controller.loginClicked(
          _controller.userNameController.text.trim(),
          _controller.passwordController.text.trim(),
          context);
      if (isSuccess) {
        _controller.getPatientInfo(context);
        _controller.userNameController.clear();
        _controller.passwordController.clear();
        Navigator.pop(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } else {
//      Navigator.pop(context);
      AppConfig.showToast(context, ConstantStrings.enterNamePwd);
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));

  }

  void moveToForgotPassword() {
    dynamic route=MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
    Navigator.push(context, route);
  }
}

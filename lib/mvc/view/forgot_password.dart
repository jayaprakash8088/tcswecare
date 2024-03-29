import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/login_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/view/home_page.dart';
class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() {
    return _ForgotPasswordScreenState();
  }
}

class _ForgotPasswordScreenState extends StateMVC<ForgotPasswordScreen> {
  _ForgotPasswordScreenState() : super(LoginController()) {
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
                  Center(child: SvgPicture.asset(Assets.supportLogo)),
                  userDetailUI(_controller),
                  GestureDetector(
                    onTap: () {
                      sendClicked();
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
                              ConstantStrings.sendCode,
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
              ConstantStrings.eMailId,
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
                controller: _controller.eMailController,
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
              ConstantStrings.resetPassword,
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppConfig.montserrat,
                  fontStyle: AppConfig.normal,
                  fontSize: FontSize.size14),
            ),
          ),
        ],
      ),
    );
  }

  void sendClicked() async {
    if (_controller.eMailController.text.trim().isNotEmpty &&
        _controller.eMailController.text.trim().isNotEmpty) {
      AppConfig.pleaseWait(context);
    } else {
      AppConfig.showToast(context, ConstantStrings.enterMail);
    }
  }
}

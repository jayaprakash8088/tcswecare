import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/controller/login_controller.dart';
import 'package:tcswecare/mvc/model/pain_record_model.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/app_config.dart';
import 'package:tcswecare/mvc/utils/assets.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';
import 'package:tcswecare/mvc/view/home_page.dart';
import 'package:tcswecare/mvc/view/login_screen.dart';
import 'package:tcswecare/mvc/view/otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends StateMVC<SignUpScreen> {
  _SignUpScreenState() : super(LoginController()) {
    _controller = controller;
  }
  LoginController _controller;
  String ageValue = '1', genderValue = 'M';
  List genderList = ['M', 'F'];
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
            Padding(
              padding: EdgeInsets.only(top: FontSize.size70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: SvgPicture.asset(Assets.logo)),
                  Padding(
                    padding: EdgeInsets.only(top: FontSize.size30),
                    child: Text(
                      ConstantStrings.startText,
                      textAlign: TextAlign.center,
                      style: AppConfig.robotoText,
                    ),
                  ),
                  buildUI(),
                  signUpBtn(),
                  existingUI()
                ],
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
            )
          ],
        ),
      ),
    );
  }

  Widget buildUI() {
    return Padding(
      padding: EdgeInsets.only(
        left: FontSize.size20,
        right: FontSize.size20,
        top: FontSize.size150,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(bottom: FontSize.size10, top: FontSize.size10),
            child: Text(
              ConstantStrings.eMail,
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
              ConstantStrings.pWord,
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
                obscureText: true, enableSuggestions: false,
                decoration: InputDecoration(
                    fillColor: AppColor.black,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(FontSize.size10)),
                    ))),
          ),
          Text(AppConfig.passwordCondition,style: TextStyle(color:AppColor.red),),
          Padding(
            padding:
                EdgeInsets.only(bottom: FontSize.size10, top: FontSize.size10),
            child: Text(
              ConstantStrings.name,
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
                controller: _controller.nameController,
                decoration: InputDecoration(
                    fillColor: AppColor.black,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(FontSize.size10)),
                    ))),
          ),
          ageGenderUI(),
          Padding(
            padding: EdgeInsets.only(bottom: FontSize.size10),
            child: Text(
              ConstantStrings.diagnosis,
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
                controller: _controller.diagnosisController,
                decoration: InputDecoration(
                    fillColor: AppColor.black,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(FontSize.size10)),
                    ))),
          ),
        ],
      ),
    );
  }

  Widget ageGenderUI() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: FontSize.size10, top: FontSize.size10),
                child: Text(
                  ConstantStrings.age,
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
                width: FontSize.size106,
                decoration: BoxDecoration(
                    color: AppColor.bgText,
                    borderRadius:
                        BorderRadius.all(Radius.circular(FontSize.size10))),
                child: DropdownButton(
                  underline: SizedBox(),
                  hint: Text(ageValue),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: FontSize.size30,
                  isExpanded: true,
                  value: ageValue,
                  onChanged: (newValue) {
                    setState(() {
                      ageValue = newValue;
                      _controller.ageValue = num.parse(newValue);
                    });
                  },
                  items: AppConfig.ageList.map((valueItem) {
                    return DropdownMenuItem(
                        value: valueItem,
                        child: Center(child: Text(valueItem)));
                  }).toList(),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: FontSize.size10,
                    top: FontSize.size10,
                    right: FontSize.size50),
                child: Text(
                  ConstantStrings.gender,
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
                width: FontSize.size106,
                decoration: BoxDecoration(
                    color: AppColor.bgText,
                    borderRadius:
                        BorderRadius.all(Radius.circular(FontSize.size10))),
                child: DropdownButton(
                  underline: SizedBox(),
                  hint: Text(genderValue),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: FontSize.size30,
                  isExpanded: true,
                  value: genderValue,
                  onChanged: (newValue) {
                    setState(() {
                      genderValue = newValue;
                    });
                  },
                  items: genderList.map((valueItem) {
                    return DropdownMenuItem(
                        value: valueItem,
                        child: Center(child: Text(valueItem)));
                  }).toList(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget existingUI() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: FontSize.size8),
            child: Text(
              ConstantStrings.existingUser,
              style: TextStyle(
                color: AppColor.black,
                fontFamily: AppConfig.montserrat,
                fontStyle: AppConfig.normal,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text(
              ConstantStrings.login1,
              style: TextStyle(
                  color: AppColor.linkColor,
                  fontFamily: AppConfig.montserrat,
                  fontStyle: AppConfig.normal,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  Widget signUpBtn() {
    return GestureDetector(
      onTap: (){
        if(_controller.passwordController.text.trim().isNotEmpty&&
        _controller.eMailController.text.trim().isNotEmpty&&
        _controller.nameController.text.trim().isNotEmpty){
          if(checkPassWord()&&checkMail()){
       signUpClicked();
          }else{
            AppConfig.showToast(context, ConstantStrings.enterValidMailPwd);
          }
        }
        else{
          AppConfig.showToast(context, ConstantStrings.enterMailNamePwd);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(top: FontSize.size30, bottom: FontSize.size20),
        child: Center(
          child: Container(
            height: FontSize.size40,
            width: FontSize.size160,
            decoration: BoxDecoration(
              gradient: AppConfig.gradient,
              borderRadius: BorderRadius.all(Radius.circular(FontSize.size20)),
            ),
            child: Center(
              child: Text(
                ConstantStrings.singUp,
                style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.size14),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void otpPopUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OtpScreen()));
  }

  void signUpClicked()async{
    PainRecordModelResponse response = await _controller.signUp(context);
    if (response != null && response.statusCode == 200) {
      bool isSuccess =await _controller.loginClicked(
          _controller.eMailController.text.trim(),
          _controller.passwordController.text.trim(), context);
      if(isSuccess){
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));}
      else{
        Navigator.pop(context);
        AppConfig.showToast(context, response.message);
      }
      // otpPopUp();
    } else if (response.statusCode == 204) {
      Navigator.pop(context);
      AppConfig.showToast(context, response.message);
    } else {
      Navigator.pop(context);
      AppConfig.showToast(context, ConstantStrings.somethingWrong);
    }
  }

  bool checkPassWord() {
      RegExp regExp = new RegExp(AppConfig.passwordPattern);
      return regExp.hasMatch(_controller.passwordController.text);
  }

  bool checkMail() {
    return RegExp(AppConfig.mailPattern)
        .hasMatch(_controller.eMailController.text.trim());
  }
}

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String ageValue = '1', genderValue = 'M',hospital='Sultan Ismail Hospital',
  hospitalNumber='+60 55 8888',doctor='Dr Sai',doctor1='Dr Sai',doctor2='Dr Sai';
  List genderList = ['M', 'F'];
  List hospitalList = ['Sultan Ismail Hospital', 'Sultan Ismail Hospital 1',
  'Sultan Ismail Hospital 2','Sultan Ismail Hospital 3'];
  List hospitalNumberList = ['+60 55 8888', '+65 884 84848','+60 8484 8484'];
  List doctorsList = ['Dr Sai', 'Dr Test','Dr Test1'];
  List wardName = ['Sunflower', 'Orchid','Tulip'];
  String ward1='Sunflower';
  String ward2='Orchid';
  String ward3='Tulip';

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
                  Center(child: SvgPicture.asset(Assets.supportLogo)),
                  Padding(
                    padding: EdgeInsets.only(top: FontSize.size30),
                    child: Text(
                      ConstantStrings.startText,
                      textAlign: TextAlign.center,
                      style: AppConfig.startText,
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
          // Padding(
          //   padding:
          //       EdgeInsets.only(bottom: FontSize.size10, top: FontSize.size10),
          //   child: Text(
          //     ConstantStrings.doctorEMail,
          //     style: TextStyle(
          //         color: AppColor.black,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: AppConfig.montserrat,
          //         fontStyle: AppConfig.normal,
          //         fontSize: FontSize.size16),
          //   ),
          // ),
          // Container(
          //   height: FontSize.size40,
          //   decoration: BoxDecoration(
          //     color: AppColor.bgText,
          //     borderRadius: BorderRadius.all(Radius.circular(FontSize.size10)),
          //   ),
          //   child: TextField(
          //       controller: _controller.doctorMailController,
          //       decoration: InputDecoration(
          //           fillColor: AppColor.black,
          //           border: InputBorder.none,
          //           focusedBorder: OutlineInputBorder(
          //             borderRadius:
          //                 BorderRadius.all(Radius.circular(FontSize.size10)),
          //           ))),
          // ),
          // Padding(
          //   padding:
          //       EdgeInsets.only(bottom: FontSize.size10, top: FontSize.size10),
          //   child: Text(
          //     ConstantStrings.eMail,
          //     style: TextStyle(
          //         color: AppColor.black,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: AppConfig.montserrat,
          //         fontStyle: AppConfig.normal,
          //         fontSize: FontSize.size16),
          //   ),
          // ),
          // Container(
          //   height: FontSize.size40,
          //   decoration: BoxDecoration(
          //     color: AppColor.bgText,
          //     borderRadius: BorderRadius.all(Radius.circular(FontSize.size10)),
          //   ),
          //   child: TextField(
          //       controller: _controller.eMailController,
          //       decoration: InputDecoration(
          //           fillColor: AppColor.black,
          //           border: InputBorder.none,
          //           focusedBorder: OutlineInputBorder(
          //             borderRadius:
          //                 BorderRadius.all(Radius.circular(FontSize.size10)),
          //           ))),
          // ),
          // Padding(
          //   padding:
          //       EdgeInsets.only(bottom: FontSize.size10, top: FontSize.size10),
          //   child: Text(
          //     ConstantStrings.pWord,
          //     style: TextStyle(
          //         color: AppColor.black,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: AppConfig.montserrat,
          //         fontStyle: AppConfig.normal,
          //         fontSize: FontSize.size16),
          //   ),
          // ),
          // Container(
          //   height: FontSize.size40,
          //   decoration: BoxDecoration(
          //     color: AppColor.bgText,
          //     borderRadius: BorderRadius.all(Radius.circular(FontSize.size10)),
          //   ),
          //   child: TextField(
          //       controller: _controller.passwordController,
          //       obscureText: true,
          //       enableSuggestions: false,
          //       buildCounter: (BuildContext context,
          //               {int currentLength, int maxLength, bool isFocused}) =>
          //           null,
          //       maxLength: 12,
          //       decoration: InputDecoration(
          //           fillColor: AppColor.black,
          //           border: InputBorder.none,
          //           focusedBorder: OutlineInputBorder(
          //             borderRadius:
          //                 BorderRadius.all(Radius.circular(FontSize.size10)),
          //           ))),
          // ),
          // Text(
          //   AppConfig.passwordCondition,
          //   style: TextStyle(color: AppColor.red),
          // ),
          // Padding(
          //   padding:
          //       EdgeInsets.only(bottom: FontSize.size10, top: FontSize.size10),
          //   child: Text(
          //     ConstantStrings.name,
          //     style: TextStyle(
          //         color: AppColor.black,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: AppConfig.montserrat,
          //         fontStyle: AppConfig.normal,
          //         fontSize: FontSize.size16),
          //   ),
          // ),
          // Container(
          //   height: FontSize.size40,
          //   decoration: BoxDecoration(
          //     color: AppColor.bgText,
          //     borderRadius: BorderRadius.all(Radius.circular(FontSize.size10)),
          //   ),
          //   child: TextField(
          //       controller: _controller.nameController,
          //       decoration: InputDecoration(
          //           fillColor: AppColor.black,
          //           border: InputBorder.none,
          //           focusedBorder: OutlineInputBorder(
          //             borderRadius:
          //                 BorderRadius.all(Radius.circular(FontSize.size10)),
          //           ))),
          // ),

          getFieldTitle(ConstantStrings.childName),
          getField(_controller.childNameController,1,false),
          ageGenderUI(),
          getFieldTitle(ConstantStrings.parentName),
          getField(_controller.parentNameController,2,false),
          getFieldTitle(ConstantStrings.parentMail),
          getField(_controller.parentEmailController,3,false),
          getFieldTitle(ConstantStrings.parentMobile),
          getField(_controller.parentMobileController,7,false),
          getDropDown(1,false),
          contactUI(1),
          contactUI(2),
          contactUI(3),
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
             getFieldTitle(ConstantStrings.dob),
              GestureDetector(
                onTap: (){
                  _selectDate(context);
                },
                child: Container(
                  height: FontSize.size40,
                  width:MediaQuery.of(context).size.width*0.5,
                  decoration: BoxDecoration(
                      color: AppColor.bgText,
                      borderRadius:
                          BorderRadius.all(Radius.circular(FontSize.size10))),
                  child: Center(
                    child: Text(
                      _controller.selectedDate!=null?
                      AppConfig.dateFormat.format(_controller.selectedDate):ConstantStrings.dobFormat,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color:_controller.selectedDate!=null?AppColor.black:AppColor.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: FontSize.size16,
                          fontFamily: AppConfig.montserrat),
                ),
                  ),)
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
      onTap: () {
        if (_controller.passwordController.text.trim().isNotEmpty &&
            _controller.eMailController.text.trim().isNotEmpty &&
            _controller.doctorMailController.text.trim().isNotEmpty &&
            _controller.nameController.text.trim().isNotEmpty) {
          if (checkPassWord() && checkMail()) {
            signUpClicked();
          } else {
            AppConfig.showToast(context, ConstantStrings.enterValidMailPwd);
          }
        } else {
          AppConfig.showToast(context,ConstantStrings.enterMailNamePwd);
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

  void signUpClicked() async {
    PainRecordModelResponse response = await _controller.signUp(context);
    if (response != null && response.statusCode == 200) {
      bool isSuccess = await _controller.loginClicked(
          _controller.eMailController.text.trim(),
          _controller.passwordController.text.trim(),
          context);
      if (isSuccess) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
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
  getDropDown(int pos,bool isTrans){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: FontSize.size10,
              top: FontSize.size10,
              right: FontSize.size50),
          child: Text(
            _controller.getTitle(pos),
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
          width: MediaQuery.of(context).size.width*0.8,
          decoration: BoxDecoration(
              color:isTrans?AppColor.transparent: AppColor.bgText,
              borderRadius:
              BorderRadius.all(Radius.circular(FontSize.size10))),
          child: DropdownButton(
            underline: SizedBox(),
            // hint: Text(_controller.getHint(pos)),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: FontSize.size30,
            isExpanded: true,
            value: getValue(pos),
            onChanged: (newValue) {
              setState(() {
                pos==1?hospital = newValue:pos==3?
                doctor2=newValue:pos==4?ward1=newValue:
                pos==5?doctor=newValue:pos==6?doctor1=newValue:
                pos==7?ward2=newValue:ward3=newValue;
              });
            },
            items: pos==1?
                hospitalList.map((valueItem) {
                  return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem));
                }).toList():
                pos==3?
                doctorsList.map((valueItem) {
                  return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem));
                }).toList():
            pos==4||pos==7||pos==8?
            wardName.map((valueItem) {
              return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem));
            }).toList():
            doctorsList.map((valueItem) {
              return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem));
            }).toList(),
          ),
        )
      ],
    );
  }


  getValue(int pos) {
    String text;
    switch(pos){
      case 1:text=hospital;break;
      case 2:text=hospitalNumber;break;
      case 3:text=doctor2;break;
      case 4:text=ward1;break;
      case 5:text=doctor;break;
      case 6:text=doctor1;break;
      case 7:text=ward2;break;
      case 8:text=ward3;break;
    }
    return text;
  }

  getFieldTitle(String title){
    return  Padding(
      padding:
      EdgeInsets.only(bottom: FontSize.size10, top: FontSize.size15),
      child: Text(
        title,
        style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.bold,
            fontFamily: AppConfig.montserrat,
            fontStyle: AppConfig.normal,
            fontSize: FontSize.size16),
      ),
    );
  }
  getField(TextEditingController editingController,int pos,bool isTrans){
    return   Container(
      height: FontSize.size40,
      decoration: BoxDecoration(
        color:isTrans?AppColor.transparent: AppColor.bgText,
        borderRadius: BorderRadius.all(Radius.circular(FontSize.size10)),
      ),
      child: TextField(
          controller: editingController,
          keyboardType: pos==5||pos==7?TextInputType.number:TextInputType.text,
          decoration: InputDecoration(
              fillColor: AppColor.black,
              hintText:_controller.getHint(pos),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(FontSize.size10)),
              ))),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _controller.selectedDate!=null?
        _controller.selectedDate:AppConfig.now,
        firstDate: DateTime(1980),
        lastDate: DateTime(2101));
    if (picked != null && picked != _controller.selectedDate) {
      setState(() {
        _controller.selectedDate = picked;
      });
    }
  }

  contactUI(int pos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: FontSize.size5,),
        Text(pos==1?'mainContact'.tr():pos==2?'backupContact1'.tr():'backupContact2'.tr(),
          textAlign: TextAlign.start,
          style: AppConfig.blackText,),
        SizedBox(height: FontSize.size5,),
        Container(
          decoration: BoxDecoration(
            color: AppColor.bgText,
            borderRadius: BorderRadius.all(Radius.circular(FontSize.size10)),
          ),
          child: Padding(
            padding:  EdgeInsets.all(FontSize.size5),
            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               // pos==1?
               getDropDown(pos==1?4:pos==2?7:8,true),
               //     :Column(
               //   crossAxisAlignment: CrossAxisAlignment.start,
               //   children: [
               //     getFieldTitle(ConstantStrings.wardName),
               //     getField(pos==2?_controller.wardNameController1:_controller.wardNameController2,4,true),
               //   ],
               // ),
                getFieldTitle(ConstantStrings.wardNumber),
                getField(pos==1?_controller.wardNumberController1:
                    pos==2?_controller.wardNumberController2:_controller.wardNumberController3,5,true),
                SizedBox(height: FontSize.size5,),
                getDropDown(pos==1?3:pos==2?5:6,true)
              ],
            ),
          ),
        )
      ],
    );
  }
}

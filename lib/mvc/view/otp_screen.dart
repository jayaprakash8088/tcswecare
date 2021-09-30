import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:tcswecare/mvc/controller/login_controller.dart';
import 'package:tcswecare/mvc/utils/app_color.dart';
import 'package:tcswecare/mvc/utils/font_size.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() {
    return _OtpScreenState();
  }
}

class _OtpScreenState extends StateMVC<OtpScreen> {
  _OtpScreenState() : super(LoginController()) {
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Enter OTP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.orange))),
                SizedBox(
                  height: 8,
                ),
                OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 50,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  keyboardType: TextInputType.number,
                  onCompleted: (pin) {
                    _controller.otp = pin;
                  },
                  onChanged: (pin) {},
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 15,
                    color: Colors.orangeAccent,
                    child: Text("Submit",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                  onTap: () {
                    print('pinnn' + _controller.otp);
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    _controller.resendOTP(context);
                  },
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(
                        fontSize: FontSize.size16,
                        color: AppColor.bgBlue,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

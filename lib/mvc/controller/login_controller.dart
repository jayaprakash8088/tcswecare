import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginController extends ControllerMVC {
  factory LoginController() {
    return _this ??= LoginController._();
  }

  static LoginController _this;

  LoginController._();

  static LoginController get con => _this;
  //user name text controller
  TextEditingController userNameController = TextEditingController();
  // password text controller
  TextEditingController passwordController = TextEditingController();
  // name text controller
  TextEditingController nameController = TextEditingController();
  //patient id controller
  TextEditingController patientIdController = TextEditingController();
  // email
  TextEditingController eMailController = TextEditingController();
  // diagnosis controller
  TextEditingController diagnosisController = TextEditingController();
}

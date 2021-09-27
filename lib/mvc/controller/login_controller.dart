import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/api_utils/repository.dart';
import 'package:tcswecare/mvc/utils/app_shared_preferences.dart';

class LoginController extends ControllerMVC {
  factory LoginController() {
    return _this ??= LoginController._();
  }

  static LoginController _this;

  LoginController._();
  Repository repository = Repository();
  AppSharedPreferences sharedPreferences = AppSharedPreferences();
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

  Future<dynamic> loginClicked(
      String userName, String password, BuildContext context) async {
    Map<String, String> body = {
      'grant_type': 'password',
      'username': userName,
      'password': password,
    };
    dynamic response = await repository.callLogin(body, context);
    if (response != null && response.statusCode == 200) {
      await sharedPreferences.setAccessToken(
          response.data['access_token'].toString(),
          'ad24ed76-4eac-4095-98b2-8bf45b94fb7d');
      return true;
    } else {
      return false;
    }
  }
}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';

class AppSharedPreferences {
  SharedPreferences _sharedPreferences;

  AppSharedPreferences() {
    _init();
  }
  String accessToken = ConstantStrings.accessToken;
  String loggedUser = ConstantStrings.loggedUser;
  Future _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //save access token
  Future setAccessToken(String token) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.setString(accessToken, token);
    await _sharedPreferences.setBool(loggedUser, true);
  }

  //get token
  Future getToken() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    dynamic token = _sharedPreferences.getString(accessToken);
    return token;
  }

  // is logged user
  Future isLoggedUser() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    dynamic isLoggedUser = _sharedPreferences.getBool(loggedUser);
    return isLoggedUser;
  }
}

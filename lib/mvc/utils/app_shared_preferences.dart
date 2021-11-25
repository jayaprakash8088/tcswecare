import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcswecare/mvc/utils/constant_strings.dart';

class AppSharedPreferences {
  SharedPreferences _sharedPreferences;

  AppSharedPreferences() {
    _init();
  }
  String accessToken = ConstantStrings.accessToken;
  String loggedUser = ConstantStrings.loggedUser;
  String userId = ConstantStrings.userId;
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
    print('token::: $token');
    return token;
  }

  // is logged user
  Future isLoggedUser() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    dynamic isLoggedUser = _sharedPreferences.getBool(loggedUser);
    return isLoggedUser;
  }

  //set userId
  Future setUserId(String id) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.setString(userId, id);
  }

  //get user id
  Future getUserId() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    dynamic response = _sharedPreferences.getString(userId);
    return response;
  }
  Future clearAll()async{
    _sharedPreferences=await SharedPreferences.getInstance();
    await _sharedPreferences.clear();
  }
}

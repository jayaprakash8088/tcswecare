import 'package:tcswecare/mvc/api_utils/api_client.dart';

class Repository {
  ApiClient _apiClient = ApiClient();

  //login call
  Future<dynamic> callLogin(dynamic formData) async {
    dynamic response;
    try {
      response = await _apiClient.login(formData);
    } catch (e) {}
    return response;
  }
}

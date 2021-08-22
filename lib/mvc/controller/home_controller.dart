import 'package:mvc_pattern/mvc_pattern.dart';

class HomePageController extends ControllerMVC {
  factory HomePageController() {
    return _this ??= HomePageController._();
  }
  static HomePageController _this;
  HomePageController._();
}

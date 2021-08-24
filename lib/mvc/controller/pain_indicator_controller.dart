import 'package:mvc_pattern/mvc_pattern.dart';

class PainIndicatorController extends ControllerMVC {
  factory PainIndicatorController() {
    return _this ??= PainIndicatorController._();
  }
  static PainIndicatorController _this;
  PainIndicatorController._();
  static PainIndicatorController get con => _this;
  // spinner value
  double spinnerValue;
  //date value
  DateTime dateTime;
  DateTime time;
}

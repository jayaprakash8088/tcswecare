import 'package:mvc_pattern/mvc_pattern.dart';

class SymptomTrackerController extends ControllerMVC {
  factory SymptomTrackerController() {
    return _this ??= SymptomTrackerController._();
  }
  static SymptomTrackerController _this;
  SymptomTrackerController._();
  static SymptomTrackerController get con => _this;
  DateTime dateTime;
  DateTime time;
}

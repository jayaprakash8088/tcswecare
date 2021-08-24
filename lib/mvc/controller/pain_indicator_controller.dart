import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tcswecare/mvc/model/pain_tracker_model.dart';

class PainIndicatorController extends ControllerMVC {
  factory PainIndicatorController() {
    return _this ??= PainIndicatorController._();
  }
  static PainIndicatorController _this;
  PainIndicatorController._();
  static PainIndicatorController get con => _this;

  PainTrackerModel _model = PainTrackerModel();
  // spinner value
  double spinnerValue;
  //date value
  DateTime dateTime;
  DateTime selectedDate;
  DateTime time;
  DateTime selectedTime;
  DateTime date1;
  DateTime time1;
}

import 'package:mvc_pattern/mvc_pattern.dart';

class PainIndicatorController extends ControllerMVC {
  factory PainIndicatorController() {
    return _this ??= PainIndicatorController._();
  }
  static PainIndicatorController _this;
  PainIndicatorController._();

  // spinner value
  double spinnerValue;
}

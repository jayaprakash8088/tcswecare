class PainResponseModel {
  PainResponseModel({
      String version, 
      int statusCode, 
      String message, 
      List<PainResult> result,}){
    _version = version;
    _statusCode = statusCode;
    _message = message;
    _result = result;
}

  PainResponseModel.fromJson(dynamic json) {
    _version = json['Version'];
    _statusCode = json['StatusCode'];
    _message = json['Message'];
    if (json['Result'] != null) {
      _result = [];
      json['Result'].forEach((v) {
        _result.add(PainResult.fromJson(v));
      });
    }
  }
  String _version;
  int _statusCode;
  String _message;
  List<PainResult> _result;

  String get version => _version;
  int get statusCode => _statusCode;
  String get message => _message;
  List<PainResult> get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Version'] = _version;
    map['StatusCode'] = _statusCode;
    map['Message'] = _message;
    if (_result != null) {
      map['Result'] = _result.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PainResult {
  PainResult({
      String userID, 
      String painLevel, 
      String painDate, 
      String painTime,}){
    _userID = userID;
    _painLevel = painLevel;
    _painDate = painDate;
    _painTime = painTime;
}

  PainResult.fromJson(dynamic json) {
    _userID = json['UserID'];
    _painLevel = json['PainLevel'];
    _painDate = json['PainDate'];
    _painTime = json['PainTime'];
  }
  String _userID;
  String _painLevel;
  String _painDate;
  String _painTime;

  String get userID => _userID;
  String get painLevel => _painLevel;
  String get painDate => _painDate;
  String get painTime => _painTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = _userID;
    map['PainLevel'] = _painLevel;
    map['PainDate'] = _painDate;
    map['PainTime'] = _painTime;
    return map;
  }

}
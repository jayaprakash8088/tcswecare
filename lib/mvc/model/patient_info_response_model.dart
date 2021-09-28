class PatientInfoResponseModel {
  String message;
  Result result;
  int statusCode;
  String version;

  PatientInfoResponseModel(
      {this.message, this.result, this.statusCode, this.version});

  factory PatientInfoResponseModel.fromJson(Map<String, dynamic> json) {
    return PatientInfoResponseModel(
      message: json['Message'],
      result: json['Result'] != null ? Result.fromJson(json['Result']) : null,
      statusCode: json['StatusCode'],
      version: json['Version'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['StatusCode'] = this.statusCode;
    data['Version'] = this.version;
    if (this.result != null) {
      data['Result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  int age;
  String emailId;
  String oTP;
  bool oTPVerified;
  String password;
  String patientName;
  String userId;

  Result(
      {this.age,
      this.emailId,
      this.oTP,
      this.oTPVerified,
      this.password,
      this.patientName,
      this.userId});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      age: json['Age'],
      emailId: json['EmailId'],
      oTP: json['OTP'],
      oTPVerified: json['OTPVerified'],
      password: json['Password'],
      patientName: json['PatientName'],
      userId: json['UserId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Age'] = this.age;
    data['EmailId'] = this.emailId;
    data['OTP'] = this.oTP;
    data['OTPVerified'] = this.oTPVerified;
    data['Password'] = this.password;
    data['PatientName'] = this.patientName;
    data['UserId'] = this.userId;
    return data;
  }
}

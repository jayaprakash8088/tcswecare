class PatientInfoResponseModel {
  String message;
  Result result;
  int statusCode;
  String version;

  PatientInfoResponseModel(
      {this.message, this.result, this.statusCode, this.version});

  factory PatientInfoResponseModel.fromJson(Map<String, dynamic> json) {
    return PatientInfoResponseModel(
      message: json['message'],
      result: json['result'] != null ? Result.fromJson(json['result']) : null,
      statusCode: json['statusCode'],
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    data['version'] = this.version;
    if (this.result != null) {
      data['result'] = this.result.toJson();
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
      age: json['age'],
      emailId: json['emailId'],
      oTP: json['oTP'],
      oTPVerified: json['oTPVerified'],
      password: json['password'],
      patientName: json['patientName'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['emailId'] = this.emailId;
    data['oTP'] = this.oTP;
    data['oTPVerified'] = this.oTPVerified;
    data['password'] = this.password;
    data['patientName'] = this.patientName;
    data['userId'] = this.userId;
    return data;
  }
}

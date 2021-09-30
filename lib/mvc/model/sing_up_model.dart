class SignUpModel {
  int age;
  String emailId;
  String password;
  String patientName;

  SignUpModel({this.age, this.emailId, this.password, this.patientName});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      age: json['age'],
      emailId: json['emailId'],
      password: json['password'],
      patientName: json['patientName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['emailId'] = this.emailId;
    data['password'] = this.password;
    data['patientName'] = this.patientName;
    return data;
  }
}

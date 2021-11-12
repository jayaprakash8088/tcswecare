class SignUpModel {
  int age;
  String emailId;
  String password;
  String patientName;
  String diagnosis;

  SignUpModel({this.age, this.emailId, this.password, this.patientName,this.diagnosis});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      age: json['age'],
      emailId: json['emailId'],
      password: json['password'],
      patientName: json['patientName'],
      diagnosis: json['diagnosis'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['emailId'] = this.emailId;
    data['password'] = this.password;
    data['patientName'] = this.patientName;
    data['diagnosis'] = this.diagnosis;
    return data;
  }
}

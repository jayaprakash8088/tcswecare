class SignUpModel {
  int age;
  String emailId;
  String password;
  String patientName;
  String diagnosis;
  String doctorEmailId;
  SignUpModel({this.age, this.emailId, this.password, this.patientName,this.diagnosis,this.doctorEmailId});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      age: json['age'],
      emailId: json['emailId'],
      password: json['password'],
      patientName: json['patientName'],
      diagnosis: json['diagnosis'],
      doctorEmailId: json['doctorEmailId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['emailId'] = this.emailId;
    data['password'] = this.password;
    data['patientName'] = this.patientName;
    data['diagnosis'] = this.diagnosis;
    data['doctorEmailId'] = this.doctorEmailId;
    return data;
  }
}

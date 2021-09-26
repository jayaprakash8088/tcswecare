class PainLevelModel {
  String painDate;
  String painLevel;
  String painTime;
  String userID;

  PainLevelModel({this.painDate, this.painLevel, this.painTime, this.userID});

  factory PainLevelModel.fromJson(Map<String, dynamic> json) {
    return PainLevelModel(
      painDate: json['painDate'],
      painLevel: json['painLevel'],
      painTime: json['painTime'],
      userID: json['userID'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['painDate'] = this.painDate;
    data['painLevel'] = this.painLevel;
    data['painTime'] = this.painTime;
    data['userID'] = this.userID;
    return data;
  }
}

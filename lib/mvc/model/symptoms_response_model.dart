class SymptomsResponseModel {
  String message;
  List<Result> result;
  int statusCode;
  String version;

  SymptomsResponseModel(
      {this.message, this.result, this.statusCode, this.version});

  factory SymptomsResponseModel.fromJson(Map<String, dynamic> json) {
    return SymptomsResponseModel(
      message: json['Message'],
      result: json['Result'] != null
          ? (json['Result'] as List).map((i) => Result.fromJson(i)).toList()
          : null,
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
      data['Result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String anxiety;
  String constipation;
  String itchyOrDrySkin;
  String mood;
  String nausea;
  String otherComments;
  String shortnessOfBreath;
  String symptomDate;
  String symptomTime;
  String userID;

  Result(
      {this.anxiety,
      this.constipation,
      this.itchyOrDrySkin,
      this.mood,
      this.nausea,
      this.otherComments,
      this.shortnessOfBreath,
      this.symptomDate,
      this.symptomTime,
      this.userID});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      anxiety: json['Anxiety'],
      constipation: json['Constipation'],
      itchyOrDrySkin: json['ItchyOrDrySkin'],
      mood: json['Mood'],
      nausea: json['Nausea'],
      otherComments: json['OtherComments'],
      shortnessOfBreath: json['ShortnessOfBreath'],
      symptomDate: json['SymptomDate'],
      symptomTime: json['SymptomTime'],
      userID: json['UserID'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Anxiety'] = this.anxiety;
    data['Constipation'] = this.constipation;
    data['ItchyOrDrySkin'] = this.itchyOrDrySkin;
    data['Mood'] = this.mood;
    data['Nausea'] = this.nausea;
    data['OtherComments'] = this.otherComments;
    data['ShortnessOfBreath'] = this.shortnessOfBreath;
    data['SymptomDate'] = this.symptomDate;
    data['SymptomTime'] = this.symptomTime;
    data['UserID'] = this.userID;
    return data;
  }
}

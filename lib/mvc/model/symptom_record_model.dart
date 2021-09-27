class SymptomRecordModel {
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

  SymptomRecordModel(
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

  factory SymptomRecordModel.fromJson(Map<String, dynamic> json) {
    return SymptomRecordModel(
      anxiety: json['anxiety'],
      constipation: json['constipation'],
      itchyOrDrySkin: json['itchyOrDrySkin'],
      mood: json['mood'],
      nausea: json['nausea'],
      otherComments: json['otherComments'],
      shortnessOfBreath: json['shortnessOfBreath'],
      symptomDate: json['symptomDate'],
      symptomTime: json['symptomTime'],
      userID: json['userID'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anxiety'] = this.anxiety;
    data['constipation'] = this.constipation;
    data['itchyOrDrySkin'] = this.itchyOrDrySkin;
    data['mood'] = this.mood;
    data['nausea'] = this.nausea;
    data['otherComments'] = this.otherComments;
    data['shortnessOfBreath'] = this.shortnessOfBreath;
    data['symptomDate'] = this.symptomDate;
    data['symptomTime'] = this.symptomTime;
    data['userID'] = this.userID;
    return data;
  }
}

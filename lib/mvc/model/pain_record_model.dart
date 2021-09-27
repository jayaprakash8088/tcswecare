class PainRecordModel {
  String message;
  int statusCode;
  String version;

  PainRecordModel({this.message, this.statusCode, this.version});

  factory PainRecordModel.fromJson(Map<String, dynamic> json) {
    return PainRecordModel(
      message: json['Message'],
      statusCode: json['StatusCode'],
      version: json['Version'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['StatusCode'] = this.statusCode;
    data['Version'] = this.version;
    return data;
  }
}

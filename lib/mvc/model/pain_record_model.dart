class PainRecordModelResponse {
  String message;
  int statusCode;
  String version;

  PainRecordModelResponse({this.message, this.statusCode, this.version});

  factory PainRecordModelResponse.fromJson(Map<String, dynamic> json) {
    return PainRecordModelResponse(
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

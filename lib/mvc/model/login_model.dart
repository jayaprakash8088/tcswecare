class LoginModel {
  String accessToken;
  int expiresIn;
  String tokenType;
  String userName;

  LoginModel({this.accessToken, this.expiresIn, this.tokenType, this.userName});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json['access_token'],
      expiresIn: json['expires_in'],
      tokenType: json['token_type'],
      userName: json['userName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['token_type'] = this.tokenType;
    data['userName'] = this.userName;
    return data;
  }
}

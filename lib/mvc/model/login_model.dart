class LoginModel {
  String access_token;
  int expires_in;
  String token_type;
  String userName;

  LoginModel(
      {this.access_token, this.expires_in, this.token_type, this.userName});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      access_token: json['access_token'],
      expires_in: json['expires_in'],
      token_type: json['token_type'],
      userName: json['userName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.access_token;
    data['expires_in'] = this.expires_in;
    data['token_type'] = this.token_type;
    data['userName'] = this.userName;
    return data;
  }
}

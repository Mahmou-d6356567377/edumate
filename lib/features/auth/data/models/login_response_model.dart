class LoginResponseModel {
  final String token;
  final String expiration;
  final String refreshToken;

  LoginResponseModel({
    required this.token,
    required this.expiration,
    required this.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
      expiration: json['expiration'],
      refreshToken: json['refreshToken'],
    );
  }
}

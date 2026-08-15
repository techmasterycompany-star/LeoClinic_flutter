class ResetPasswordRequestModel {
  final String token;
  final String password;

  ResetPasswordRequestModel({
    required this.token,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'password': password,
    };
  }
}
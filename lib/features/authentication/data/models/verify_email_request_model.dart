class VerifyEmailRequestModel {
  final String token;

  VerifyEmailRequestModel({
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
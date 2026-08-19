class VerifyResetPasswordTokenResponseModel {
  final bool success;
  final String message;

  VerifyResetPasswordTokenResponseModel({
    required this.success,
    required this.message,
  });

  factory VerifyResetPasswordTokenResponseModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return VerifyResetPasswordTokenResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
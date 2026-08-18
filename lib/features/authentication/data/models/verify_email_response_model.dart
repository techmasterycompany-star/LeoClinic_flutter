class VerifyEmailResponseModel {
  final bool success;
  final String message;

  VerifyEmailResponseModel({
    required this.success,
    required this.message,
  });

  factory VerifyEmailResponseModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return VerifyEmailResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
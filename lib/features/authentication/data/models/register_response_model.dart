class RegisterResponseModel {
  final bool success;
  final String message;

  RegisterResponseModel({
    required this.success,
    required this.message,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
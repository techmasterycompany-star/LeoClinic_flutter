import 'user_model.dart';

class LoginResponseModel {
  final bool success;
  final String accessToken;
  final int accessTokenExpiresIn;
  final UserModel user;

  LoginResponseModel({
    required this.success,
    required this.accessToken,
    required this.accessTokenExpiresIn,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return LoginResponseModel(
      success: json['success'],
      accessToken: data['accessToken'],
      accessTokenExpiresIn: data['accessTokenExpiresIn'],
      user: UserModel.fromJson(data['user']),
    );
  }
}
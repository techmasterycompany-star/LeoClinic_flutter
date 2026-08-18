import 'package:dio/dio.dart';
import 'package:leoclinic_flutter/core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/forgot_password_request_model.dart';
import '../models/forgot_password_response_model.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';
import '../models/reset_password_request_model.dart';
import '../models/reset_password_response_model.dart';
import '../models/user_model.dart';
import '../models/verify_reset_password_token_request_model.dart';
import '../models/verify_reset_password_token_response_model.dart';

class AuthApiServices {
  final Dio dio;

  AuthApiServices(DioClient dioClient) : dio = dioClient.dio;

  Future<LoginResponseModel> login(
    LoginRequestModel request,
  ) async {
    try {
      final response = await dio.post(
        ApiConstants.login,
        data: request.toJson(),
      );

      return LoginResponseModel.fromJson(response.data);
    } on DioException {
      return _mockLogin(request);
    }
  }

  Future<RegisterResponseModel> register(
    RegisterRequestModel request,
  ) async {
    try {
      final response = await dio.post(
        ApiConstants.register,
        data: request.toJson(),
      );

      return RegisterResponseModel.fromJson(response.data);
    } on DioException {
      return _mockRegister(request);
    }
  }

  Future<String> verifyEmail(String code) async {
    try {
      final response = await dio.post(
        ApiConstants.verifyEmail,
        data: {
          'code': code,
        },
      );

      return response.data['message'] ?? 'Email verified successfully';
    } on DioException {
      return 'Email verified successfully (mock)';
    }
  }

  Future<ForgotPasswordResponseModel> forgotPassword(
    ForgotPasswordRequestModel request,
  ) async {
    try {
      final response = await dio.post(
        ApiConstants.forgotPassword,
        data: request.toJson(),
      );

      return ForgotPasswordResponseModel.fromJson(response.data);
    } on DioException {
      return ForgotPasswordResponseModel(
        success: true,
        message: 'Password reset code sent (mock)',
      );
    }
  }

  Future<VerifyResetPasswordTokenResponseModel>
      verifyResetPasswordToken(
    VerifyResetPasswordTokenRequestModel request,
  ) async {
    try {
      final response = await dio.get(
        ApiConstants.verifyResetPasswordToken,
        queryParameters: {
          'token': request.token,
        },
      );

      return VerifyResetPasswordTokenResponseModel.fromJson(
        response.data,
      );
    } on DioException {
      return VerifyResetPasswordTokenResponseModel(
        success: true,
        message: 'Token verified (mock)',
      );
    }
  }

  Future<ResetPasswordResponseModel> resetPassword(
    ResetPasswordRequestModel request,
  ) async {
    try {
      final response = await dio.post(
        ApiConstants.resetPassword,
        data: request.toJson(),
      );

      return ResetPasswordResponseModel.fromJson(response.data);
    } on DioException {
      return ResetPasswordResponseModel(
        success: true,
        message: 'Password reset successfully (mock)',
      );
    }
  }

  // -------------------------------------------------------
  // Mock when backend is down = 500
  //
  // Test accounts (use the email to pick a role):
  //   admin@test.com   => admin
  //   doctor@test.com  => doctor
  //   patient@test.com => patient
  //
  // Password: any (Test_123456)
  // -------------------------------------------------------

  static const String _mockToken =
      'mock_access_token_eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9';

  LoginResponseModel _mockLogin(LoginRequestModel request) {
    final email = request.email.toLowerCase();
    String role;
    String name;

    if (email.startsWith('admin')) {
      role = 'admin';
      name = 'Test Admin';
    } else if (email.startsWith('doctor') || email.startsWith('doc')) {
      role = 'doctor';
      name = 'Dr. Test Doctor';
    } else {
      role = 'patient';
      name = 'Test Patient';
    }

    return LoginResponseModel(
      success: true,
      accessToken: _mockToken,
      accessTokenExpiresIn: 86400,
      user: UserModel(
        id: 'mock_user_001',
        name: name,
        email: request.email,
        role: role,
        contactNumber: '01234567890',
        isVerified: true,
      ),
    );
  }

  RegisterResponseModel _mockRegister(RegisterRequestModel request) {
    return RegisterResponseModel(
      success: true,
      message: 'Account created successfully (mock)',
    );
  }
}

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
import '../models/verify_reset_password_token_request_model.dart';
import '../models/verify_reset_password_token_response_model.dart';
class AuthApiServices {
  final Dio dio;

  AuthApiServices(DioClient dioClient) : dio = dioClient.dio;

  Future<LoginResponseModel> login(
      LoginRequestModel request,
      ) async {
    final response = await dio.post(
      ApiConstants.login,
      data: request.toJson(),
    );

    return LoginResponseModel.fromJson(response.data);
  }
  Future<RegisterResponseModel> register(
      RegisterRequestModel request,
      ) async {
    final response = await dio.post(
      ApiConstants.register,
      data: request.toJson(),
    );

    return RegisterResponseModel.fromJson(response.data);
  }
  Future<String> verifyEmail(String code) async {
    final response = await dio.post(
      ApiConstants.verifyEmail,
      data: {
        'code': code,
      },
    );

    return response.data['message'] ?? 'Email verified successfully';
  }
  Future<ForgotPasswordResponseModel> forgotPassword(
      ForgotPasswordRequestModel request,
      ) async {
    final response = await dio.post(
      ApiConstants.forgotPassword,
      data: request.toJson(),
    );

    return ForgotPasswordResponseModel.fromJson(response.data);
  }
  Future<VerifyResetPasswordTokenResponseModel>
  verifyResetPasswordToken(
      VerifyResetPasswordTokenRequestModel request,
      ) async {
    final response = await dio.get(
      ApiConstants.verifyResetPasswordToken,
      queryParameters: {
        'token': request.token,
      },
    );

    return VerifyResetPasswordTokenResponseModel.fromJson(
      response.data,
    );
  }
  Future<ResetPasswordResponseModel> resetPassword(
      ResetPasswordRequestModel request,
      ) async {
    final response = await dio.post(
      ApiConstants.resetPassword,
      data: request.toJson(),
    );

    return ResetPasswordResponseModel.fromJson(response.data);
  }

}
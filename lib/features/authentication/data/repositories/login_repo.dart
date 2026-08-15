import 'package:leoclinic_flutter/features/authentication/data/datasource/auth_api_services.dart';
import 'package:leoclinic_flutter/features/authentication/data/models/login_request_model.dart';
import 'package:leoclinic_flutter/features/authentication/data/models/login_response_model.dart';

import '../models/forgot_password_request_model.dart';
import '../models/forgot_password_response_model.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';
import '../models/reset_password_request_model.dart';
import '../models/reset_password_response_model.dart';
import '../models/verify_reset_password_token_request_model.dart';
import '../models/verify_reset_password_token_response_model.dart';
class LoginRepo {
  final AuthApiServices authApiService;
 LoginRepo(this.authApiService);
  Future<LoginResponseModel> login(
      LoginRequestModel request,
      )
    async {
       return await authApiService.login(request);
     }
  Future<RegisterResponseModel> register(
      RegisterRequestModel request,
      ) async {
    return await authApiService.register(request);
  }
  Future<String> verifyEmail(String code) async {
    return await authApiService.verifyEmail(code);
  }
  Future<ForgotPasswordResponseModel> forgotPassword(
      ForgotPasswordRequestModel request,
      ) async {
    return await authApiService.forgotPassword(request);
  }
  Future<VerifyResetPasswordTokenResponseModel>
  verifyResetPasswordToken(
      VerifyResetPasswordTokenRequestModel request,
      ) async {
    return await authApiService.verifyResetPasswordToken(request);
  }
  Future<ResetPasswordResponseModel> resetPassword(
      ResetPasswordRequestModel request,
      ) async {
    return await authApiService.resetPassword(request);
  }
}
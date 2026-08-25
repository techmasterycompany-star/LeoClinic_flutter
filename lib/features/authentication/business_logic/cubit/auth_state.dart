import '../../data/models/forgot_password_response_model.dart';
import '../../data/models/login_response_model.dart';
import '../../data/models/register_response_model.dart';
import '../../data/models/reset_password_response_model.dart';
import '../../data/models/verify_reset_password_token_response_model.dart';
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final LoginResponseModel response;

  LoginSuccess(this.response);
}

class RegisterSuccess extends AuthState {
  final RegisterResponseModel response;

  RegisterSuccess(this.response);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
class VerifyEmailSuccess extends AuthState {
  final String message;

  VerifyEmailSuccess(this.message);
}
class ForgotPasswordSuccess extends AuthState {
  final ForgotPasswordResponseModel response;

  ForgotPasswordSuccess(this.response);
}
class VerifyResetPasswordTokenSuccess extends AuthState {
  final VerifyResetPasswordTokenResponseModel response;

  VerifyResetPasswordTokenSuccess(this.response);
}
class ResetPasswordSuccess extends AuthState {
  final ResetPasswordResponseModel response;

  ResetPasswordSuccess(this.response);
}

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/utils/pref-helper.dart';
import '../../data/models/forgot_password_request_model.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/register_request_model.dart';
import '../../data/models/reset_password_request_model.dart';
import '../../data/models/verify_reset_password_token_request_model.dart';

import '../../data/repositories/login_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginRepo loginRepo;

  AuthCubit(this.loginRepo) : super(AuthInitial());


  void _handleError(Object error) {
    // Dio Error
    if (error is DioException) {
      final ApiException exception =
      ErrorHandler.handle(error);

      emit(
        AuthError(exception.message),
      );

      return;
    }

    if (error is ApiException) {
      emit(
        AuthError(error.message),
      );

      return;
    }

    emit(
      AuthError(
        'Something went wrong. Please try again.',
      ),
    );
  }


  Future<void> login(
      LoginRequestModel request,
      ) async {
    emit(AuthLoading());

    try {
      final response = await loginRepo.login(request);

      final token = response.accessToken;
      if (token.isNotEmpty) {
        await Prefhelper.savetoken(token);
      }

      emit(
        LoginSuccess(response),
      );
    } catch (e) {
      _handleError(e);
    }
  }


  Future<void> register(
      RegisterRequestModel request,
      ) async {
    emit(AuthLoading());

    try {
      final response = await loginRepo.register(request);

      emit(
        RegisterSuccess(response),
      );
    } catch (e) {
      _handleError(e);
    }
  }


  Future<void> verifyEmail(
      String code,
      ) async {
    emit(AuthLoading());

    try {
      final message = await loginRepo.verifyEmail(code);

      emit(
        VerifyEmailSuccess(message),
      );
    } catch (e) {
      _handleError(e);
    }
  }


  Future<void> forgotPassword(
      ForgotPasswordRequestModel request,
      ) async {
    emit(AuthLoading());

    try {
      final response =
      await loginRepo.forgotPassword(request);

      emit(
        ForgotPasswordSuccess(response),
      );
    } catch (e) {
      _handleError(e);
    }
  }


  Future<void> verifyResetPasswordToken(
      VerifyResetPasswordTokenRequestModel request,
      ) async {
    emit(AuthLoading());

    try {
      final response =
      await loginRepo.verifyResetPasswordToken(
        request,
      );

      emit(
        VerifyResetPasswordTokenSuccess(response),
      );
    } catch (e) {
      _handleError(e);
    }
  }


  Future<void> resetPassword(
      ResetPasswordRequestModel request,
      ) async {
    emit(AuthLoading());

    try {
      final response =
      await loginRepo.resetPassword(request);

      emit(
        ResetPasswordSuccess(response),
      );
    } catch (e) {
      _handleError(e);
    }
  }
}
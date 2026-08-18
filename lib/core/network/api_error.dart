import 'package:dio/dio.dart';
import 'api_exception.dart';

class ErrorHandler {
  static ApiException handle(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
      return ApiException(
        'Connection timeout. Please try again.',
      );
    }

    if (error.type == DioExceptionType.sendTimeout) {
      return ApiException(
        'Request timeout. Please try again.',
      );
    }

    if (error.type == DioExceptionType.receiveTimeout) {
      return ApiException(
        'Server took too long to respond.',
      );
    }

    if (error.type == DioExceptionType.connectionError) {
      return ApiException(
        'No internet connection.',
      );
    }

    if (error.type == DioExceptionType.cancel) {
      return ApiException(
        'Request was cancelled.',
      );
    }

    if (error.response != null) {
      return _handleResponseError(error.response!);
    }

    return ApiException(
      'Something went wrong. Please try again.',
    );
  }

  static ApiException _handleResponseError(
      Response response,
      ) {
    final data = response.data;

    if (data is Map<String, dynamic>) {
      final message = data['message'];

      if (message is String && message.isNotEmpty) {
        return ApiException(message);
      }
    }

    switch (response.statusCode) {
      case 400:
        return ApiException(
          'Bad request.',
        );

      case 401:
        return ApiException(
          'Invalid email or password.',
        );

      case 403:
        return ApiException(
          'You are not allowed to perform this action.',
        );

      case 404:
        return ApiException(
          'Resource not found.',
        );

      case 409:
        return ApiException(
          'This data already exists.',
        );

      case 422:
        return ApiException(
          'Invalid data.',
        );

      case 500:
        return ApiException(
          'Server error. Please try again later.',
        );

      default:
        return ApiException(
          'Something went wrong. Please try again.',
        );
    }
  }
}
import 'package:dio/dio.dart';
import 'package:leoclinic_flutter/core/network/api-error.dart';

class ApiException {
  static ApiError handleError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Connection timeout");

      case DioExceptionType.sendTimeout:
        return ApiError(message: "Send timeout");

      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Receive timeout");

      case DioExceptionType.badCertificate:
        return ApiError(message: "Bad certificate");

      case DioExceptionType.badResponse:
        return ApiError(
          message: "Bad response",
        );

      case DioExceptionType.cancel:
        return ApiError(message: "Request cancelled");

      case DioExceptionType.connectionError:
        return ApiError(message: "Connection error");

      case DioExceptionType.unknown:
        return ApiError(message: "Unknown error");

      case DioExceptionType.transformTimeout:
        return ApiError(message: "Transform timeout");
    }
  }
}
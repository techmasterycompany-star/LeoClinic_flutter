import 'package:dio/dio.dart';
import 'api_constants.dart';

class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.apiBaseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
}
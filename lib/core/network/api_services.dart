import 'package:dio/dio.dart';
import 'package:leoclinic_flutter/core/network/api_exception_legacy.dart';
import 'package:leoclinic_flutter/core/network/dio_client_legacy.dart';

class Apiservices {
  final Dioclient dioclient = Dioclient();
  Future<dynamic> get(String endpoint) async {
    try {
      Response response = await dioclient.dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      return ApiException.handleError(e);
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    try {
      Response response = await dioclient.dio.post(endpoint, data: body);
      return response.data;
    } on DioException catch (e) {
    return  ApiException.handleError(e);
    }
  }

  Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    try {
      Response response = await dioclient.dio.put(endpoint, data: body);
      return response.data;
    } on DioException catch (e) {
    return  ApiException.handleError(e);
    }
  }
  Future<dynamic> delete(String endpoint,) async {
    try {
      Response response = await dioclient.dio.delete(endpoint);
      return response.data;
    } on DioException catch (e) {
    return  ApiException.handleError(e);
    }
  }
}

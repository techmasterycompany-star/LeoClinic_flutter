import 'package:dio/dio.dart';
import 'package:leoclinic_flutter/core/network/api_constants.dart';
import 'package:leoclinic_flutter/core/network/dio_client.dart';
import '../models/doctor_model.dart';

class DoctorApiServices {
  final Dio dio;

  DoctorApiServices(DioClient dioClient) : dio = dioClient.dio;

  Future<List<DoctorModel>> searchDoctors({
    String? locationId,
    String? specialtyId,
  }) async {
    final queryParameters = <String, dynamic>{
      'location_id': ?locationId,
      'specialty_id': ?specialtyId,
    };

    final response = await dio.get(
      ApiConstants.doctors,
      queryParameters: queryParameters,
    );

    return parseDoctorsList(response.data);
  }

  Future<DoctorModel> getDoctorProfile(String doctorId) async {
    final response = await dio.get(ApiConstants.doctorById(doctorId));

    final data = response.data;
    if (data is Map && data['data'] is Map) {
      return DoctorModel.fromJson(
        data['data'] is Map<String, dynamic>
            ? data['data']
            : const <String, dynamic>{},
      );
    }
    return DoctorModel.fromJson(
      data is Map<String, dynamic> ? data : const <String, dynamic>{},
    );
  }
}
import 'package:dio/dio.dart';
import 'package:leoclinic_flutter/core/utils/pref_helper.dart';

class Dioclient {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://leoclinicnodejs-production.up.railway.app/",
      headers: {
        "Cache-Control": "no-cache",
        " User-Agent": "PostmanRuntime/7.53.0",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
      },
    ),
  );
  Dioclient() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler)async {
          final token =await Prefhelper.gettoken();
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
  }
}

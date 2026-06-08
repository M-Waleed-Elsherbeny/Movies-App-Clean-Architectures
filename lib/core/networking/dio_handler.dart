import 'package:dio/dio.dart';
import 'package:movies_app/core/server/api_constance.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHandler {
  static Dio? dio;
  static Dio? initialDio() {
    const Duration timeout = Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = ApiConstance.baseUrl;
      dio!.options.connectTimeout = timeout;
      dio!.options.receiveTimeout = timeout;
      // dioLogger();
      return dio;
    } else {
      return dio;
    }
  }

  static void dioLogger() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        error: true,
        maxWidth: 90,
      ),
    );
  }
}

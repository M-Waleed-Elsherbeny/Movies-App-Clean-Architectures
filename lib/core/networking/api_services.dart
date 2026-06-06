import 'package:dio/dio.dart';
import 'package:movies_app/core/networking/dio_handler.dart';

class ApiServices {
  Dio? dio;
  ApiServices() {
    dio = DioHandler.initialDio();
  }

  Future<Response> get({
    required String endPoint,
  }) async {
    final response = await dio!.get(
      endPoint,
    );
    return response;
  }
}

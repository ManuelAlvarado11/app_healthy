import 'package:app_vida_saludable/config/constants/environment.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late Dio _dio;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
      ),
    );
  }

  Dio get dio => _dio;
}

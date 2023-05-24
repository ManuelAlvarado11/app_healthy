import 'package:dio/dio.dart';
import 'package:app_vida_saludable/config/constants/environment.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late Dio _dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
      ),
    );
  }

  Dio get dio => _dio;
}

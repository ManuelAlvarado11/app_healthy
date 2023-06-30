import 'package:dio/dio.dart';
import 'package:app_vida_saludable/config/constants/environment.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late Dio _dio;

  factory ApiService({String? accessToken}) {
    _instance._dio.options.headers['Authorization'] = 'Bearer $accessToken';
    return _instance;
  }

  ApiService._internal() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.baseUrl = Environment.apiUrl;
        return handler.next(options);
      },
    ));
  }

  Dio get dio => _dio;
}
